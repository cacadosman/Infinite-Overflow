---
author: cacadosman
date: 2018-07-20 16:38:22+00:00
draft: false
title: OLC Cyber Security 1 - Dasar Python dan Kripto
type: post
url: /olc-cyber-security-1-dasar-python-dan-kripto-2/
comments: true
categories:
- CTF
- Cyber Security
- Tutorial
---

**Materi : Dasar Python dan Kriptografi**





Sebuah modul yang dibuat untuk semua pada umumnya dan peserta OmahTI Learning Center pada kususnya. Yah walaupun modulnya kurang menarik. Ditujukan untuk membagikan ilmu kepada sesama, karena pada hakikatnya ilmu itu perlu untuk dibagikan/sebarluaskan.





**Requirements:**






  1. Niat yang mantaap
  2. Dijalankan dengan sungguh-sungguh
  3. Mandiri, tidak selalu minta disuap
  4. Tidak disalahgunakan untuk kemudaratan




*Jika terdapat penyalahgunaan di kemudian hari, kami tidak bertanggungjawab atas apa yang anda lakukan. Selalu ingat bahwasannya yang diatas selalu mengawasi, gunakan ilmu sebaik-baiknya :)





**0x01 Introduction**  

Apa yang anda ketahui tentang hacker?  

Seseorang yang jahat dan berusaha melakukan tidak pidana kejahatan siber?  

Yap, jangan selalu memikirkan konotasi negatif terhadap hacker. Karena hacker itu bukanlah orang jahat yang seperti kalian pikirkan. Hacker adalah orang yang dapat mempelajari, menganalisa, membuat, memodifikasi, atau bahkan mengeksploitasi sistem.  

Sudah jelas bahwa programmer dapat kita kategorikan sebagai hacker juga, bahkan lomba membuat apps dalam semalam pun diberi nama hackathon, padahal dalam hackathon tidak ada yang namanya mengeskploitasi sistem. Akan tetapi kita mengeksploitasi batas kemampuan kita agar dalam waktu yang singkat kita dapat mempelajari, menganalisa, membuat, dan menyelesaikan masalah yang ada dengan pendekatan IT. Jadi jangan pernah berkonotasi negatif terhadap hacker :)





Lantas, disebut apakah mereka yang senang merusak suatu sistem ?  

Kita sebut saja mereka **hekel kebanyakan micin** atau istilah kerennya sih **~~malkist~~ cracker**. Tapi apa kalian tega jika ilmu yang kalian dapat digunakan untuk merusak?





Oke, kita lanjut. .  

Pertanyaannya adalah dimana kita dapat mempelajari hal tersebut?  

Jawabannya adalah ~~dihatimu :*~~ disini. Kali ini saya akan memperkenalkan CTF (Capture The Flag) kepada kalian. Bisa kalian baca disini -> https://yohan.es/ctf/





Setelah dibaca, kita lanjut membahas materi utama kita :)





**0x02 Dasar Python**  

Referensi Pembelajaran/Materi:






  1. https://www.tutorialspoint.com/python/index.htm
  2. https://www.codecademy.com/learn/learn-python
  3. https://www.codepolitan.com/tutorial-set/belajar-bahasa-pemrograman-python
  4. https://www.learnpython.org/
  5. https://www.youtube.com/watch?v=cpPG0bKHYKc




Kita kembali ke requirements ya, jadi mohon kerjasamanya url diatas untuk dibuka dan dipelajari :)  

Tapi tenang, saya akan memberi contoh untuk coding python nya hehehe.  

Bagi yang belum punya python, monggo di download https://www.python.org/downloads/





**Variabel dan Tipe Data**  

Variabel berfungsi untuk menyimpan nilai, sedangkan tipe data adalah jenis nilai apakah yang disimpan di database  

Tipe Data:






  1. Integer (bilangan bulat)
  2. Float (bilangan pecahan/koma)
  3. String (teks)
  4. Boolean (true/false)
  5. None (kosong)




Contoh kode (jalankan pada python):




    
    <code>#ini komentar, tidak akan dieksekusi oleh program
    a = 10 #integer
    print a #keluarkan/output variabel a
    a = 7.5 #float
    print a
    a = "Halo dunia" #string
    print a
    a = True #boolean
    print a
    a = None #none/kosong
    print a
    </code>





**Operator**  

Contoh: tambah, kurang, bagi, kali, dan lainnya




    
    <code>a = 5
    b = 2
    #Operator Aritmatika 
    print a + b
    print a - b
    print a * b #kali
    print a / b #bagi
    print a ** b #pangkat
    print a % b #modulo(sisa pembagian)
    #Operator Pembanding (Hasil cuma true/false)
    print a == b
    print a > b
    print a < b
    print a >= b
    print a <= b
    print a != b
    #Operator Logika (Hasil cuma true/false)
    x = True
    y = False
    print x and y
    print x or y
    print x ^ y #xor
    </code>





**Control Statements**  

Jika a maka x




    
    <code>a = 10
    if a == 10:
        print "a adalah 10"
    </code>





Jika a maka x, jika bukan a maka y




    
    <code>a = 5
    if a == 10:
        print "a adalah 10"
    else:
        print "a bukan 10"
    </code>





Jika a maka x, jika b maka y, jika bukan a dan b maka z




    
    <code>a = 5
    if a == 10:
        print "a adalah 10"
    elif a == 5:
        print "a adalah 5"
    else:
        print "a bukan 10 dan 5"
    </code>





**Perulangan/Loop**  

Misal: Tulislah "Halo Dunia" sebanyak 10 baris




    
    <code>a = "Halo Dunia"
    for i in range(0,10):
        print a
    
    b = "Halo OLC"
    c = 0
    while c < 10:
        c += 1
        print b
    </code>





**0x03 Kriptografi**  

Misal anda mempunyai kata "halo" dan ingin memberikan ke teman anda berinisial Mr.Sutards, namun selain Mr.Sutards tidak ada yang boleh mengetahui kata apa yang anda kirimkan. Kita bisa menggunakan Kriptografi untuk menyandikan data :)





Ada beberapa jenis penyandian:






  1. Enkripsi
  2. Encoding
  3. Hash




Contoh:  

Data Asli kita sebut Plaintext  

Data Tersandikan kita sebut Ciphertext





Enkripsi = Plaintext < ---> Algoritma + key < ---> Ciphertext  

Encoding = Plaintext < ---> Algoritma < ---> Ciphertext  

Hash = Plaintext ---> Algoritma ---> Ciphertext (irreversible)





**Caesar Cipher (Geser)**  

Misal kita mempunyai plaintext m = "halo" dan memiliki key k = 2, maka cipher textnya c kita geser/tambahkan digit karakter sebesar key k pada plaintext dari m[i=1] sampai m[L] dimana L adalah jumlah karakter pada plaintext m dan n adalah jumlah/total alphabet dari index "a"=0 sampai index "z"=25 (n = 26).  

_Formula/Rumus:_





<blockquote>
  
> 
> c(m) = (m + k) mod n  

  m(c ) = ((c - k) + n) mod n
> 
> 
</blockquote>





m = "halo" k = 2 maka c = "jcnq"  

Contoh simpel menggunakan Python (standar tanpa mod):




    
    <code>m = "halo"
    c = ""
    k = 2
    for i in m:
        c += chr(ord(i) + k)
    print c
    </code>





**Subtitution Cipher**  

Memasukkan/Mengganti karakter x dengan y  

Contoh:  

a < -> b  

o < -> c  

u < -> d  

m = "halo dunia"  

maka c = "hblc ddnib" (karakter a, o, dan u digantikan/subtitusi oleh karakter b, c, dan d)





**XOR Cipher**  

xor cipher merupakan kriptografi **modern** dimana metode pengenkripsiannya tidak pada level karakter/alphabet seperti caesar maupun subtitution, akan tetapi pada level bit nya.  

_XOR Truth Table:_  

|x| y |output |  

| 1 | 1 | 0 |  

| 1 | 0 | 1 |  

| 0 | 1 | 1 |  

| 0 | 0 | 0 |





Misal m = "halo" maka nilai ascii (0-255) masing-masing karakter adalah:  

104, 97, 108, 111  

Maka representasi bilangan basis dua (binary) nya adalah:  

01101000, 01100001, 01101100, 01101111  

Dimisalkan pula key = 10, maka binary nya adalah 00001010 Sehingga ciphernya adalah kita xor kan masing-masing karakter dengan keynya  

h = 104 ---> 01101000 (xor) 00001010 = 01100010 (98)  

a = 97 ---> 01100001 (xor) 00001010 = 01101011 (107)  

l = 108 ---> 01101100 (xor) 00001010 = 01100110 (102)  

o = 111 ---> 01101111 (xor) 00001010 = 01100101 (101)  

Maka kita mendapatkan ciphernya yaitu:  

c = 98, 107, 102, 101  

Kita konversi ke dalam bentuk karakter:  

c = "bkfe"





_Contoh menggunakan python:_




    
    <code>m = "halo"
    k = 10
    c = ""
    for i in m:
        c += chr(ord(i) ^ k)
    print c
    </code>





Selesai, semoga bermanfaat~  

Thanks to: OmahTI UGM and Aliansi Siber Gadjah Mada



