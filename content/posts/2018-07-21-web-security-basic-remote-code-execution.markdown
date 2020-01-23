---
author: cacadosman
date: 2018-07-21 08:15:00+00:00
draft: false
title: Web Security Basic - Remote Code Execution
type: post
url: /2018/07/21/web-security-basic-remote-code-execution/
comments: true
categories:
- CTF
- Cyber Security
- Tutorial
---

Requirements:






 	  * Basic Linux
 	  * PHP
 	  * Pantang Menyerah :3



Apa itu RCE ?




[https://searchwindowsserver.techtarget.com/definition/remote-code-execution-RCE](https://www.google.com/url?q=https://searchwindowsserver.techtarget.com/definition/remote-code-execution-RCE&sa=D&ust=1532108601684000)




RCE memungkinkan kita untuk mendapatkan kendali terhadap resource yang terdapat pada server si korban (Mengkontrol device korban) dengan melakukan injeksi perintah pada sistem operasi (mengeksekusi cmd/bash).




Latihan:




Buka url berikut




[http://ctf.asgama.tk:40003/](https://www.google.com/url?q=http://ctf.asgama.tk:40003/&sa=D&ust=1532108601685000)




Kita akan melihat sebuah form




![](/wp-content/2018/07/image19.png)





Terdapat hint berupa source code, mari kita lihat /sauce.txt



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >

    
    <?php
           if(isset($_GET["nama"])){
               $nama = $_GET["nama"];
               passthru("echo " . $nama . ";");
           }
       ?>



</td>
</tr>
</tbody>
</table>


Jika kita perhatikan kode diatas, maka kita akan menampilkan nama yang kita input pada form dengan fungsi passthru ([http://php.net/manual/en/function.passthru.php](https://www.google.com/url?q=http://php.net/manual/en/function.passthru.php&sa=D&ust=1532108601686000)) yaitu untuk mengeksekusi perintah/command pada OS.




Sehingga, kita bisa memanipulasi inputan kita dengan menginjeksi perintah/command pada OS, pada kasus ini server menggunakan linux sehingga kita tinggal memasukkan perintah bash saja.




Langsung saja kita eksekusi perintah berikut



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >

    
    ;ls



</td>
</tr>
</tbody>
</table>


Mengapa?




Pertama, kita tutup dulu command sebelumnya yaitu echo dengan semicolon ;




lalu kemudian kita dapat bebas menginputkan command apa saja, misalkan ls yaitu untuk melihat list file yang ada di dalam directory.




Sehingga jika perintah diatas digabungkan akan menjadi



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >

    
    passthru("echo ;ls;");



</td>
</tr>
</tbody>
</table>


Tadaa . . masukkan ;ls dan kita akan melihat list file di directory.




![](/wp-content/2018/07/image13.png)





Mari kita baca file bendera.txt dengan perintah



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >

    
    ;cat bendera.txt



</td>
</tr>
</tbody>
</table>


Yay kita mendapatkan flagnya




![](/wp-content/2018/07/image3.png)

