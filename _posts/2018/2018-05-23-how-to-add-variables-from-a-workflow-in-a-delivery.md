---
title: Add variables from a Workflow in a Delivery in Adobe Campaign
redirect_from: /2018/05/how-to-add-variables-from-a-workflow-in-a-delivery/
categories: [adobe campaign,neolane]
---

You process then create variables in your Workflow and you would like to be able to use them in a delivery? You can! Adobe Campaign allows you to define Delivery Variables which are accessible from your workflow. For example, you can create a CSV in your workflow, and set it as attachment by using `vars.filename`  in the Delivery.

<!--more-->

## Create the variable definition in the Delivery Template

Go to the Delivery Template properties, and use the tab `Variables`. You can add, edit and delete Variables with Data Types such as Text, Integer, Floating Point, DateTime and Long text. Each variable may be mandatory and have a default value.

![](/assets/images/2018/05/Delivery-Template-Properties-Annoted.png)

*Note: The `Name` doesn't matter but the **Order** in which you declare your variables does. Here, `storename` is defined in the second position. It will be later used in the workflow as `variables[1]`, and `storecode` as `variables[2]` (0-index based).*

You can now insert your variables anywhere in your Delivery, in the body and the subject:

![](/assets/images/2018/05/Insert-variables-in-delivery-annoted.jpg)

And also in the attachment definition:

![](/assets/images/2018/05/Variable-in-attachment-annoted.jpg)

## Set variable value in your workflow

In your wokflow, open your Delivery Activity, and use the `Script` tab. In here, you can use `delivery.variables._var[0]`  to set the value of the variables you defined before. `delivery.variables._var`  is an `EntityCollection` 0-index based. So sadly we cannot use `delivery.variables._var['filename']`.

![](/assets/images/2018/05/Create-variables-in-the-WF.jpg)

## Troubleshoot errors

- Check the workflow logs
- Check the delivery logs
- Check your hidden delivery logs, by double-clicking you Delivery, then head to Delivery tab:
![](/assets/images/2018/05/Debug-error-annoted.jpg)


Source:
- [https://forums.adobe.com/thread/2380515](https://forums.adobe.com/thread/2380515)
- [https://forums.adobe.com/thread/2451509](https://forums.adobe.com/thread/2451509)
