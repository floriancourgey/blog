---
title: Use Node-RED for automation
author: Florian Courgey
layout: post
categories:
  - node-red
  - nodejs
  - automation
  - opensource
  - home automation
---
We'll cover a simple example of sending a slack message every morning to get the day weather's forecast: min-max temp and an emoji depicting what the sky will be like, using OpenWeatherMap free API.

<!--more-->

![todo](/assets/images/2018/11/node-red-flow-final.png)
![todo](/assets/images/2018/11/node-red-mobile-notification-slack.jpg)

## Intro
The goal is to create an automated bot that sends weather information every morning on a slack channel with 0 code (or maybe a maximum of 20 lines).
To do so, we're going to use [Node-RED](https://nodered.org/), an automation tool based on a visual interface to query APIs and trigger external tools. See it like a free, highly customizable and self-hosted [IFTTT](https://ifttt.com/).
Each action is a Node and is connected to another ones/ones with `wires`.

## Install and run
[Node red install doc]()
```bash
$ node -v # >=  8.x
$ sudo npm install -g --unsafe-perm node-red # install node red globally
$ node-red # will create a ~/.node-red folder to store config & data
```
```bash
Welcome to Node-RED
===================
22 Nov 21:53:17 - [info] Node-RED version: v0.19.5
22 Nov 21:53:17 - [info] Node.js  version: v8.12.0
22 Nov 21:53:23 - [info] User directory : /home/florian/.node-red
22 Nov 21:53:23 - [info] Server now running at http://127.0.0.1:1880/
```

Go ahead and open `http://127.0.0.1:1880/` or `http://your-server.com:1880/`, you'll have an empty flow open by default:
![todo](/assets/images/2018/11/node-red-empty-flow.png)

## Discover
Drag n drop an `inject`, a `debug`, connect them together, hit Deploy, click on the blue square on the left of the inject node and open the debug console:
![todo](/assets/images/2018/11/node-red-discovery.png)

This is the very first step! This is what happened:
- `inject` creates a global Javascrippt object `msg` with the key `payload` containing the actual int timestamp
- `inject` sends it to the `Debug`
- `debug` displays in the console the default configured output `msg.payload`

Double-clicking on the Debug node displays the configuration:
![todo](/assets/images/2018/11/node-red-node-details.png)

## Build the weather bot
### Connect to Open Weather Map
Create API key on [Open Weather Map](https://openweathermap.org) or use the default one for testing https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22

Look for the node `http request`, set the endpoint and change the return to be a JSON object:
![todo](/assets/images/2018/11/node-red-http-request.png)

Deploy and run!
![todo](/assets/images/2018/11/openweathermap-via-node-red.png)

And it took what, 5 min? Sweeet...
### Format
Use the `template` node a little bit of moustache templating and here we are:
![todo](/assets/images/2018/11/nodered-format-moustache.png)
![todo](/assets/images/2018/11/node-red-open-weather-call.png)

### Send to Slack
Install the [Node red slack module](https://flows.nodered.org/node/node-red-contrib-slack)
```bash
npm install node-red-contrib-slack
```
Make sure you have a webhook configured on your slack, i.e. [https://floriancourgey.slack.com/apps/manage/custom-integrations](https://floriancourgey.slack.com/apps/manage/custom-integrations):
![todo](/assets/images/2018/11/slack-webhook-config.png)

### CRON it with Node RED
Think of using it on a daily basis? Node RED has a much easier system than Linux's CRONs.

Open up the `inject` node and define the Regular setting.
![todo](/assets/images/2018/11/node-red-timestamp-cron.png)
