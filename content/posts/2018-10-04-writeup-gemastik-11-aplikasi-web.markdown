---
author: cacadosman
date: 2018-10-04 06:37:23+00:00
draft: false
title: Writeup Gemastik 11 - Aplikasi Web (?)
type: post
url: /writeup-gemastik-11-aplikasi-web/
comments: true
categories:
- CTF
- Cyber Security
- Gemastik
- Tutorial
tags:
- ctf
- gemastik
- gemastik 11
- gemastik xi
- tutorial
- web exploit
---

Terdapat sebuah service yang memiliki source code seperti berikut:

![](/wp-content/2018/10/Aplikasi-Web.png)


Simpelnya, kita perlu membayar minimal amount 20000 untuk mendapatkan sebuah flag. Akan tetapi tidak semudah itu karena pada proses check, kita hanya diperbolehkan memasukkan amount max 10000. Walaupun dilakukan inspect element, itu percuma saja karena disini dilakukan pengecekan hash untuk memastikan integritas data dari form sebelumnya itu isinya sama dengan form yang akan disubmit.

Menariknya, kode diatas terdapat sebuah celah keamanan yang sangat fatal.

![](/wp-content/2018/10/hashh.png)


Kode diatas melakukan sorting pada key berdasarkan lexicographical order dan hanya melakukan hashing pada value nya saja menggunakan sha256. Karena hanya melakukan pengecekan nilai nya saja, otomatis disini kita bisa melakukan manipulasi key berdasarkan lexicographical order agar urutan value yang dihash tetap sama saja pada endpoint /check dan /pay :)

Cara mudahnya bisa kita inject menggunakan postman saja:

Saat melakukan injeksi pada /check :

![](/wp-content/2018/10/hash1.png)


Kemudian, kita lanjutkan injeksi pada /pay :

![](/wp-content/2018/10/hash2.png)


Akhirnya kita mendapatkan sebuah flag :
**GEMASTIK{Be_CaReful_WH4t_You_H4SH}**

Terima Kasih.
