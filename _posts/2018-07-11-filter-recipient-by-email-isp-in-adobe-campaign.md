---
id: 797
title: Filter Recipient by Email ISP in Adobe Campaign
date: 2018-07-11T19:39:16+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=797
permalink: /2018/07/filter-recipient-by-email-isp-in-adobe-campaign/
categories:
  - adobe campaign
  - opensource
---
Adobe Campaign automatically creates @emailDomain, but it isn&#8217;t enough if you need to target multiple recipients based on their ISPs: Microsoft gathers Live, Hotmail and Outlook, while Google uses gmail and google*.

<!--more-->

## Objective

Have a filter in your lists and workflows:

<img class="aligncenter size-full wp-image-798" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Filter-on-email-ISP.jpg?resize=370%2C196&#038;ssl=1" alt="" width="370" height="196" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Filter-on-email-ISP.jpg?w=370&ssl=1 370w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Filter-on-email-ISP.jpg?resize=300%2C159&ssl=1 300w" sizes="(max-width: 370px) 100vw, 370px" data-recalc-dims="1" />

And get insights such as Distribution of values!

## Step 1: Create the enumeration

In Administration > Platform > Enumeration > New

<img class="aligncenter size-full wp-image-802" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Enumeration-EmailISP.jpg?resize=525%2C232&#038;ssl=1" alt="" width="525" height="232" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Enumeration-EmailISP.jpg?w=660&ssl=1 660w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Enumeration-EmailISP.jpg?resize=300%2C133&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

## Step 2: Extend the Data schema

Use an extended Recipient data schema (see [https://docs.campaign.adobe.com/doc/AC/en/CFG\_Editing\_schemas\_Extending\_a_schema.html](https://docs.campaign.adobe.com/doc/AC/en/CFG_Editing_schemas_Extending_a_schema.html)) in Administration > Configuration > Data schemas.

<pre class="lang:xhtml decode:true ">&lt;srcSchema extendedSchema="nms:recipient" name="recipient" namespace="cus"&gt;
  &lt;element name="recipient"&gt;
    &lt;attribute dbEnum="EmailISP" label="Email ISP" name="emailISP" type="string"
      expr="Case(   When(MemoContains(@domain, 'yahoo'), 'Yahoo'),   When(MemoContains(@domain, 'ymail'), 'Yahoo'),   When(MemoContains(@domain, 'rocketmail'), 'Yahoo'),   When(MemoContains(@domain, 'outlook'), 'Microsoft'),   When(MemoContains(@domain, 'live'), 'Microsoft'),   When(MemoContains(@domain, 'hotmail'), 'Microsoft'),   When(MemoContains(@domain, 'google'), 'Google'),   When(MemoContains(@domain, 'gmail'), 'Google'),   When(MemoContains(@domain, 'facebook'), 'Facebook'),   When(MemoContains(@domain, 'aol'), 'AOL'),   When(MemoContains(@domain, 'netscape'), 'AOL'),   When(MemoContains(@domain, 'aim'), 'AOL'),   When(MemoContains(@domain, 'orange'), 'Orange'),   When(MemoContains(@domain, 'wandoo'), 'Orange'),   When(MemoContains(@domain, 'yandex'), 'Yandex'),   When(MemoContains(@domain, 'icloud'), 'Apple'),   When(MemoContains(@domain, 'apple'), 'Apple'),   Else('Other') )"
      /&gt;
  &lt;/element&gt;
&lt;/srcSchema&gt;</pre>

&nbsp;

The attribute <span class="lang:xhtml decode:true crayon-inline">dbEnum</span> contains the following formula:

<pre class="lang:js decode:true">Case(
  When(MemoContains(@domain, 'yahoo.'), 'Yahoo'),
  When(MemoContains(@domain, 'ymail.'), 'Yahoo'),
  When(MemoContains(@domain, 'rocketmail.'), 'Yahoo'),
  When(MemoContains(@domain, 'outlook.'), 'Microsoft'),
  When(MemoContains(@domain, 'live.'), 'Microsoft'),
  When(MemoContains(@domain, 'hotmail.'), 'Microsoft'),
  When(MemoContains(@domain, 'google'), 'Google'),
  When(MemoContains(@domain, 'gmail'), 'Google'),
  When(MemoContains(@domain, 'facebook'), 'Facebook'),
  When(MemoContains(@domain, 'aol'), 'AOL'),
  When(MemoContains(@domain, 'netscape'), 'AOL'),
  When(MemoContains(@domain, 'aim'), 'AOL'),
  When(MemoContains(@domain, 'orange'), 'Orange'),
  When(MemoContains(@domain, 'wandoo'), 'Orange'),
  When(MemoContains(@domain, 'yandex'), 'Yandex'),
  When(MemoContains(@domain, 'icloud'), 'Apple'),
  When(MemoContains(@domain, 'apple'), 'Apple'),
  Else('Other')
)</pre>

&nbsp;

This will map the following domains to their main email providers:

&nbsp;

<table style="border-collapse: collapse; width: 100%;" border="1">
  <tr>
    <th style="width: 20.862%;">
      Email provider
    </th>
    
    <th style="width: 14.6552%;">
      Regex
    </th>
    
    <th style="width: 64.3104%;">
      Example
    </th>
  </tr>
  
  <tr>
    <td style="width: 20.862%;">
      <strong>Yahoo</strong>
    </td>
    
    <td style="width: 14.6552%;">
      yahoo.*</p> 
      
      <p>
        ymail.*
      </p>
      
      <p>
        rocketmail.*</td> 
        
        <td style="width: 64.3104%;">
          yahoo.ca, yahoo.cn, yahoo.co.id, yahoo.co.in, yahoo.com, yahoo.com.ar, yahoo.com.au, yahoo.com.br, yahoo.com.cn, yahoo.com.hk, yahoo.com.mx, yahoo.com.my, yahoo.com.ph, yahoo.com.sg, yahoo.com.tw, yahoo.com.vn, yahoo.co.nz, yahoo.co.uk, yahoo.de, yahoo.dk, yahoo.es, yahoo.fr, yahoo.gr, yahoo.ie, yahoo.in, yahoo.it, yahoo.no, yahoo.se, ymail.com, rocketmail.com
        </td></tr> 
        
        <tr>
          <td style="width: 20.862%;">
            <strong>Microsoft</strong>
          </td>
          
          <td style="width: 14.6552%;">
            hotmail.*</p> 
            
            <p>
              live.*
            </p>
            
            <p>
              oultook.*
            </p>
            
            <p>
              msn.*</td> 
              
              <td style="width: 64.3104%;">
                hotmail.be, hotmail.ca, hotmail.ch, hotmail.cl, hotmail.co.jp, hotmail.com, hotmail.com.ar, hotmail.com.au, hotmail.com.br, hotmail.co.nz, hotmail.co.th, hotmail.co.uk, hotmail.de, hotmail.es, hotmail.fr, hotmail.gr, hotmail.it, hotmail.nl, hotmail.no, hotmail.se, live.be, live.ca, live.cl, live.com, live.com.ar, live.com.au, live.com.mx, live.com.pt, live.com.sg, live.co.uk, live.co.za, live.de, live.dk, live.fr, live.ie, live.it, live.nl, live.no, live.se, msn.com, netcabo.pt, outlook.com, outlook.es, outlook.fr, outlook.it
              </td></tr> 
              
              <tr>
                <td style="width: 20.862%;">
                  <strong>Google</strong>
                </td>
                
                <td style="width: 14.6552%;">
                  google*</p> 
                  
                  <p>
                    gmail.*</td> 
                    
                    <td style="width: 64.3104%;">
                      gmail.com, google.com, googlemail.com
                    </td></tr> 
                    
                    <tr>
                      <td style="width: 20.862%;">
                      </td>
                      
                      <td style="width: 14.6552%;">
                      </td>
                      
                      <td style="width: 64.3104%;">
                      </td>
                    </tr>
                    
                    <tr>
                      <td style="width: 20.862%;">
                      </td>
                      
                      <td style="width: 14.6552%;">
                      </td>
                      
                      <td style="width: 64.3104%;">
                      </td>
                    </tr>
                    
                    <tr>
                      <td style="width: 20.862%;">
                      </td>
                      
                      <td style="width: 14.6552%;">
                      </td>
                      
                      <td style="width: 64.3104%;">
                      </td>
                    </tr></tbody> </table> 
                    
                    <p>
                      &nbsp;
                    </p>
                    
                    <h2>
                      Step 4: Enjoy!
                    </h2>
                    
                    <p>
                      Save, disconnect, reconnect and&#8230; Enjoy 🍾
                    </p>
                    
                    <p>
                      <img class="aligncenter size-full wp-image-799" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Get-distribution-of-values-for-email-ISP.jpg?resize=431%2C247&#038;ssl=1" alt="" width="431" height="247" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Get-distribution-of-values-for-email-ISP.jpg?w=431&ssl=1 431w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Get-distribution-of-values-for-email-ISP.jpg?resize=300%2C172&ssl=1 300w" sizes="(max-width: 431px) 100vw, 431px" data-recalc-dims="1" />
                    </p>
                    
                    <p>
                      <em>Based on domains and services providers listed on <a href="https://email-verify.my-addr.com/top-email-service-providers.php">https://email-verify.my-addr.com/top-email-service-providers.php</a> and on <a href="https://en.wikipedia.org/wiki/Comparison_of_webmail_providers">https://en.wikipedia.org/wiki/Comparison_of_webmail_providers</a></em>
                    </p>