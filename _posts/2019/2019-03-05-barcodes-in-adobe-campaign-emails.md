---
title: Barcodes and QR codes in Adobe Campaign Deliveries
categories: [opensource,adobe campaign,email,delivery]
---
How to use QR codes, barcodes (EAN-8, EAN-128), ISBN or any code used in retail industry in Adobe Campaign with recipient customization.
<p class="text-center">📊📧🌍</p>
<!--more-->
## Preview
The goal here is to send a custom email per recipient. Each customer will receive an email with its own code. It can be displayed in plain text, as a EAN-128 barcode or as a QR code:
![](/assets/images/2019/03/adobe-campaign-barcode-in-email-delivery-preview.jpg)

It can then be read using any device, such as an iPhone 7 with the default Camera app:
![](/assets/images/2019/03/adobe-campaign-barcode-in-email-delivery-read-by-iphone.jpg)

## Edit the recipient data schema
Add a new field in your recipient data schema to store the coupon code:
```xml
<srcSchema _cs="Recipients (fco)" entitySchema="xtk:srcSchema"    
  extendedSchema="nms:recipient" name="recipient" namespace="fco" xtkschema="xtk:srcSchema">
  <element name="recipient">
    <attribute label="Coupon Code" name="couponCode" type="string"/>
  </element>
</srcSchema>
```

## Create the Email delivery
![](/assets/images/2019/03/adobe-campaign-barcode-delivery-set-up.jpg)

The images for the barcodes are generated using the built-in tools `Include`
![](/assets/images/2019/03/adobe-campaign-delivery-insert-barcode.jpg)

It automatically creates an image generated on the server with the following URLs:
- Barcode
  - Generic: http://instance.com/barcode/tEAN128/h`height`/s`scale`/v`couponCode`/barcode.gif
  - Example: <http://10.23.87.90:8080/barcode/tEAN128/h100/s1/v91842/barcode.gif>
  - ![](/assets/images/2019/03/adobe-campaign-generated-barcode-ean-gif.jpg)
  - In JS:
  ```html
  http://10.23.87.90:8080/barcode/tEAN128/h100/s1/v<%= encodeURIComponent(recipient.couponCode).replace(/%2F/gi,'/')%>/barcode.gif">
  ```
- QR Code
  - Generic: http://instance.com/barcode/tQRCode/h`height`/w`width`/eH/v`couponCodeInBase64`/barcode.gif
  - Example: <http://10.23.87.90:8080/barcode/tQRCode/h100/w100/eH/vOTE4NDI=/barcode.gif>, where `OTE4NDI=` is the base 64 value of `91842`
  - ![](/assets/images/2019/03/adobe-campaign-generated-qr-code-gif.jpg)
  - In JS:
  ```html
  <% var qrCodeMemBuf = new MemoryBuffer(); qrCodeMemBuf.fromString(recipient.couponCode); %>
  http://10.23.87.90:8080/barcode/tQRCode/h100/w100/eH/v<%= qrCodeMemBuf.toBase64() %>/barcode.gif
  ```

*Reference: <https://docs.campaign.adobe.com/doc/AC/en/DLV_Sending_emails_Inserting_a_barcode_in_an_email.html>*

## Appendixes
### Generate coupon codes
Coupon codes can come from any source, I used <https://www.generatedata.com> with 2 fields: email and 5 random numbers.

Then in a workflow, create a `Data Loading File` (it can be a query from staging table too), connected to an `Enrichment` (Simple Join 1-1 on `@email`), a `Change dimension` and an `Update data`:

![](/assets/images/2019/03/adobe-campaign-coupon-codes-generation-workflow.jpg)

![](/assets/images/2019/03/adobe-campaign-coupon-codes-generation-enrichment.jpg)
