---
title: "Linux training with overthewire [Part 5/10: Krypton 1-]"
author: Florian Courgey
layout: post
categories:
  - opensource
  - linux
  - bash
  - shell
  - hack
  - server
---
Excerpt here...
<!--more-->

This post is part of a series:
- [Linux training with overthewire Part 1: Bandit 1-10]({% post_url 2018-11-30-linux-training-overthewire-bandit-1 %})
- [Linux training with overthewire Part 2: Bandit 11-20]({% post_url 2018-11-30-linux-training-overthewire-bandit-2 %})
- [Linux training with overthewire Part 3: Bandit 21-30]({% post_url 2018-11-30-linux-training-overthewire-bandit-3 %})
- Linux training with overthewire Part 4: Natas
- [Linux training with overthewire Part 5: Leviathan]({% post_url 2018-11-30-linux-training-overthewire-leviathan %})

### Level 0 - `base64` decode
```
http://overthewire.org/wargames/krypton/krypton0.html
```
```bash
$ echo 'S1JZUFRPTklTR1JFQVQ=' | base64 -d
KRYPTONISGREAT
```

### Level 1 - ROT 13
```bash
ssh krypton1@krypton.labs.overthewire.org -p 2222
# KRYPTONISGREAT http://overthewire.org/wargames/krypton/krypton1.html
```
```bash
$ cd /krypton/krypton1 && ls
README  krypton2
$ cat README
The password \for level 2 is in the file
'krypton2'. It is encrypted using a simple rotation called 'ROT13'.
$ cat krypton2 | tr 'A-Za-z' 'N-ZA-Mn-za-m'
LEVEL TWO PASSWORD ROTTEN
```

> Note: Same as [Bandit level 11]({% post_url 2018-11-30-linux-training-overthewire-bandit-2 %}#level-11---rot13-without-any-programming-language)

> See [ROT13 on Wikipedia](https://en.wikipedia.org/wiki/ROT13)

### Level 2 - Caesar cypher
```bash
ssh krypton2@krypton.labs.overthewire.org -p 2222
# ROTTEN http://overthewire.org/wargames/krypton/krypton2.html
```
```bash
$ cd /krypton/krypton2 && ls
README  encrypt  keyfile.dat  krypton3
$ cat README
This level contains an old form of cipher called a 'Caesar Cipher' in the file 'krypton3'.
```
2 ways:
- Caesar bruteforce on [https://www.dcode.fr/caesar-cipher](https://www.dcode.fr/caesar-cipher)
- Use your brain and find how the binary works (preferred method):
```bash
$ cd $(mktemp -d)
$ ln -s /krypton/krypton2/keyfile.dat && chmod 777 .
$ echo "ABCDEFGHIJKLMNOPQRSTUVWXYZ" > alphabet
$ /krypton/krypton2/encrypt alphabet && cat ciphertext
MNOPQRSTUVWXYZABCDEFGHIJKL
```
Use the same code as Level 1, with a slight change in the letters mapping:
```bash
$ cat /krypton/krypton2/krypton3 | tr 'A-Za-z' 'O-ZA-No-za-n'
CAESARISEASY
```

> See [Caesar cipher on Wikipedia](https://en.wikipedia.org/wiki/Caesar_cipher)
https://en.wikipedia.org/wiki/ROT13

### Level 3 - Letters frequency analysis
```bash
ssh krypton3@krypton.labs.overthewire.org -p 2222
# CAESARISEASY http://overthewire.org/wargames/krypton/krypton3.html
```
#### First approach: bash only
```bash
$ cd /krypton/krypton3 && ls
HINT1  HINT2  README  found1  found2  found3  krypton4
$ cd $(mktemp -d) && ln -s /krypton/krypton3/found1 && ln -s /krypton/krypton3/found2 && ln -s /krypton/krypton3/found3
$ alph="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
```
In bash, for each letter of the `$alph`, count the occurence:
```bash
$ for((i=0 ; i<26 ; i++)); do exec cat found*|grep -o "${alph:$i:1}" |wc -c; done
110
492
# [...]
56
```
In the end, we'll need to sort this output with `sort`, so we need to 0 pad in order for `56` to become `056`:
```bash
$ for((i=0 ; i<26 ; i++)); do exec cat found*|grep -o "${alph:$i:1}" |wc -c | xargs printf "%03d " ; done
110
492
# [...]
056
```
Let's add letters because we're humans, not computers:
```bash
$ for((i=0 ; i<26 ; i++)); do exec cat found*|grep -o "${alph:$i:1}" |wc -c | xargs printf "%03d " && echo "${alph:$i:1}" ; done > frequency && cat frequency
110 A
492 B
# [...]
056 F
```
Sort it:
```bash
$ sort -r frequency
912 S
680 Q
602 J
514 U
# [...]
```
And compare with [English letter frequency on Wikipedia](https://en.wikipedia.org/wiki/Letter_frequency#Relative_frequencies_of_letters_in_the_English_language)

|Letter|Relative frequency in the English language|Letter frquency in krypton3 files
|-
|e|12.702%|S
|t|9.256%|Q
|a|8.167%|J
|o|7.507%|U
|i|6.966%|B

Buuuuuut after many tries, I couldn't find it this way. I tried many alphabets from [letterfrequency.org](http://letterfrequency.org/) such as `etaoinsrhldcumfpgwybvkxjqz` (English) or `eariotnslcudpmhgbfywkvxzjq` (Oxford).

#### Second approach: JCrypTool

So I gave [JCrypTool](https://www.cryptool.org/en/jct-downloads/stable) a shot, and it worked!

Start by a copy/paste of each `found*` file and the password, each one without space, but separated by a newline:
![](/assets/images/2018/12/jcryptool-set-up.jpg)

Go ahead and start the analysis with `Analysis > Substitution analysis`. Use the text from the editor as the source, and the English dictionnary as the reference text.

As we saw previously, we cannot rely on 1 letter analysis, so let's try Bigrams. Open up the `Character 2-grams` analysis. The top 2 most frequent bigrams in English are [th] and [he]. In our texts, it's [JD] and [DS]. Noticed the D?
![](/assets/images/2018/12/jcryptool-subsitution-bigrams.jpg)

Replace it and check the trigrams:
![](/assets/images/2018/12/jcryptool-subsitution-trigram-the.jpg)

Great 😍

Get back to the bigrams again, let's see what we can find. Maybe the [er] and [es]?
![](/assets/images/2018/12/jcryptool-find-er-and-es.jpg)

When replaced, it gives us 2 more trigrams: [her] and [ere]:
![](/assets/images/2018/12/jcryptool-trigrams-ere-her.jpg)

Proceed this way until you got the whole alphabet:
![](/assets/images/2018/12/jcryptool-subsitution-analysis.jpg)

```bash
$ cat /krypton/krypton3/krypton4 | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ BOIHGKNQVTWYURXZAJEMSLDFPC
WELLD ONETH ELEVE LFOUR PASSW ORDIS BRUTE
WELL DONE THE LEVEL FOUR PASSWORD IS BRUTE
```

> See [Simple substitution on Wikipedia](https://en.wikipedia.org/wiki/Substitution_cipher#Security_for_simple_substitution_ciphers)

### Level 4 - Vigenère Cipher
```bash
ssh krypton4@krypton.labs.overthewire.org -p 2222
# BRUTE http://overthewire.org/wargames/krypton/krypton4.html
```
```bash
$ cd /krypton/krypton4 && ls
HINT  README  found1  found2  krypton5
```

FREKEY
CLEARTEXT

### Level  -
```bash
ssh krypton1@krypton.labs.overthewire.org -p 2222
# KRYPTONISGREAT http://overthewire.org/wargames/krypton/krypton1.html
```




This post is part of a series:
- [Linux training with overthewire Part 1: Bandit 1-10]({% post_url 2018-11-30-linux-training-overthewire-bandit-1 %})
- [Linux training with overthewire Part 2: Bandit 11-20]({% post_url 2018-11-30-linux-training-overthewire-bandit-2 %})
- [Linux training with overthewire Part 3: Bandit 21-30]({% post_url 2018-11-30-linux-training-overthewire-bandit-3 %})
- Linux training with overthewire Part 4: Natas
- [Linux training with overthewire Part 5: Leviathan]({% post_url 2018-11-30-linux-training-overthewire-leviathan %})
