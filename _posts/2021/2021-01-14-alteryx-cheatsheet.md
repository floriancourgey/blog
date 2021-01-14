---
title: Alteryx Cheatsheet
categories: [alteryx,etl,opensource,data preparation]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

## Input

- `Input Data`: data from source: File, SQL (Microsoft SQL Server, Oracle, MySQL, PostgreSQL), Adobe Analytics, Amazon (S3, Redshift, Aurora), Microsoft (Datalake, Data warehouse, Azure db, Onedrive, Sharepoint), google (big query, sheets, analytics), Salesforce, SAP Hana
- `Directory`: files from local directory
- `Text Input`: raw input by user

## Output
- `Browse`: instant debug data+metadata, column completion, etc
- `Output Data`: output CSV/TSV/JSON/Excel xlsx/Access/Amazon/BigQuery/Qlik View/Tableau/... file

## Data preparation

- `Select`: Set column type (bool, varchar, date, time, datetime, int, float), column name and size
- `Formula`: Update existing columns and/or create new columns with formula. Functions include Substring, Mathematics operations, Conditional if then elseif then else then, File, min/max...
- `Filter`: Filter based on simple criteria (X equal/does not equal/contains/does not contain/null/empty/after/before) or complex with formula. Includes 2 out transitions: `True` for rows matching criteria, and `False` for others

## Transform

- `Summarize`: for GROUP BY equivalent with aggregate on column: group by/min/max/first/last/sum/count/...

## Business Case

1 Sales input file to:
- 1 Sale Header (Tickets) file
- 1 Sale Items (Lines) file

Using Input Data, Select, Filter, Browse, Summarize, and Output Data

![](/assets/images/2021/alteryx-business-case-sale-splitter.jpg)
