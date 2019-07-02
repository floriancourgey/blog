---
title: Adobe Campaign helpers
categories: [opensource,adobe campaign,tools]
---
Excerpt here...
<p class="text-center">🐍👑🌍</p>
<!--more-->

## SQL helpers

```js
/**
 * Performs an SQL INSERT INTO (no SQL injection protection /!\)
 * @param {object} fields {column1:value1, column2:value2}
 * @returns {number} The number of inserted fields
 * @see sqlExec
 */
function insertInto(table, fields, log){
  if(undefined === log){
    log = false;
  }
  var columns = Object.keys(fields).join(', ');
  var values = Object.keys(fields).map(function(key) {
    var value = fields[key];
    // if it's a string
    // - remove all ' with regex /'/g
    // - wrap with single-quote
    if(typeof(value) == 'string'){
      value = value.replace(/'/g, "");
      value = "'"+value+"'";
    }
    // if it's null, use 'null'
    else if(value == null){
      value = 'null';
    }
    return value;
  }).join(', ');
  var sql = "INSERT INTO "+ table + " ("+columns+") VALUES ( "+values+" )";
  if(log){
    logInfo('Executing '+sql)
  }
  return sqlExec(sql);
}
/**
 * @param {string} tableName ex: 'nms:recipient'
 * @param {NLSchema} srcSchema ex: NLWS.nmsecipient
 * @param {Object} params
 * @param {array} params.where example: [{expr: "@a>1"}, {expr: "@b is null"}]
 * @param {array} params.orderBy example: [{expr: "@id", sortDesc: "false"}]
 */ 
function getOneOrNull(tableName, srcSchema, params){
  var query = NLWS.xtkQueryDef.create({queryDef: {
    schema: tableName,
    operation: "get", 
    select: { node: [
      {expr: "@id"},
    ]},
    where: { condition: []}, 
    orderBy: { node: []}
  }});
  params.where.condition = params.where;
  if(params.orderBy){
    
  }
  var res = query.ExecuteQuery();
  return srcSchema.load(res.@id);
}
```

## Linux server helpers
```js
/**
 * Helper for the ACC execCommand() function
 * @param {string} command the linux command to execute
 * @param {Object} params parameters [to be flexible for evolutions]
 * @param {bool} params.logTheCall if true, calls logInfo(command) (default to true)
 * @param {bool} params.logTheOutput if true, send the output to logInfo (default to true)
 * @param {bool} params.throwOnError if true, throws an exception if linuxResultCode is != 0 (default to false)
 *
 * @example
 * exec('pwd')
 * exec('mkdir -p /a/b/c', {logTheCall:false})
 * exec('mktemp -d', {logTheOutput:false, throwOnError: true}) 
 */
function exec(command, params){
  if(undefined == params){
    params = {};
  }
  if(undefined == params.logTheCall){
    params.logTheCall = true;
  }
  if(undefined == params.logTheOutput){
    params.logTheOutput = true;
  }
  if(undefined == params.throwOnError){
    params.throwOnError = false;
  }
  if(params.logTheCall){
    logInfo('my_nms:helpers | executing |', command);
  }
  var result = execCommand(command, !params.throwOnError); // @return [linux result code, output]
  var lines = result[1].split("\n");
  if(params.logTheOutput){
    for each (var line in lines){ 
      logInfo("" + line);
    }
  }
  return {linuxResultCode: result[0], rawOutput: result[1], lines: lines};
}

/**
 * Calls unix sed to replace a text by another text, in a file
 * Usage of sed: 
 * - sed -i s/regular-expression/replacement-text/flags
 * - -i replace in file instead of in string
 *
 * @param {string} replaceThis the regex to look for
 * @param {string} byThis the string write instead
 * @param {string} inThisFile full path of the file
 * @param {Object} params for exec() params
 *
 * @see https://doc.ubuntu-fr.org/sed
 *
 * @example
 * replaceInFile(',', ';', '/a/b/c/my.csv', {logTheCall:true})
 *
 * @todo replace | by [|] because pipe | in the sed regex must be escaped with [|]
 */
function replaceInFile(replaceThis, byThis, inThisFile, params){
  var command = "sed -i 's/"+replaceThis+"/"+byThis+"/g' '"+inThisFile+"'";
  return exec(command, params);
}

/**
 * Remove carriage returns '\r' in file
 * @param {string} fileFullpath the full path of the file
 * @param {Object} params for exec() params
 */
function removeCarriageReturn(fileFullpath, params){
  replaceInFile('\r', '', fileFullpath, params)
}
```

## FTP folders
```js
/***
 * All the following functions return a string ending with /
 */
/**
 * @return {string} the FTP incoming folder
 */
function getIncoming(){
  return '/sftp/myinstance/incoming/';
}
function getVendor1Incoming(){
  return getIncoming()+'vendor1/';
}
function getVendor1Archive(){
  return getIncoming()+'vendor1/archive/';
}
function getVendor2Incoming(country){
  return getIncoming()+'vendor2/'+country.toLowerCase()+'/';
}
function getVendor2Archive(country){
  return getVendor2Incoming(country)+'archive/'+formatDate(new Date(), '%4Y/%2M')+'/';
}
```

## Log helpers
```js
function LogInfo(){
  var args = Array.prototype.slice.call(arguments); // convert arguments to an array-like, @see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/arguments#Description
  args.unshift('[ACME '+application.buildNumber+' LogInfo] ['+application.operator.login+']: '); // add prefix with brand name, version, type and operator login
  logInfo.apply(null, args); // call standard logInfo() with apply(), @see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply
}

LogInfo('loading file XXX'); // [ACME 4444 LogInfo] [my_login] loading file XXX
LogInfo();                   // [ACME 4444 LogInfo] [my_login]
LogInfo(null);               // [ACME 4444 LogInfo] [my_login] null

function LogWarning(){
  var args = Array.prototype.slice.call(arguments); // convert arguments to an array-like, @see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/arguments#Description
  args.unshift('[ACME '+application.buildNumber+' LogWarning] ['+application.operator.login+']: '); // add prefix with brand name, version, type and operator login
  logWarning.apply(null, args); // call standard logWarning() with apply(), @see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply
}
```

## Currency, money, price
```js
/**
 * Format a price to always have 2 decimals
 * @example
 * formatPrice('12.3') = '12.30'
 *
 * @param {xml|string|int|float} p  the price to format
 * @return {string} the formatted price
 */
function formatPrice(p){
  if(typeof p == 'xml'){
    p = p.toString();
  }
  if(typeof p == 'string'){
    p = parseFloat(p);
  }
  return p.toFixed(2);
}
```
