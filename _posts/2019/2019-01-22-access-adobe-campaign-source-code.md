---
title: Access to Adobe Campaign Source Code
categories: [opensource,adobe campaign]
---
<p class="text-center">⬇️📦🎯</p>
<!--more-->

1. Go to the Software Distribution page (https://experienceleague.adobe.com/docs/experience-cloud/software-distribution/home.html?lang=en and https://experience.adobe.com/#/downloads/content/software-distribution/en/general.html) and get the `.rpm` file
![](/assets/images/2019/01/adobe-campaign-rpm-file-download-center.jpg)

2. Open it, open again the `.cpio` file to find the folder `./` which contains `etc` and `usr`
![](/assets/images/2019/01/adobe-campaign-rpm-content.jpg)

3. Extract it Somewhere


4. Notepad++ > Find in Files (with **match case** and **Filters** set)
![](/assets/images/2019/01/adobe-campaign-find-source-code.jpg)

5. Note: Filter can contain a wildcard:
  - `*.x*` to match `xsl, xml`
  - `*.j*` to match `jssp, js`
  - `*.*` to match any file
