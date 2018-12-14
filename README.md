# www
```bash
$ ruby -v
$ bundle install
$ jekyll serve
Server address: http://127.0.0.1:4000/
```

## update Algolia index
```bash
$ echo 'my_algolia_key' > _algolia_api_key
$ jekyll algolia
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
<!--more-->
**bold** *italic*  ~~strikethrough~~
## Use h2 for each section
![todo](/assets/images/2018/11/image.png)
```

Markdown reference
[https://guides.github.com/features/mastering-markdown/#examples](https://guides.github.com/features/mastering-markdown/#examples)
