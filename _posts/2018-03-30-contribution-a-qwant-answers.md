---
id: 278
title: Contribution a Qwant Answers
date: 2018-03-30T17:14:08+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=278
permalink: /2018/03/contribution-a-qwant-answers/
categories:
  - github
  - google
  - opensource
  - qwant
---
## Qwant ?

Depuis quelques temps j&#8217;utilise [Qwant](https://www.qwant.com/) en moteur de recherche, dans l&#8217;optique de m&#8217;eloigner au maximum de Google. Ils savent deja [ou tu es en temps reel via Gmail](https://www.qwant.com/?q=gmail+knows+your+location), je prefere eviter qu&#8217;ils sachent egalement ce que je veux faire, ou je veux aller, quels films je regarde et sur quels projets je travaille.

J&#8217;ai donc switche sur Qwant et a ma grande surprise, il a copie bon nombre de concepts de Google :

  * Recherche dans les actualites, dans les videos, dans les produits via Shopping
  * Connexion a un compte cloud pour garder les preferences sur tous les devices
  * Module d&#8217;Instant Answer (le but de cet article !)
  * [Et bien d&#8217;autres](https://help.qwant.com/help/qwant-search/)..

## Instant Answers ?

Via un systeme de regex, Qwant detecte de facon intelligente la requete : rechercher &#8220;1+2&#8221; donne &#8220;1+2 = 3&#8221; en plus des rechercherches associees. En plus de [la calculatrice](https://help.qwant.com/help/qwant-search/instant-answers/calculator/), Qwant propose une conversion d&#8217;unites, des [programmes de cryptage](https://help.qwant.com/help/qwant-search/instant-answers/cryptography/) (md5, sha256) [image calc] 

Le petit (i) sur la droite invite a la contribution, c&#8217;est la que tout commence : [image i] 

Ce module d&#8217;Instant Anwers est en fait powered by the community et dispose d&#8217;[un github associe](https://github.com/Qwant/Instant-Answers/wiki) !!

## https://github.com/Qwant/Instant-Answers

to do

## https://github.com/floriancourgey/Instant-Answers

J&#8217;ai donc forke leur repo et cree 3 modules :

  * MyIP : https://github.com/floriancourgey/Instant-Answers/tree/feature/myip
  * Beautify : https://github.com/floriancourgey/Instant-Answers/tree/feature/beautify
  * Encryption Cesar : https://github.com/floriancourgey/Instant-Answers/tree/feature/encryption-caesar

Sur les 3 propositions, seule la derniere a ete retenue et mergee ([voir le detail de la pull request](https://github.com/Qwant/Instant-Answers/pull/32)). Ce n&#8217;est pas la plus complexe mais bon, petite fierte <i class="fa fa-github fa- " ></i><i class="fa fa-angellist fa- " ></i>