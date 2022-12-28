---
title: Create Raw data in workflow Temporary table on Adobe Campaign
categories: [opensource,adobe campaign]
---

Insert raw data from any source (csv, xml, http web calls...) to a workflow temp table for custom treatment!

<p class="text-center">🐍👑🌍</p>

<!--more-->

Workflow temporary tables may be altered from custom Javascript (or SQL) activities to manage columns & records. This trick works from a data perspective as the records are saved in SQL. However, this goes beyong standard features and causes surprising display results.

The "Setup" chapter covers how to manage columns & records, and the "Analysis" chapter gives more details.

## Setup

- Workflow content: 1 Query, 3 Javascript
- Analysis: 
  - Data is saved with success in `vars.tableName`
  - Workflow transitions show 0 records
  - "Display target" show records 
  - "Display target" doesn't show the new column
  - Must create 1 Query to init temporary table
  - Only SQL queries from standard "Query" activity are logged
  

Details:
- 1 Query: on any object, with a query returning 0 records, such as `xtk:folder WHERE @id=0`
- Javascript "Insert":
```js
sqlExec('INSERT INTO '+vars.tableName+' (iId) VALUES (1005)');`
```
- Javascript "Create a column & insert a record"
```js
sqlExec('ALTER TABLE '+vars.tableName+' ADD COLUMN sMyColumn VARCHAR(64)');
sqlExec('INSERT INTO '+vars.tableName+' (iId, sMyColumn) VALUES (1005, \'hello world\')');
```

- Javascript "Read"
```js
var xml = sqlSelect("collection,@id,@myColumn", "SELECT iId, sMycolumn as id FROM "+vars.tableName);
logInfo(xml.toXMLString());
```

Workflow activities:

![](/assets/images/2022/adobe-campaign-workflow-temporary-table-add-column.jpg)

Workflow SQL logs:

![](/assets/images/2022/adobe-campaign-workflow-temporary-table-add-column-sql-logs.jpg)

Workflow records:

![](/assets/images/2022/adobe-campaign-workflow-temporary-table-add-column-read-records.jpg)

Workflow "Display target":

![](/assets/images/2022/adobe-campaign-workflow-temporary-table-add-column-view-population.jpg)

## Analysis

Adobe Campaign adds custom SQL queries depending on workflow content:
- Empty workflow --> no SQL query
- Workflow with 1 Query --> SQL query for 1 temporary table
- Workflow with 1 Query and 1 Enrichment --> SQL queries for 2 temporary tables 

Notes: 
- Allow transitions content with "Diagram>Properties>General>" `Keep the result of interim population`
- Allow SQL logging with "Diagram>Properties>Execution>" `Log SQL queries in the journal`

### Empty workflow

- Setup: 1 Start, 1 End
- Analysis: no SQL query

![](/assets/images/2022/adobe-campaign-workflow-temporary-table-empty.jpg)

![](/assets/images/2022/adobe-campaign-workflow-temporary-table-empty-sql-logs.jpg)

### Workflow with Query

- Setup: 1 Query (on xtk:folder WHERE @id=0), 1 End
- Analysis: 2 SQL queries on 1 SQL temporary table

```sql
CREATE UNLOGGED TABLE wkf32382_72_1(iId INTEGER Default 0) WITH (autovacuum_enabled=FALSE, toast.autovacuum_enabled=FALSE);
INSERT INTO wkf32382_72_1 (iId) SELECT  DISTINCT  F0.iFolderId FROM XtkFolder F0 WHERE (F0.iFolderId = 0) AND ((F0.iFolderId > 0 OR F0.iFolderId < 0))
```

![](/assets/images/2022/adobe-campaign-workflow-temporary-table-query.jpg)

![](/assets/images/2022/adobe-campaign-workflow-temporary-table-query-sql-logs.jpg)

![](/assets/images/2022/adobe-campaign-workflow-temporary-table-query-js-vars.jpg)

### Workflow with Query + Enrichment


- Setup: 1 Query (on xtk:folder WHERE @id=0), 1 Enrichment (add @name), 1 End
- Analysis: 4 SQL queries on 2 SQL temporary table

```sql
CREATE UNLOGGED TABLE wkf32382_85_1(iId INTEGER Default 0) WITH (autovacuum_enabled=FALSE, toast.autovacuum_enabled=FALSE);
INSERT INTO wkf32382_85_1 (iId) SELECT DISTINCT  F0.iFolderId FROM XtkFolder F0 WHERE (F0.iFolderId = 0) AND ((F0.iFolderId > 0 OR F0.iFolderId < 0))


CREATE UNLOGGED TABLE wkf32382_87_1(iId INTEGER Default 0) WITH (autovacuum_enabled=FALSE, toast.autovacuum_enabled=FALSE);
INSERT INTO wkf32382_87_1 (iId) SELECT W0.iId FROM wkf32382_85_1 W0 JOIN XtkFolder F1 ON (F1.iFolderId = W0.iId) WHERE ((F1.iFolderId > 0 OR F1.iFolderId < 0))
```

![](/assets/images/2022/adobe-campaign-workflow-temporary-table-enrichment.jpg)

![](/assets/images/2022/adobe-campaign-workflow-temporary-table-enrichment-sql-logs.jpg)
