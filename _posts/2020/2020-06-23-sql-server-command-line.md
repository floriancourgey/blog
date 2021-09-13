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
> bcp "select col1 from my_table where col2='ABC';" queryout sql-server-bcp.csv -c -t "," -r "\n" -S myserver.local -T
> bcp -i "C:\Users\Florian\sql-server-bcp-query.sql" queryout "C:\Users\Florian\sql-server-bcp.csv" -c -t "," -r "\n" -S myserver.local -T
> bcp "select col1,col2 from [db].[dbo].[view1] where market='X'" queryout abc.txt -S server.local -T -c -t "," -r "\n" -C 65001
```
with:
- `queryout` filepath for the result file
- `-t` field separator (`,` `;` `|`)
- `-r` row separator (`\n`)
- `-S` server IP
- `-T` trust connection
- `-i` input file
- `-C` character encoding, use `65001` for UTF-8

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
