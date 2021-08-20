---
title: How to send an email from Javascript?
categories: [automation,javascript,opensource,zapier]
---

Have you ever wanted to send an email from client-side? You only have javascript at your disposal but you don't want your customers to be able to see your credentials? Don't make a PHP app just fot his, use Zapier! You don't need any private credentials and you can monitor logs and errors from a cloud-based environment.

<!--more-->

Create your Zap with "Catch Hook - Send Outbound email": https://zapier.com/app/editor/template/62

![todo](/assets/images/2018/05/js-send-emails-zapier-hook.png)

Zapier will give you an URL to send your data, such as https://hooks.zapier.com/hooks/catch/123456/abcdef/

You can then call from you Javascript:

```js
var data = {
  "email": "your-customer@email.com",
  "data1": "123",
  "data2": "456"
}
try {
  var xhr = new XMLHttpRequest();
  xhr.open("POST", 'https://hooks.zapier.com/hooks/catch/123456/abcdef/');
  xhr.send(JSON.stringify(data));
  console.log("Pushed to Zapier successfully!");
  alert('Success');
} catch(e) {
  console.error(e);
  alert('Error')
}
```

Here you go! You can then monitor all your calls from a single place:

![todo](/assets/images/2018/05/js-send-emails-zapier-task-history.png)
