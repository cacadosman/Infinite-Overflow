---
author: cacadosman
date: 2018-07-21 08:03:55+00:00
draft: true
title: Web Security Basic - Kodingmu Harimaumu
type: post
url: /2018/07/21/web-security-basic-kodingmu-harimaumu/
comments: true
categories:
- CTF
- Cyber Security
- Tutorial
---

Jangan sepelekan koding, mungkin iya project kita bisa selesai. Namun belum tentu apa yang kita koding itu aman, kadang masih meninggalkan celah keamanan.




Biasanya celah keamanan ditemukan pada input yang tidak difilter maupun kesalahan penggunaan fungsi bawaan yang deprecated, jadi kita bisa dengan mudah melakukan injeksi pada form input.




Salah satu poin penting disini ialah Jangan Percaya Inputan User.




Contoh Soal:




Berikut adalah contoh soal dengan celah keamanan pada fungsi bawaan php yaitu strcmp yang berfungsi untuk membandingkan nilai.




Mari kita buka url berikut:




[http://ctf.asgama.tk:40002/](https://www.google.com/url?q=http://ctf.asgama.tk:40002/&sa=D&ust=1532108601659000)




Terdapat form login, kita disuruh memasukkan password pada form tersebut.




Namun, kita tidak mengetahui passwordnya.




Terdapat sebuah hint berupa source code yang terdapat pada /source.txt



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >

    
    if(isset($_POST["password"])){
           $password_input = $_POST["password"];
    
           if(strcmp($password_input, $password) == 0){
               $loggedin = true;
           }
       }



</td>
</tr>
</tbody>
</table>


Terdapat pengecekan nilai menggunakan strcmp. Fungsi strcmp sendiri akan mengembalikan nilai 0 apabila kedua nilai itu sama.




Sumber: [http://php.net/manual/en/function.strcmp.php](https://www.google.com/url?q=http://php.net/manual/en/function.strcmp.php&sa=D&ust=1532108601661000)




Akan tetapi, strcmp memiliki kelemahan jika membandingkan array. Hasilnya akan menjadi null dan mengeluarkan sebuah warning.




Oleh karena itu karena null == 0 itu menghasilkan nilai true, kita bisa langsung mengakalinya dengan menginputkan sebuah array pada form.




Caranya? cukup dengan inspect element.




![](/wp-content/2018/07/image1.png)





Lakukan inspect element pada form login, lalu ubah dari name=”password” menjadi name=”password[]” yang artinya kita akan mempassing parameter berupa array, sehingga kita bisa mempypass strcmp. Setelah itu kita tinggal tekan tombol login. 




![](/wp-content/2018/07/image5.png)





Selamat, kita mendapatkan sebuah flag.
