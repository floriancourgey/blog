---
title: Use Db, the database class in PrestaShop 1.7
permalink: /2018/04/use-db-the-database-class-in-prestashop-1-7/
categories: [prestashop, prestashop 1.7]
---

Tired of using raw SQL? `SELECT * from _DB_PREFIX_.customer` is dead! Use the chainable API provided by Prestashop with its `DbQuery` class:

<!--more-->

```php
// fetch Categories as array of array
$categoriesArray = (Db::getInstance())->executeS((new DbQuery())
  ->from('category', 'c')
  ->where('c.level_depth > 2')
  ->where('c.id_category > 42')
  ->join('JOIN '._DB_PREFIX_.'shop s ON s.id_shop=c.id_shop_default') // raw SQL join
  ->innerJoin('category_lang', 'cl', 'cl.id_category=c.id_category') // formatted SQL join via function params
  ->groupBy('c.id_category')
  ->orderBy('c.id_category ASC')
);// [ [], []..]

// then convert them to array of Object Category
$categories = ObjectModel::hydrateCollection('Category', $categoriesArray); // [Category, Category..]

// you can also edit the query based on conditions
$query = (new DbQuery())
  ->from('category', 'c')
  ->where('c.id > 42')
  ->join('JOIN '._DB_PREFIX_.'shop s ON s.id_shop=c.id_shop_default')
);
if(Tools::getValue('only-high-level-depth')){
  $query->where('c.level_depth > 2');
}
$categoriesArray = (Db::getInstance())->executeS($query);

// want to debug the generated SQL code?
$sql = $query->build(); // SELECT * from...
```

From classes/db/DbQuery.php
```php
DbQuery::select($fields)
DbQuery::from($table, $alias = null) // will append _DP_PREFIX_ automatically
DbQuery::join($fields)
DbQuery::innerJoin($table, $alias = null, $on = null)// will append _DP_PREFIX_ automatically
DbQuery::leftJoin($table, $alias = null, $on = null)// will append _DP_PREFIX_ automatically
DbQuery::where($restriction)
DbQuery::having($restriction)
DbQUery::orderBy($fields)
DbQUery::groupBy($fields)
DbQuery::limit($limit, $offset = 0)
```

## Perfom a COUNT query

```php
# raw
(Db::getInstance())->getValue('SELECT Count(*) from '._DB_PREFIX_.'category where level_depth>2')
# DbQuery
(Db::getInstance())->executeS((new DbQuery()
  ->from('category')
  ->select('Count(*)')
  ->where('level_depth>2')
))
```

## Full documentation

Taken from Github classes/db/Db.php

```php
/**
* Executes a query
*
* @param string|DbQuery $sql
* @param bool $use_cache
* @return bool
*/
public function execute($sql, $use_cache = true)

/**
* Executes return the result of $sql as array
*
* @param string|DbQuery $sql Query to execute
* @param bool $array Return an array instead of a result object (deprecated since 1.5.0.1, use query method instead)
* @param bool $use_cache
* @return array|false|null|mysqli_result|PDOStatement|resource
* @throws PrestaShopDatabaseException
*/
public function executeS($sql, $array = true, $use_cache = true)

/**
* Executes an INSERT query
*
* @param string $table Table name without prefix
* @param array $data Data to insert as associative array. If $data is a list of arrays, multiple insert will be done
* @param bool $null_values If we want to use NULL values instead of empty quotes
* @param bool $use_cache
* @param int $type Must be Db::INSERT or Db::INSERT_IGNORE or Db::REPLACE
* @param bool $add_prefix Add or not _DB_PREFIX_ before table name
* @return bool
* @throws PrestaShopDatabaseException
*/
public function insert($table, $data, $null_values = false, $use_cache = true, $type = Db::INSERT, $add_prefix = true)

/**
* Executes an UPDATE query
*
* @param string $table Table name without prefix
* @param array $data Data to insert as associative array. If $data is a list of arrays, multiple insert will be done
* @param string $where WHERE condition
* @param int $limit
* @param bool $null_values If we want to use NULL values instead of empty quotes
* @param bool $use_cache
* @param bool $add_prefix Add or not _DB_PREFIX_ before table name
* @return bool
*/
public function update($table, $data, $where = '', $limit = 0, $null_values = false, $use_cache = true, $add_prefix = true)

/**
* Executes a DELETE query
*
* @param string $table Name of the table to delete
* @param string $where WHERE clause on query
* @param int $limit Number max of rows to delete
* @param bool $use_cache Use cache or not
* @param bool $add_prefix Add or not _DB_PREFIX_ before table name
* @return bool
*/
public function delete($table, $where = '', $limit = 0, $use_cache = true, $add_prefix = true)

/**
* Returns an associative array containing the first row of the query
* This function automatically adds "LIMIT 1" to the query
*
* @param string|DbQuery $sql the select query (without "LIMIT 1")
* @param bool $use_cache Find it in cache first
* @return array|bool|object|null
*/
public function getRow($sql, $use_cache = true)

/**
 * Generates query and return SQL string
 *
 * @return string
 * @throws PrestaShopException
 */
public function build()

// A few other methods (public non static)
public function Insert_ID() // returns the ID created during the latest INSERT query.
public function Affected_Rows() // returns the number of lines impacted by the latest UPDATE or DELETE query.
public function getMsgError() // returns the latest error message, if the query has failed.
public function getNumberError() // returns the latest error number, if the query has failed.
```

## Physical data model - MPD
![Relationships (1-1 & 1-N) between Prestashop tables](/assets/images/2018/04/prestashop-mpd-large.gif)

*Source: [https://www.prestashop.com/fr/blog/nouveaux_outils_pour_les_developpeurs](https://www.prestashop.com/fr/blog/nouveaux_outils_pour_les_developpeurs)*
