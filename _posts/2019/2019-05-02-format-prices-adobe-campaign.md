---
title: Format prices in Adobe Campaign
categories: [opensource,adobe campaign]
---

<p class="text-center">🐍👑🌍</p>

## Overview

```js
var x = 1234567.89;

// with NL.Locale
loadLibrary('xtk:shared/nl.js'); // for NL
NL.require('/nl/core/jsspcontext.js'); // for NL.Locale
NL.Locale.formatNumber(x) // 1,234,568 (uses default settings from NL.session.locale, see next chapter)
NL.Locale.formatNumber(x, {addSymbol: true}) // $1,234,568

var formatUS = {pattern: '¤#,##0.00', groupSymbol: ',', decimalSymbol: '.', symbol: '$'};
NL.Locale.formatNumber(x, formatUS) // $1,234,567.89

var formatFR = {pattern: '#,##0.00 ¤', groupSymbol: ' ', decimalSymbol: ',', symbol: '€'};
NL.Locale.formatNumber(x, formatFR) // 1 234 567,89 €

// with Format
loadLibrary('xtk:common.js'); // for Format
Format.formatNumber(x) // 1,234,567.89
```

## NL.Locale doc

```js
/**
 * @param {Number} number the number to format
 * @param {mixed} format is the format to use:
 *   string: pattern to use
 *   number: number of decimal places for the formatted value
 *   JSON object:
 *     addSymbol
 *     pattern:
 *       0 - represent any digit
 *       # - represent any digit, 0 is shows as absent
 *       . - decimal separator (replaced by format.decimalSymbol)
 *       - - minus sign (replaced by format.minusSign)
 *       , - grouping separator (replaced by format.groupSymbol)
 *       ¤ - currency sign (\u00A4) (replaced by format.symbol)
 * @param {String, optional} defaultReturn String to use when value is not a valid number
 * @return string
 * @throws {Error} When value is not a valid number and defaultReturn is not defined.
 */
function formatNumber(value, format, defaultReturn)
```
*from `\usr\local\neolane\nl6\datakit\xtk\fra\js\shared\dataTypes.js`*

Get your locale regional settings from the current locale `NL.session.locale`:
```js
logInfo(JSON.stringify(NL.session.locale));
{
   "locale":"en-us",
   "language":"en",
   "settings":{
      "digitGroupingSymbol":",",
      "decimalSymbol":".",
      "shortDate":"%2M/%2D/%4Y",
      "longDate":"%A, %D %B, %4Y",
      "time":"%I:%2N:%2S %P",
      "shortDateTime":"%2M/%2D/%4Y %I:%2N:%2S %P",
      "AmPm":[
         "AM",
         "PM"
      ],
      "shortQuarter":"Q%C %4Y",
      "longQuarter":"%Q %4Y",
      "shortMonth":"%2M/%4Y",
      "longMonth":"%B %4Y",
      "shortWeek":"%4V-W%2W",
      "longWeek":"%4V - Week %2W",
      "shortHour":"%2Hh",
      "longHour":"%2Hh",
      "daysName":[
         "Sunday",
         "Monday",
         "Tuesday",
         "Wednesday",
         "Thursday",
         "Friday",
         "Saturday"
      ],
      "shortDaysName":[
         "Sun",
         "Mon",
         "Tue",
         "Wed",
         "Thu",
         "Fri",
         "Sat"
      ],
      "monthsName":[
         "January",
         "February",
         "March",
         "April",
         "May",
         "June",
         "July",
         "August",
         "September",
         "October",
         "November",
         "December"
      ],
      "quartersName":[
         "1st quarter",
         "2nd quarter",
         "3rd quarter",
         "4th quarter"
      ],
      "timeSpanUnits":{
         "seconds":"s",
         "minutes":"mn",
         "hours":"h",
         "days":"d",
         "months":"m",
         "years":"y"
      },
      "percentSeparator":"",
      "currencySymbol":"$",
      "booleanStrings":{
         "true":"true",
         "false":"false"
      },
      "units":{
         "dataSize":[
            {
               "symbol":"B",
               "factor":1
            },
            {
               "symbol":"kB",
               "factor":1024
            },
            {
               "symbol":"MB",
               "factor":1048576
            },
            {
               "symbol":"GB",
               "factor":1073741824
            }
         ],
         "count":[
            {
               "symbol":"",
               "factor":1
            },
            {
               "symbol":"k",
               "factor":1000
            },
            {
               "symbol":"M",
               "factor":1000000
            },
            {
               "symbol":"G",
               "factor":1000000000
            }
         ]
      },
      "colonSuffix":":",
      "digitGroupingRegEx":{

      }
   }
}
```
