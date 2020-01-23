---
author: cacadosman
date: 2018-07-21 02:18:21+00:00
draft: true
title: Web Security Basic - Bahasa Pemrograman
type: post
url: /2018/07/21/web-security-basic-bahasa-pemrograman/
comments: true
categories:
- CTF
- Cyber Security
- Tutorial
---

Semua aplikasi pastinya dibuat dengan menggunakan bahasa pemrograman, oleh karena itu agar kita dapat menemukan suatu celah keamanan dari aplikasi kita harus menguasai bahasa pemrograman terlebih dahulu untuk dapat menganalisa source code (baik source code utuh maupun dengan reverse engineering). Kebanyakan anak jaman now seringkali saya jumpai ingin menjadi hacker tapi secara instan dengan mengandalkan tools dan dorking, namun malas untuk mempelajari dasar bahasa pemrograman dan konsep dari eksploitasinya. Hal seperti itulah yang harus kita hindari, kita harus mempunyai pondasi yang mantap sebelum ke tahap selanjutnya.




**HTML (HyperText Markup Language)**




Hal yang perlu diperhatikan ialah HTML bukan bahasa pemrograman.




HTML sendiri ialah bahasa markup yang digunakan untuk membuat struktur sebuah halaman web (Seperti rangka pada tubuh). 




Lalu apa pentingnya HTML ? 




Karena HTML merupakan struktur dari sebuah web, ya setidaknya perlu mengetahui bagaimana HTML bekerja. Salah satu penerapannya ialah jika kita ingin mengeksploitasi bagian client side maka kita perlu menganalisa kode HTML web tsb.




Mempelajari HTML:




[https://www.w3schools.com/Html/](https://www.google.com/url?q=https://www.w3schools.com/Html/&sa=D&ust=1532108601626000)




[https://sekolahkoding.com/kelas/belajar-html-dari-dasar](https://www.google.com/url?q=https://sekolahkoding.com/kelas/belajar-html-dari-dasar&sa=D&ust=1532108601626000)




**JavaScript**




Sebuah bahasa scripting yang sangat luar biasa.




![](/wp-content/2018/07/image22.png)





Javascript pada awalnya merupakan bahasa client side yang digunakan pada web untuk dapat menjadikan halaman web lebih interaktif, walaupun sekarang trend javascript digunakan pada backend.




Ada banyak sekali saya temui website yang masih memproses data sensitif pada client side, sehingga memunculkan celah keamanan yang serius. Oleh karena itu kita perlu mempelajari JS agar dapat menganalisa source code dan mencari kelemahannya.




Mempelajari JavaScript:




[https://www.w3schools.com/js/](https://www.google.com/url?q=https://www.w3schools.com/js/&sa=D&ust=1532108601630000)




[https://sekolahkoding.com/track/menguasai-javascript](https://www.google.com/url?q=https://sekolahkoding.com/track/menguasai-javascript&sa=D&ust=1532108601630000)




**PHP (Hypertext PreProcessor)**




Sebuah bahasa scripting yang dikususkan untuk sisi backend, salah satu bahasa favorit penulis. Walaupun sekarang performanya banyak dibilang kalah dengan pesaingnya seperti JS, Ruby, Go, dll.




Tapi PHP merupakan bahasa yang secara luas masih digunakan oleh masyarakat umum (kususnya Indonesia) untuk membuat sebuah web dan api sekala kecil-menengah. Jika kita perhatikan, web hosting pun msh menggunakan Linux + Apache + MySQL + PHP sebagai stack utamanya. PHP juga memiliki dukungan komunitas yang luar biasa besar, termasuk Indonesia. Hampir semua website pun didominasi oleh PHP. Sehingga bahasa ini perlu perhatian kusus, terutama dalam ranah security, karena kadangkala terdapat banyak sekali celah pada bahasa pemrograman ini (banyak sekali deprecated function yang vuln).




Mempelajari PHP:
[https://www.w3schools.com/php/](https://www.google.com/url?q=https://www.w3schools.com/php/&sa=D&ust=1532108601632000)




[https://sekolahkoding.com/track/backend-website](https://www.google.com/url?q=https://sekolahkoding.com/track/backend-website&sa=D&ust=1532108601633000)




**Python**




Sebuah bahasa scripting yang simpel dan powerful, sangat banyak dukungan library yang dapat memudahkan pengguna. Sehingga bisa kita sebut bahwa python ini sebuah bahasa yang fokus untuk memberikan kemudahan kepada penggunanya (Bandingkan dengan compiled language seperti C++ dan Java yang sangat strict).




Oleh karena itu, seringkali python digunakan dalam membuat sebuah tools eksploitasi. Penulis juga sering menggunakan python untuk membuat tools otomatisasi untuk melakukan eksploitasi.




Bahasa lain selain python yang sering digunakan untuk membuat tools adalah ruby. Jika berminat mungkin pembaca bisa mempelajarinya juga.




Mempelajari Python:




[https://www.tutorialspoint.com/python/index.htm](https://www.google.com/url?q=https://www.tutorialspoint.com/python/index.htm&sa=D&ust=1532108601634000)




Latihan:




[http://natas6.natas.labs.overthewire.org/](https://www.google.com/url?q=http://natas6.natas.labs.overthewire.org/&sa=D&ust=1532108601636000)




Mari kita buka URL diatas. Terdapat hal yang menarik, yaitu kita diberikan sebuah source code. Berikut ini adalah penggalan source code PHP:



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >

    
    <?
    
    include "includes/secret.inc";
    
        if(array_key_exists("submit", $_POST)) {
    
            if($secret == $_POST['secret']) {
    
               print "Access granted. The password for natas7 is <censored>";
    
            } else {
    
               print "Wrong secret";
    
           }
    
        }
    
    ?>



</td>
</tr>
</tbody>
</table>


Jika kita perhatikan source code diatas, kita bisa mengetahui bahwa flag akan didapatkan apabila value/nilai dari variabel $secret itu sama dengan nilai dari variabel $_POST[‘secret’] yang kita inputkan melalui form dibawah ini



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >

    
    <form method=post>
    
    Input secret: <input name=secret><br>
    
    <input type=submit name=submit>
    
    </form>



</td>
</tr>
</tbody>
</table>


 




Jika kita analisis lebih dalam kode php tsb, kita bisa menduga bahwa variabel $secret berasal dari file secret.inc yang diinclude.




Oleh karena itu, mari kita cek /includes/secret.inc




Setelah kita cek, ternyata kosong hehehe.




Hah? Kosong?




Eits . . jangan panik dulu, coba kita lihat source code nya dengan ctrl+u.




Akhirnya kita menemukan nilai dari variabel $secret yay.




Selanjutnya adalah kita akan menginputkan nilai dari var $secret tsb kedalam form, sehingga kita akan mendapatkan flagnya.




![](/wp-content/2018/07/image15.png)





Jeng Jeng !!!




![](/wp-content/2018/07/image4.png)





Selamat.




**Membuat Script Otomatisasi Dengan Python**


Saya asumsikan pembaca sudah memahami dasar python.




Salah satu kegunaan bahasa pemrograman adalah membuat script/tools untuk otomatisasi, salah satunya adalah untuk melakukan bruteforcing.




Ayo kita langsung mempraktikkannya.




Pertama, siapkan python 2.7 (Karena saya biasa menggunakan versi 2.7)




Lalu kita jalankan perintah berikut pada cmd/bash untuk menginstall modul requests



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >

    
    pip install requests
    
    atau
    
    sudo pip install requests



</td>
</tr>
</tbody>
</table>


Untuk dokumentasi python requests, bisa kita lihat pada web berikut




[http://docs.python-requests.org/en/master/](https://www.google.com/url?q=http://docs.python-requests.org/en/master/&sa=D&ust=1532108601649000)




Setelah selesai, mari kita buka url berikut.




[http://ctf.asgama.tk:40001/](https://www.google.com/url?q=http://ctf.asgama.tk:40001/&sa=D&ust=1532108601650000)




Terdapat sebuah deskripsi



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> Selamat datang, silakan menebak angka dari 1-100 menggunakan ?guess=
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Kita diberi instruksi untuk menebak angka, dan inputan menggunakan metode get dengan parameter guess, sehingga kita perlu menambahkan ?guess=nilai pada url, contoh:



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> http://ctf.asgama.tk:40001/?guess=1
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Lalu kita mendapatkan sebuah pesan



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >


<blockquote>

> 
> Tebakan anda salah, coba lagi.
> 
> 
</blockquote>



</td>
</tr>
</tbody>
</table>


Oke, artinya kita salah menebak angka yang artinya bukan angka 1. Sebenarnya kita bisa saja menebak secara manual dari 1-100 berhubung angkanya sedikit. Namun apabila sudah sampai ratusan bahkan ribuan, jelas akan menghabiskan waktu kita dan juga jari bakalan pegal pegal :’(





Solusinya adalah kita akan membuat script otomatisasi dengan python yang akan menebak angka dari 1-100, apabila sudah ketemu hasilnya maka otomatis script akan berhenti dan memberi tahu kita outputnya :)




Buatlah sebuah file dengan nama bebas dengan ekstensi .py




Misal guessnum.py




Lalu kita pastekan kode dibawah ini



<table class="c8" >
<tbody >
<tr class="c19" >

<td colspan="1" rowspan="1" class="c16" >

    
    import requests
    
    url = "http://ctf.asgama.tk:40001/?guess="
    
    for i in range(101):
    
       r = requests.get(url + str(i))
    
       if "salah" not in r.text:
    
           print r.text
    
           break
    
       else:
    
           print "Bukan " + str(i)



</td>
</tr>
</tbody>
</table>


Jadi kita akan melakukan loop for i dari 0 sampai 100 dimana nanti akan kita cek hasil/output nya, jika terdapat kata “salah” maka kita akan meneruskan iterasi. Namun apabila tidak terdapat kata salah, maka bisa kita pastikan itu adalah jawabannya lalu print outputnya dan kita hentikan iterasi.




Hasil running program:




![](/wp-content/2018/07/image28.png)





Selamat, kita mendapatkan flagnya.
