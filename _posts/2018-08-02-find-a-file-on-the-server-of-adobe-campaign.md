---
id: 901
title: Find a file on the server of Adobe Campaign
date: 2018-08-02T18:46:16+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=901
permalink: /2018/08/find-a-file-on-the-server-of-adobe-campaign/
tinymce-comment-field_enabled:
  - "1"
categories:
  - adobe campaign
  - hacking
  - javascript
  - linux
  - neolane
  - opensource
---
Create a JS Activity like this:

<img class="aligncenter size-full wp-image-902" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/js-activity.jpg?resize=401%2C118&#038;ssl=1" alt="" width="401" height="118" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/js-activity.jpg?w=401&ssl=1 401w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/js-activity.jpg?resize=300%2C88&ssl=1 300w" sizes="(max-width: 401px) 100vw, 401px" data-recalc-dims="1" />

We have no knowledge of the server, let&#8217;s start our digging with some basic commands:

<pre class="lang:js decode:true">execCommand("id");</pre>

The workflow finishes with success, but there&#8217;s no output. Edit it like this:

<pre class="lang:js decode:true">var result = execCommand("id");
logInfo(result); // 0,uid=XXXX (aaa) gid=YYYY (bbb) groups=...</pre>

Because <span class="lang:js decode:true crayon-inline ">execCommand</span>  signature is as follow:

<pre class="lang:js decode:true">/**
 * @param cmd Bash command to be executed on the server
 * @return array[int status, string response]
 * @throw Exception if 
 *   - command failed
 *   - the neolane user doesn't have the "createProcess" right
 */
function execCommand(string cmd): array</pre>

So we can wrap this up in a helper function:

<pre class="lang:js decode:true">function exec(command, log){
  if(log){
    logInfo('cus:helpers | executing | '+command);
  }
  var result = execCommand(command);
  var lines = result[1].split("\n");
  if(log){
    for each (var line in lines){ 
      logInfo("" + line);
    }
  }
  return lines;
}</pre>

And therefore, use it this way:

<pre class="lang:js decode:true ">exec('id', true); // ...
exec('pwd', true); // /usr/local/neolane/[...]
exec('cat /etc/issue', true); // Debian GNU/Linux X
exec('uname -a', true); // Linux [...]
exec("cat ~/.bashrc", true) // # ~/.bashrc: executed by bash(1) for non-login shells. [...]

// find file
exec('cd ../../ && pwd && find ./ -name facebookConnector.js', true)
exec('cd ../../ && pwd && find ./ -name twitterConnector.js', true)

// read file
exec('cd ../../ && pwd && cat deprecated/server/nms/facebookConnector.js', true)
exec('cd ../../ && pwd && cat datakit/nms/eng/js/twitterConnector.js', true)

// find where the text " is mandatory." is defined
exec("cd ../../ && pwd && grep --include=\*.xml -rnw . -e ' is mandatory.' ", true); // 08/02/2018 2:53:11 PM	js2222	./datakit/nms/eng/package/systemStrings.xml:116:  &lt;dictionaryString locale="en" context="system" object-id="0" sourceId="requiredLog" status="2" text="Field '{1}' is mandatory."&gt;

// Apache info
exec('cat /etc/apache2/apache2.conf', true) // display
exec('cp /etc/apache2/apache2.conf /sftp/[...]/', true) // copy to your ftp
exec("cat /etc/apache2/envvars &gt;&gt; /sftp/[...]/", true) // echo to a file</pre>

Also, you can get the content of you serverConf.xml with [this tutorial](https://floriancourgey.com/2018/10/get-the-content-of-your-serverconf-xml-in-adobe-campaign/)