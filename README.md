# Repository for Jekyll on Github website https://blog.floriancourgey.com

## Install & run
```bash
$ ruby -v
$ bundle install
$ jekyll serve
Server address: http://127.0.0.1:4000/
```

## Create a post
```bash
$ touch _posts/YYYY-mm-dd-slug-here.md
```

```markdown
---
title: New article
author: Florian Courgey
layout: post
categories: [prestashop,google,opensource,adobe campaign]
---
Excerpt here...
<div class="text-center">🐍👑🌍</div>
<!--more-->
**bold** *italic*  ~~strikethrough~~
## Use h2 for each section
![todo](/assets/images/2019/01/image.png)
```

Video:
```html
<div class="text-center">
  <video autoplay loop muted playsinline height="250">
    <source src="/assets/images/2018/12/overthewire-natas12-php-injection.mp4" type="video/mp4" />
  </video>
</div>
```

Markdown reference
[https://guides.github.com/features/mastering-markdown/#examples](https://guides.github.com/features/mastering-markdown/#examples)

## Update Algolia index
```bash
$ echo 'my_algolia_key' > _algolia_api_key
$ jekyll algolia
```

## Jekyll on Github
- [Default `_config.yml`](https://help.github.com/articles/configuring-jekyll/)
- [Allowed plugins](https://help.github.com/articles/configuring-jekyll-plugins/)

## Changelog
- 20181214 Pages migrated from floriancourgey.github.io/tools (Crack, UNIX) & links to String, SEO, MPG
- 20181213 Over The Wire series
- 20181127 Algolia implemented
- 201811120 Creation

## Useful links
- https://cloudconvert.com
- https://digital-forensics.sans.org/media/hex_file_and_regex_cheat_sheet.pdf
