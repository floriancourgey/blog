---
title: SQL Server command line (CMD & PowerShell)
categories: [sql,sql server,cmd,powershell]
---
<p class="text-center">🐍👑🌍</p>
<!--more-->



## `bcp` command

[Microsoft bcp docs](https://docs.microsoft.com/fr-fr/sql/tools/bcp-utility)

```console
> where bcp
C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\bcp.exe
> bcp "select col1 from my_table where col2='ABC';" queryout "C:\Users\Florian\sql-server-bcp.csv" -c -t "," -r "\n" -S myserver.local -T
> bcp -i "C:\Users\Florian\sql-server-bcp-query.sql" queryout "C:\Users\Florian\sql-server-bcp.csv" -c -t "," -r "\n" -S myserver.local -T
```
with:
- `queryout` filepath for the result
- `-t` field separator (`,` `;` `|`)
- `-r` row separator (`\n`)
- `-S` server IP
- `-T` trust connection
- `-i` input file

Full usage:
```console
usage: bcp {dbtable | query} {in | out | queryout | format} datafile
  [-m maxerrors]            [-f formatfile]          [-e errfile]
  [-F firstrow]             [-L lastrow]             [-b batchsize]
  [-n native type]          [-c character type]      [-w wide character type]
  [-N keep non-text native] [-V file format version] [-q quoted identifier]
  [-C code page specifier]  [-t field terminator]    [-r row terminator]
  [-i inputfile]            [-o outfile]             [-a packetsize]
  [-S server name]          [-U username]            [-P password]
  [-T trusted connection]   [-v version]             [-R regional enable]
  [-k keep null values]     [-E keep identity values][-G Azure Active Directory Authentication]
  [-h "load hints"]         [-x generate xml format file]
  [-d database name]        [-K application intent]  [-l login timeout]
```
