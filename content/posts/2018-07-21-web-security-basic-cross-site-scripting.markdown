---
author: cacadosman
date: 2018-07-21 08:09:25+00:00
draft: false
title: Web Security Basic - Cross Site Scripting
type: post
url: /web-security-basic-cross-site-scripting/
comments: true
categories:
- CTF
- Cyber Security
- Tutorial
---

Apa itu Cross Site Scripting (XSS) ?




[https://www.owasp.org/index.php/Cross-site_Scripting_(XSS)](https://www.google.com/url?q=https://www.owasp.org/index.php/Cross-site_Scripting_(XSS)&sa=D&ust=1532108601663000)




Requirements:






 	  * Dasar PHP
 	  * Dasar Javascript
 	  * Many Try, Much Error



Belajar JS :[ ](https://www.google.com/url?q=https://www.tutorialspoint.com/javascript/index.htm&sa=D&ust=1532108601665000)[https://www.tutorialspoint.com/javascript/index.htm](https://www.google.com/url?q=https://www.tutorialspoint.com/javascript/index.htm&sa=D&ust=1532108601665000)




Belajar PHP :[ ](https://www.google.com/url?q=https://www.tutorialspoint.com/php/index.htm&sa=D&ust=1532108601665000)[https://www.tutorialspoint.com/php/index.htm](https://www.google.com/url?q=https://www.tutorialspoint.com/php/index.htm&sa=D&ust=1532108601666000)


<br>

**Vulnerability**




XSS Merupakan salah satu vuln yang masih sering ditemukan pada aplikasi web. Tujuannya ialah menyisipkan sebuah payload (malicious code) yang dapat dieksekusi oleh browser (client). Sehingga dalam kasus tersebut, target kita adalah pada client side (Tidak memengaruhi server).




Macam-macam vuln XSS:






 	  * Reflected XSS
 	  * Stored XSS
 	  * DOM Based XSS



Efek yang ditimbulkan:






 	  * Pencurian data client (cookie, session hijacking, dll)
 	  * Menggangu fungsionalitas website pada frontend
 	  * Merubah tampilan web secara total sehingga tidak dapat difungsikan (Deface)



Latihan: [https://xss-game.appspot.com/](https://www.google.com/url?q=https://xss-game.appspot.com/&sa=D&ust=1532108601669000)



<br>
Level 1:




Objectives



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> Inject a script to pop up a JavaScript alert() in the frame below.
> 
> 

> 
> Once you show the alert you will be able to advance to the next level. 
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Kita memiliki misi untuk mengeluarkan javascript alert pada web tersebut, simpelnya ialah kita tinggal melakukan injeksi dengan memasukkan script js berikut



```
<script>alert(1);</script>
```

![](/wp-content/2018/07/image6.png)





Setelah itu kita tekan tombol search.




![](/wp-content/2018/07/image33.png)





Yay berhasil, mengapa bisa terjadi ?




Karena XSS mempengaruhi client (browser) sehingga kita bisa mengeksekusi script yang berjalan pada client (JS, CSS, HTML). Salah satu contoh ialah kita dapat merusak tampilan web (deface). Lanjut ke materi selanjutnya.



<br>
Stored XSS




Silakan buka url berikut, lalu login dengan username bee dan password bug.




[http://asgama.tk:5000/xss_stored_1.php](https://www.google.com/url?q=http://asgama.tk:5000/xss_stored_1.php&sa=D&ust=1532108601674000)




![](/wp-content/2018/07/image2.png)





Ayo coba kita injeksi dengan javascript
```
<script>alert(“hacked by hacker”);</script>
```

Lalu kita tekan tombol submit.




![](/wp-content/2018/07/image21.png)





Yay, akhirnya kita bisa mengeksekusi kode javascript tersebut.




Setelah itu, coba kita reload ulang halaman web tersebut, maka efeknya pun masih sama yang artinya script yang kita inputkan tadi tersimpan pada database dan akan selalu ditampilkan pada halaman web tersebut saat dibuka. Sehingga kita sebut itu sebagai Stored XSS dan efeknya pun bukan hanya kita sendiri, namun bisa dirasakan oleh user lain yang membuka web tersebut.



<br>
Selanjutnya, kita akan membahas hardening/penanggulangan Cross Site Scripting (XSS).




**Hardening**




Untuk bahasa pemrograman PHP, cukup dengan menggunakan fungsi

```
htmlentities($string, ENT_QUOTES | ENT_HTML5, 'UTF-8')
```


Contoh:

```
<?php

	$input = $_GET[“nama”];

	echo htmlentities($input, ENT_QUOTES | ENT_HTML5, 'UTF-8');

?>
```
