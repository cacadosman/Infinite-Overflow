---
author: cacadosman
date: 2018-07-20 17:05:41+00:00
draft: true
title: Web Security Basic - Pengenalan Website
type: post
url: /2018/07/20/web-security-basic-pengenalan-website/
comments: true
categories:
- CTF
- Cyber Security
- Tutorial
---

Bagaimana cara kerja website?




![](/wp-content/2018/07/image35.png)





Simpelnya ialah melakukan request dan response. {{$.Site.BaseURL}}




Kita analogikan client itu adalah kita, lalu kita melakukan sebuah HTTP Request ke server (Bagaikan kita meminta tolong kepada seseorang). Kemudian server memproses dan memberikan sebuah response kepada client (Bagaikan seseorang itu menerima permintaan tolong kita lalu memberikan respon untuk membantu).




**HTTP Headers**




HTTP Headers memungkinkan kita untuk memberikan informasi tambahan pada Request/Response. Intinya ialah informasi yang tersimpan pada request/response message.




Header ini menyimpan beberapa informasi seperti cookie.




Bagaimana Caranya ?



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> Menggunakan bash linux:
> 
> 

> 
> curl -I -X HEAD https://www.google.com/
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Output:



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> HTTP/1.1 200 OK
> 
> 

> 
> Date: Sat, 23 Jun 2018 07:54:47 GMT
> 
> 

> 
> Expires: -1
> 
> 

> 
> Cache-Control: private, max-age=0
> 
> 

> 
> Content-Type: text/html; charset=ISO-8859-1
> 
> 

> 
> P3P: CP="This is not a P3P policy! See g.co/p3phelp for more info."
> 
> 

> 
> Server: gws
> 
> 

> 
> X-XSS-Protection: 1; mode=block
> 
> 

> 
> X-Frame-Options: SAMEORIGIN
> 
> 

> 
> Set-Cookie: 1P_JAR=2018-06-23-07; expires=Mon, 23-Jul-2018 07:54:47 GMT; path=/; domain=.google.com
> 
> 

> 
> Set-Cookie: NID=133=dFvhPVCJTwachtJg0RGWWyBdEv-sTLJzyrRhykEfxfo9X804kHiraIm3InYXeOasJz_eWoB2opuS1mense-dWVna6TTkFWJfKc-J8tbXRzhvDVwoeddCCFRWtzWzfIJi; expires=Sun, 23-Dec-2018 07:54:47 GMT; path=/; domain=.google.com; HttpOnly
> 
> 

> 
> Transfer-Encoding: chunked
> 
> 

> 
> Alt-Svc: quic=":443"; ma=2592000; v="43,42,41,39,35"
> 
> 

> 
> Accept-Ranges: none
> 
> 

> 
> Vary: Accept-Encoding
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Kita bisa melihat banyak informasi yang terdapat pada header seperti status, cookie, domain, content-type dll.




**Cookie & Session**




Apa itu cookie?




Cookie adalah informasi dalam bentuk string yang tersimpan pada client/browser.




Sering digunakan untuk menyimpan informasi preferensi website, otentikasi, server session indentification, dll.




Cara mengakses cookie?




Cara paling simpel ialah menggunakan extension EditThisCookie




![](/static/wp-content/2018/07/image17.png)





Cara lain mengakses cookie ialah menggunakan Javascript, masukkan kode berikut ke address bar lalu tekan enter:



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> javascript:document.cookie
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Maka kita dapat melihat cookie yang tersimpan.




Apa itu Session?




Hampir sama seperti cookie, namun bedanya session tersimpan pada server. Biasanya digunakan untuk otentikasi user.




Bagaimana server mengetahui session kita?
Dengan mengidentifikasi session id yang tersimpan pada cookie browser kita.




Contoh:



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> PHPSESSID=u347pnq87d249m0esu131qtm80
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Implementasinya ialah saat kita diharuskan terlebih dahulu melakukan login untuk mengakses suatu halaman pada website, dengan adanya session, kita tidak perlu lagi melakukan login berulang saat mengakses halaman tersebut sebelum kita melakukan logout.




**Robots**




Apa itu web robots?




Web Robots atau Web Crawler adalah sebuah program yang dapat menelusuri web secara otomatis. Contohnya search engine google yang menggunakan web robots untuk melakukan indexing.




Admin web dapat memberikan sebuah instruksi untuk Web Robots dengan menggunakan /robots.txt




Contoh: [https://example.com/robots.txt](https://www.google.com/url?q=https://example.com/robots.txt&sa=D&ust=1532108601604000)



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


User-agent: *
Disallow: /admin



</td>
</tr>
</tbody>
</table>


User-agent: * artinya berlaku untuk semua robots




Disallow: /admin artinya kita melarang robots tersebut untuk mengakses /admin yang kemungkinan terdapat informasi penting yang tidak ingin terekspos pada search engine.





Latihan:




[http://natas3.natas.labs.overthewire.org/](https://www.google.com/url?q=http://natas3.natas.labs.overthewire.org/&sa=D&ust=1532108601607000)




Saat kita buka url diatas, tidak ada apa-apa. Mari kita lihat source codenya :)




![](/wp-content/2018/07/image7.png)





Terdapat hint:



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> No more information leaks!! Not even Google will find it this time...
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Dari hint diatas kita bsa mengetahui bahwa search engine google pun tidak dapat menemukannya. Sehingga kita bisa menyimpulkan bahwa ini berkaitan dengan robots yang mencegah search engine google untuk mengakses lebih dalam.




Okay, langsung saja kita akses /robots.txt




![](/wp-content/2018/07/image8.png)





Terdapat sesuatu yang menarik :3



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


Disallow: /s3cr3t/



</td>
</tr>
</tbody>
</table>


Artinya search engine tidak diperbolehkan mengakses /s3cr3t/




Oleh karena itu ayo kita akses /s3cr3t/




![](/wp-content/2018/07/image8-1.png)





Hehehe, terdapat users.txt dan mari kita buka :3




![](/wp-content/2018/07/image16.png)





Yay kita mendapatkan flagnya :3




Latihan:




[http://natas4.natas.labs.overthewire.org/](https://www.google.com/url?q=http://natas4.natas.labs.overthewire.org/&sa=D&ust=1532108601611000)




Mari kita buka url diatas, terdapat hint yang menarik



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> Access disallowed. You are visiting from "" while authorized users should come only from "http://natas5.natas.labs.overthewire.org/" 
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Dari kalimat diatas, kita akan mendapatkan flag/authorized saat kita mengakses natas4 dari natas5, sehingga dalam kasus ini kita perlu merubah header Referer menjadi [http://natas5.natas.labs.overthewire.org/](https://www.google.com/url?q=http://natas4.natas.labs.overthewire.org/&sa=D&ust=1532108601613000)




Ada beberapa cara, pertama inspect element, kedua menggunakan postman, ketiga menggunakan burp suite.




Kita akan menggunakan cara kedua, karena simpel dan elegan. Bagi yang belum mempunyai postman, silakan install postman terlebih dahulu :3




[https://www.getpostman.com/apps](https://www.google.com/url?q=https://www.getpostman.com/apps&sa=D&ust=1532108601614000)




Setelah itu mari kita buka postman




![](/wp-content/2018/07/image26.png)





Kita menggunakan GET method, lalu masukkan url natas 4 ke address bar postman, setelah itu pada tab authorization pilih Type basic auth. Kemudian masukkan username natas4 dan passwordnya.




![](/wp-content/2018/07/image10.png)





Setelah itu kita klik tombol Send yang berwarna biru :3




Maka kita akan mendapatkan sebuah response body.




![](/wp-content/2018/07/image11.png)





Lanjut kita akan memanipulasi header. Pilih tab header dan tambahkan “Referer” lalu isikan dengan url natas5




![](/wp-content/2018/07/image34.png)





Setelah itu kita klik lagi tombol Send.




![](/wp-content/2018/07/image25.png)





Cek response body, maka kita akan mendapatkan sebuah flag yay.





Latihan:




[http://natas5.natas.labs.overthewire.org/](https://www.google.com/url?q=http://natas5.natas.labs.overthewire.org/&sa=D&ust=1532108601618000)




Mari kita buka URL diatas, terdapat hint yang menarik:



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> Access disallowed. You are not logged in
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Mari kita lihat source codenya




![](/wp-content/2018/07/image12.png)





Tidak ada yang menarik, tapi karena dari kalimat hint tsb yang terlihat mengarah ke otentikasi (login) maka kita coba cek cookie nya.




Cara cek cookie yaitu dengan mengetikkan script JS ini ke address bar:



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> javascript:document.cookie
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Maka kita akan mendapatkan string yang merupakan cookie



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> __utma=176859643.990165392.1529731465.1529739031.1530110948.3; __utmz=176859643.1529731465.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utmc=176859643; loggedin=0
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Terdapat loggedin=0 




Maka kita ubah saja menjadi 1 dengan merubah cookie tsb.




Caranya sama seperti diatas, kita pastekan ke address bar



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> javascript:document.cookie = “loggedin=1”
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Lalu kita reload kembali url natas5, maka kita akan mendapatkan flag




![](/wp-content/2018/07/image23.png)





Yay selamat.
