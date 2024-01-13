---
title: Salesforce Marketing Cloud REST API for external calls (SOAP UI, Postman..)
categories: [salesforce,opensource]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

## Get token
1. Create client id & secret on Installed Packages>Components "API Integration" `/cloud/#app/Setup/InstalledPackages`
1. Create a request with parameters from Step #1, endpoint `https://xxx.auth.marketingcloudapis.com/v2/token` and the following body:

```json
{
  "grant_type": "client_credentials",
  "client_id": "[client id]",
  "client_secret": "[client secret]",
  "scope": "email_read email_write email_send",
  "account_id": "[account id]"
}
```

Response:
```json
{
    "access_token": "eyJhbGciOiJIUzI1NiIsxxx",
    "token_type": "Bearer",
    "expires_in": 1079,
    "scope": "email_read email_write email_send",
    "soap_instance_url": "https://xxx.soap.marketingcloudapis.com/",
    "rest_instance_url": "https://xxx.rest.marketingcloudapis.com/"
}
```

## REST Call

1. Create another request with the endpoint set as the previous `rest_instance_url`
1. Use below request with endpoint `[rest_instance_url]messaging/v1/email/messages/`

```json
{
  "definitionKey": "[transactionalDefKey]",
  "recipients": [{
      "contactKey": "[contactId]",
      "to": "[contactEmail]",
      "attributes": {
        "FirstName": "John",
        "LastName": "Doe"
      }
  }]
}
```

Response:
```json
{
    "requestId": "xxx",
    "errorcode": 0,
    "responses": [
        {
            "messageKey": "xxx"
        }
    ]
}
```
