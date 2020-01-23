---
author: cacadosman
date: 2018-07-20 16:49:48+00:00
draft: true
title: Web Security Basic - Source Code
type: post
url: /2018/07/20/web-security-basic-source-code/
comments: true
categories:
- CTF
- Cyber Security
- Tutorial
---

Pertama yang harus kita lakukan adalah menganalisa atau mencari informasi.




Salah satu yang paling mudah ialah melihat source code dari halaman web.



<table >
<tbody >
<tr >

<td colspan="1" rowspan="1" >


<blockquote>Note: Source Code yang ditampilkan hanyalah bagian frontend, bukan bagian backend</blockquote>



</td>
</tr>
</tbody>
</table>


Pada browser (Chrome/Firefox) kita hanya perlu menekan kombinasi tombol 




ctrl  + U Pada Keyboard untuk menampilkan source code.




Kadangkala sebuah halaman web tidak mengizinkan kita untuk melihat source code, solusi alternatifnya adalah membuka url tersebut di tab baru dgn tambahan prefix view-source: diawal url




Contoh:



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> view-source:https://google.com/
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Latihan:




[http://overthewire.org/wargames/natas/natas0.html](https://www.google.com/url?q=http://overthewire.org/wargames/natas/natas0.html&sa=D&ust=1532108601588000)




Coba kita buka url diatas, lalu terdapat Wargames Natas level 0. Mari kita buka url tersebut kemudian memasukkan username dan password yang sudah diberikan.




Setelah itu kita coba untuk melihat source code dengan cara diatas. Maka kita akan melihat halaman yang berisikan source codenya.




![](/wp-content/2018/07/image14.png)





Maka kita bisa menemukan password untuk natas1 atau level selanjutnya, selamat.




Latihan 2:




[http://natas2.natas.labs.overthewire.org](https://www.google.com/url?q=http://natas2.natas.labs.overthewire.org&sa=D&ust=1532108601590000)




Mari kita buka url diatas dan masukkan password yang didapat dari natas1. Jangan lupa buka source code, jika kita perhatikan maka tidak lagi terdapat password. Akan tetapi terdapat hal yang mencurigakan, yaitu terdapat sebuah path /files/pixel.png pada atribut src didalam tag img.




![](/wp-content/2018/07/image31.png)





Mari kita akses [http://natas2.natas.labs.overthewire.org/files](https://www.google.com/url?q=http://natas2.natas.labs.overthewire.org/files&sa=D&ust=1532108601591000)/




Maka kita akan menemukan users.txt. Kemudian saat kita buka, kita akan mendapatkan sebuah flag. Selamat.
