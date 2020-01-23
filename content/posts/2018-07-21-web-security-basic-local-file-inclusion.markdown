---
author: cacadosman
date: 2018-07-21 08:21:07+00:00
draft: true
title: Web Security Basic - Local File Inclusion
type: post
url: /2018/07/21/web-security-basic-local-file-inclusion/
comments: true
categories:
- CTF
- Cyber Security
- Tutorial
---

Apa itu LFI?




Local File Inclusion memungkinkan kita untuk melakukan inklusi/include sebuah file (Mengeksekusi/membaca file lain yang berada pada server yang seharusnya tidak boleh kita eksekusi diluar prosedur)




Apa itu include?




[http://php.net/manual/en/function.include.php](https://www.google.com/url?q=http://php.net/manual/en/function.include.php&sa=D&ust=1532108601692000)




Latihan:




Mari kita buka url berikut ini




[http://ctf.asgama.tk:40004/](https://www.google.com/url?q=http://ctf.asgama.tk:40004/&sa=D&ust=1532108601693000)




Terdapat menu home dan kontak, serta terdapat sebuah source code.




Mari kita buka source code tsb.



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >

    
    <?php if(isset($_GET["page"])): ?>
           <p><?php include $_GET["page"]; ?></p>
       <?php else: ?>
           <p>Nothing to do here</p>
       <?php endif; ?>



</td>
</tr>
</tbody>
</table>


Dari kode diatas, kita bisa mengetahui bahwa web tsb melakukan inklusi/include dengan parameter $_GET[“page”], bisa kita ketahui saat kita membuka menu kontak.




![](/wp-content/2018/07/image20.png)





Artinya, isi dari contact.php adalah berupa kontak line. 




![](/wp-content/2018/07/image29.png)





Lalu secara default (pada halaman home) maka akan muncul teks “Nothing to do here” karena tidak terdapat parameter page pada url (GET Method)




Oleh karena itu, kita bisa mengetahui bahwa web tersebut kemungkinan bisa diinjeksi dengan path/lokasi dari suatu file untuk menginklusi/include file tersebut.




Misalkan kita ingin menginklusi file /etc/passwd, maka kita langsung saja menginjeksikannya pada parameter page



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> http://ctf.asgama.tk:40004/index.php?page=/etc/passwd
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Tadaa, ternyata vuln terhadap LFI


![](/wp-content/2018/07/image9.png)



Kita belum mendapatkan flagnya, coba kita cek source code halaman tsb.




![](/wp-content/2018/07/image27.png)





Terdapat hal yang menarik, yaitu lokasi flag ada di bendera/flag.txt




Oke langsung saja kita injeksi kedalam parameter page di url.



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> http://ctf.asgama.tk:40004/index.php?page=bendera/flag.txt
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


![](/wp-content/2018/07/image32.png)





Yay kita mendapatkan flagnya :3
