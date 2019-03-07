---
title: Use the context in Web Apps in Adobe Campaign
categories: [adobe campaign, automation, javascript, neolane, opensource]
---

The context variable `ctx` is really handy when it comes to have custom behaviors in an Adobe Campaign web app. Sadly, there's not a lot of documentation about it. Let's dig in and see what we can find.

<!-- more -->

## Using the `ctx` variable in the Javascript frontend

Create a dead simple web app with a query on Recipients (named `queryRecipients`) and a page (without transition):
![](/assets/images/2019/03/adobe-campaign-web-app-context-query-page.jpg)

HTML code of the `Page`, using the[ Bootstrap 4 starter template](https://getbootstrap.com/docs/4.3/examples/starter-template/):

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Starter Template · Bootstrap</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
  </head>
  <body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top"><a class="navbar-brand" href="#">Navbar</a> <button class="navbar-toggler" id="input155197075600849" aria-expanded="false" aria-controls="navbarsExampleDefault" aria-label="Toggle navigation" type="button" data-target="#navbarsExampleDefault" data-toggle="collapse"> <span class="navbar-toggler-icon"></span> </button>
    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active"><a class="nav-link" href="#">Home</a></li>
        <li class="nav-item nav-link">Bootstrap 4 starter template</li>
      </ul>
    </div>
    </nav>
    <main class="container mt-5 pt-3"></main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" type="text/javascript"></script>
  </body>
</html>
```

The `ctx` variable is an XML created automatically by Adobe Campaign and injected into the HTML. With `_debug` enabled, it is shown in a `<pre>` block:
![](/assets/images/2019/03/adobe-campaign-web-app-context-debug-ctx.jpg)

It is available as a Javascript `DOMElement` in the frontend with `document.controller.ctx`:
![](/assets/images/2019/03/adobe-campaign-web-app-context-as-javascript-variable.jpg)

*See [w3c reference for DOMElement](https://www.w3schools.com/jsref/dom_obj_all.asp)*

<div class="alert alert-danger text-center">
  <strong>DO NOT EXPOSE ANY SENSITIVE DATA IN `CTX` (credentials, server-side data..)</strong>
</div>

## Using the `ctx` variable in the Javascript backend

This `ctx` var can also be used in the backend `Scripts` and in the `Page` itself. Insert in `<main></main>` the following table:
```html
<table class="table table-bordered table-hover table-striped table-sm">
  <thead>
    <tr><th>@firstName</th><th>@lastName</th><th>@email</th><th>Actions</th></tr>
  </thead>
  <tbody>
    <% for each(var recipient in ctx.queryRecipients.recipient){ %>
    <tr>
      <td><%= recipient.@firstName %></td>
      <td><%= recipient.@lastName %></td>
      <td><%= recipient.@email %></td>
    </tr>
    <% } %>
  </tbody>
</table>
```

Output:
![](/assets/images/2019/03/adobe-campaign-web-app-ctx-list-variables.jpg)

Recap:
![](/assets/images/2019/03/adobe-campaign-web-app-context-show-list.jpg)

## Using `ctx` for interaction between pages

Now that we have a list of recipients, let's display the customer profile of one selected Recipient. First, create a Web app variable which will store the value of the selected recipient id:
![](/assets/images/2019/03/adobe-campaign-web-app-variable-recipientId.jpg)

To enable transitions and interactions between pages, the page must contain a `<form id="page-form>">`. Insert it in the `<main`:
```html
<main>[...]</main>
```
becomes
```html
<main><form method="post" name="page" id="page-form">[...]</form></main>
```

Add a transition named `transition1`, connected to a query where `@id = $([vars/recipientId])` and another page:
![](/assets/images/2019/03/adobe-campaign-web-app-ctx-show-recipient.jpg)


In the first page, add a new `<td>` with a Button as follow:
```html
<td>
  <a href="#" class="btn btn-sm btn-primary"
    onclick="
      document.controller.setValue('/ctx/vars/recipientId', <%= recipient.@id %>);
      document.controller.submit('next', '_self', 'transition1');">
    Show
  </a>
</td>
```

This is made possible via the `setValue(path, value)` and `getValue(path)` functions of `document.controller` which is a `UIController`:
![](/assets/images/2019/03/adobe-campaign-web-app-context-controller-get-set-value.jpg)

and `submit(formAction, formTarget, transitionName)`:
```js
/**
 * inject an <input name="ctx"> in the <form id="page-form">,
 * then submits the form
 */
UIController.prototype.submit = function(a, b, c, d, e){};
```


Save, refresh, click on Show and you'll get this:
![](/assets/images/2019/03/adobe-campaign-web-app-ctx-show-recipient-html.jpg)

## Update a recipient based on `ctx.recipient.@id`

```js
var now = formatDate(new Date(), "%4Y-%2M-%2D %02H:%02N:%02S")

xtk.session.Write(
  <recipient xtkschema="nms:recipient" _operation="update" _key="@id" id={ctx.recipient.@id}
    lastModified={now}
    firstName="New first name"
  />
);
```
