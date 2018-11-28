---
id: 838
title: Sub-workflow activity in Adobe Campaign
date: 2018-07-20T14:42:50+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=838
permalink: /2018/07/sub-workflow-activity-in-adobe-campaign/
categories:
  - adobe campaign
  - automation
  - javascript
  - neolane
  - opensource
---
Your workflows contain too many activities? You&#8217;re lost between your jumps, transitions and end activities? Consider using a sub-workflow with the tutorial below. This way, you can have workflows as tiny as possible, they&#8217;re are way easier to maintain!

<!--more-->

## Objective

This Master workflow (with some init variables)

<img class="aligncenter size-full wp-image-840" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master.jpg?resize=525%2C98&#038;ssl=1" alt="" width="525" height="98" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master.jpg?w=968&ssl=1 968w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master.jpg?resize=300%2C56&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master.jpg?resize=768%2C143&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

is going to call the child workflow (which will edit these variables)

<img class="aligncenter size-full wp-image-839" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child.jpg?resize=525%2C160&#038;ssl=1" alt="" width="525" height="160" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child.jpg?w=1115&ssl=1 1115w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child.jpg?resize=300%2C91&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child.jpg?resize=768%2C234&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child.jpg?resize=1024%2C312&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

We will also discuss [Pros & Cons](#pros-and-cons) of this approach, and what we can do to [go further](#going-further) with for example a File Collector/File Transfer.

## Step 1. Setup the Master workflow

<img class="aligncenter size-full wp-image-841" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-step-1.jpg?resize=525%2C133&#038;ssl=1" alt="" width="525" height="133" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-step-1.jpg?w=560&ssl=1 560w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-step-1.jpg?resize=300%2C76&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

Where <span class="lang:default decode:true crayon-inline ">set x=1</span>  contains:

<pre class="lang:js decode:true">instance.vars.x = 1</pre>

And <span class="lang:default decode:true crayon-inline ">print x</span>  has the following JavaScript code:

<pre class="lang:js decode:true ">logInfo('x: '+instance.vars.x)</pre>

## Step 2. Create the Child sub-workflow

<img class="aligncenter size-full wp-image-839" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child.jpg?resize=525%2C160&#038;ssl=1" alt="" width="525" height="160" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child.jpg?w=1115&ssl=1 1115w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child.jpg?resize=300%2C91&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child.jpg?resize=768%2C234&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child.jpg?resize=1024%2C312&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

There are 2 important things here, the 2 Jumps:

  * The Arrival Jump (on the left) has a priority of 1. If you have multiple Arrival Jumps, Adobe Campaign will use the Arrival Jump with the lowest number.
  * The Starting Jump (on the right) has a priority of 2. If you have multiple Starting Jumps, Adobe Campaign will use the Starting Jump with the highest number.

For the sub-workflow to work correctly, you have to have **only ONE Arrival Jump with the lowest number**, and **only ONE Starting Jump with the highest number**.

For example, if you have Starting Jumps 1, 50 and 100, you should have only ONE Starting Jump with a priority of 100!

See [https://docs.campaign.adobe.com/doc/AC/en/WKF\_Repository\_of\_activities\_Order_activities.html#Sub-workflow](https://docs.campaign.adobe.com/doc/AC/en/WKF_Repository_of_activities_Order_activities.html#Sub-workflow) for reference

Then, the test Activity is really standard, made just for the example here:

<img class="aligncenter size-full wp-image-843" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child-test-activity.jpg?resize=525%2C549&#038;ssl=1" alt="" width="525" height="549" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child-test-activity.jpg?w=568&ssl=1 568w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child-test-activity.jpg?resize=287%2C300&ssl=1 287w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

## Step 3. Complete the Master Activity

Open the Sub-workflow Activity, and Select the Child Sub-workflow, it will automatically create an outbound transition with the label of the Starting Jump in the Child Sub-Workflow.

<img class="aligncenter size-full wp-image-844" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-Link-to-Child.gif?resize=400%2C237&#038;ssl=1" alt="" width="400" height="237" data-recalc-dims="1" />

Finish the workflow by adding what you need. Here, we&#8217;re just gonna print the value of <span class="lang:default decode:true crayon-inline">x</span>:

<img class="aligncenter size-full wp-image-845" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-final-step.jpg?resize=525%2C71&#038;ssl=1" alt="" width="525" height="71" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-final-step.jpg?w=903&ssl=1 903w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-final-step.jpg?resize=300%2C41&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-final-step.jpg?resize=768%2C104&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## Step 4. Run and Enjoy!

Go ahead and run the Master workflow. You can see the transition arrows getting blue until they hit the End Activity. Well done! Go back to the Child sub-workflow, and refresh it.

What?? It stays in &#8220;Being Edited&#8221; mode, no transition has been executed and the logs are empty. What is going on?

Refresh your folder, and you can see that Adobe Campaign created a third workflow, with the Child WF being a &#8220;template&#8221;.

Ok. But what happened? <span class="lang:default decode:true crayon-inline">x</span>  has a value of 1, so in the Child workflow, its value will be updated to 99. Here&#8217;s the log:

<img class="aligncenter size-full wp-image-847" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-logs.jpg?resize=525%2C167&#038;ssl=1" alt="" width="525" height="167" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-logs.jpg?w=777&ssl=1 777w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-logs.jpg?resize=300%2C95&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-logs.jpg?resize=768%2C244&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

&nbsp;

But <span style="text-decoration: underline;">look closely</span>, a couple of things happens:

  * Child logs are empty:<img class="aligncenter size-full wp-image-851" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child-empty-logs.jpg?resize=525%2C228&#038;ssl=1" alt="" width="525" height="228" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child-empty-logs.jpg?w=682&ssl=1 682w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child-empty-logs.jpg?resize=300%2C130&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />
  * Child logs are in the Master logs, labelled by &#8220;subworkflow&#8221;
  * The Child has modified x to 99, and sent it back to the Master, but the modification is not persisted. x is still equal to 1:<img class="aligncenter size-full wp-image-848" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-logs-1.jpg?resize=525%2C167&#038;ssl=1" alt="" width="525" height="167" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-logs-1.jpg?w=777&ssl=1 777w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-logs-1.jpg?resize=300%2C95&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Master-logs-1.jpg?resize=768%2C244&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />
  * Child sub-workflow is still in &#8220;Being Edited&#8221; status, and its transition arrows are untouched:<img class="aligncenter size-full wp-image-852" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child-still-in-Being-Edited-status.jpg?resize=525%2C176&#038;ssl=1" alt="" width="525" height="176" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child-still-in-Being-Edited-status.jpg?w=1348&ssl=1 1348w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child-still-in-Being-Edited-status.jpg?resize=300%2C100&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child-still-in-Being-Edited-status.jpg?resize=768%2C257&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Sub-workflow-Child-still-in-Being-Edited-status.jpg?resize=1024%2C343&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />This means you cannot &#8220;Right click > Display the target&#8221;. Which is a real pain in case of debugging&#8230; This is a major disadvantage of this method (see below for [Pros & Cons](#pros-and-cons))

## Pros & Cons

✅ Pros:

  * Improve readability and maintainability
  * Executed synchronously, so you can wait until the sub-workflow is done

❌ Cons:

  * Unable to Display the target
  * Unable to see the count of intermediate populations
  * Logs are aggregated in the Master workflow
  * Child logs are labelled &#8220;sub-workflow&#8221; so we don&#8217;t know the activity it&#8217;s been called from

## Going further

A typical application of this method would be to have a File Collector in the Master, and for each file, call the Child Workflow. Let&#8217;s do it and check if there&#8217;s any flaw in the process!

Use this Master:

<img class="aligncenter size-full wp-image-861" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-Master.jpg?resize=525%2C144&#038;ssl=1" alt="" width="525" height="144" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-Master.jpg?w=886&ssl=1 886w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-Master.jpg?resize=300%2C82&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-Master.jpg?resize=768%2C211&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

This child

<img class="aligncenter size-full wp-image-860" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-Child.jpg?resize=525%2C95&#038;ssl=1" alt="" width="525" height="95" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-Child.jpg?w=660&ssl=1 660w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-Child.jpg?resize=300%2C54&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

And for example those 3 CSV files:

<img class="aligncenter size-full wp-image-862" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-FTP-listing.jpg?resize=433%2C160&#038;ssl=1" alt="" width="433" height="160" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-FTP-listing.jpg?w=433&ssl=1 433w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-FTP-listing.jpg?resize=300%2C111&ssl=1 300w" sizes="(max-width: 433px) 100vw, 433px" data-recalc-dims="1" />

&nbsp;

Start the master, and here&#8217;s what happens:

<img class="aligncenter size-full wp-image-863" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-Master-logs-annotated.jpg?resize=525%2C324&#038;ssl=1" alt="" width="525" height="324" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-Master-logs-annotated.jpg?w=853&ssl=1 853w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-Master-logs-annotated.jpg?resize=300%2C185&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-Master-logs-annotated.jpg?resize=768%2C474&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

<li style="list-style-type: none;">
  <ul>
    <li>
      The Child is executed 3 times as we have 3 files in the folder
    </li>
    <li>
      The Master waits for all Children to be processed before resuming
    </li>
    <li>
      <span class="lang:js decode:true crayon-inline ">vars.filename</span>  is shared between workflows
    </li>
    <li>
      Adobe Campaign created 3 copies of the Child sub-workflow:<img class="aligncenter size-full wp-image-867" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-3-copies.jpg?resize=525%2C34&#038;ssl=1" alt="" width="525" height="34" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-3-copies.jpg?w=961&ssl=1 961w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-3-copies.jpg?resize=300%2C19&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-3-copies.jpg?resize=768%2C50&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />
    </li>
    <li>
      But they all have empty logs<img class="aligncenter size-full wp-image-866" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-1-copy-with-empty-log.jpg?resize=525%2C106&#038;ssl=1" alt="" width="525" height="106" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-1-copy-with-empty-log.jpg?w=933&ssl=1 933w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-1-copy-with-empty-log.jpg?resize=300%2C61&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/File-Collector-test-1-copy-with-empty-log.jpg?resize=768%2C156&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />
    </li>
  </ul>
</li>

&nbsp;

As an alternative method, you can directly call another workflow with this JavaScript code:

<pre class="lang:js decode:true ">xtk.workflow.PostEvent("myWorkflowInternalName", "signalActivityName", "", &lt;variables var1={vars.var2}/&gt;, false);</pre>

Find more details about this on [the tutorial to call another workflow in Adobe Campaign](https://floriancourgey.com/2018/07/call-another-workflow-in-adobe-campaign/).