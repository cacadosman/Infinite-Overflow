---
author: cacadosman
date: 2018-10-04 07:12:19+00:00
draft: false
title: Writeup Gemastik 11 - Troll
type: post
url: /writeup-gemastik-11-troll/
comments: true
categories:
- CTF
- Cyber Security
- Gemastik
- Tutorial
tags:
- ctf
- gemastik
- tutorial
- writeup
---

Terdapat sebuah service yang memiliki source code berikut:


```html
<html>
<head></head>
<body>
    <input type="text" name="f" id="f" ><input type="submit" value="Check" onclick="ck()">
<script>
ll = "length";
ca = "charCodeAt"

function k(c) {
  return (c=='O'||c=='0');
}

function n(){
  for (; !k(a[i])&& i<a[ll]; i++);
}

function ck(){
    a = troll.innerHTML;
    bb = {}
    for(i =0; i < 127; i++) {
        s = "";
        for (j = 6; j >=0 ; j--) {
            s += (i & (1<<j))?"O":"0";				
        }
        bb[i] = s;
    }
    ff = ""
    i = 0;
    cc = 0;
    n();

    for (j = 0; j<f.value[ll]; j++) {
        c = bb[f.value[ca](j)]
        for (w = 0; w < 7; w++) {
            cc |= c[ca](w)^a[ca](i);
            i++;
            n();
        }
    }
    n();

    msg = ["Incorrect flag", "Correct flag"];
    alert(msg[0+(!(k(a[i])) && (cc==0))]);
}
</script>
<pre id="troll">
QQOQ0QQQQQQQQ00QOQOOQQQQQO0QQ00OQ0QQQQQQQQOQQQQOQQQQ0QQQQ0QQQQQQQQQQQOQQQQO
QQQ0OQQOQQQQQQQ0QQQQQQQ0QQQQQQQQQQQQ0QQ0Q0QQQOQQQQQQQQQO0QQQO0Q0QQOQQQQOQQQ
QQO0QQO0QOQQQ0QQQQQQQ0QOQQQQQ0QQQ0QQQQO0QQ0QQQQQQQQQQQOO0QQQ0QQQQQQQQQQQOQQ
0QOOQQQOOQQQQQQQOQQWOQ0OOWWWBBBHHHHHHHHHBWWWQOQ0QOQQQQ0QQQQ0OQQQQQQQQQO0QQQ
OQQQOQQQQ0QQQQQD!`__ssaaaaaaaaaass_ass_s____.  -~""??9VWQQQ00QQ0OOQQQQQQ0Q0
QQQQ00QOQOOQ0P'_wmQQQWWBWV?GwwwmmWQmwwwwwgmZUVVHAqwaaaac,"?9$QQQQOQQQQQQQQQ
QOQ0Q0QQQO0W! aQWQQQQW?qw#TTSgwawwggywawwpY?T?TYTYTXmwwgZ$ma/-?4QQOQQOQQQOQ
OQQQQQQOQQW' jOQ00WTqwDYauT9mmwwawww?WWWWQQQQQ@TT?TVTT9HO0QQQ0w,-40QQQQQOQQ
QQQ0QQQO0Q[ jO0QQQyWVw2$wWWQQ0WWQWWWW7WQQQO00QQPWWQOQWQQw7WO0QWWc)WWQQQQOQO
QQQQQQQQQf jQ0QQQWWmWmm0WU???????9WWQmWQQQQQOQWjWQQOQQQQWQmQQQ0WL 4QQ0QQQOQ
Q0QQOQQP'.yOOQQQQOQOOQP"       xwa,.!4WQQQQQ0QWdWP??!"??4WWQ0QWQQc ?0WQQQQQ
QQQQ0P'_a._aamQQQW!_yF "!` ..  "??$Qa "WQOQWTVP'    "??' =QQmWWV?46/ ?QQQQ0
QQOP'sdyWQP?!`.-"?46mOQ0O0QT!m0Ogaa. ;wWQQWQaa _aawmWWQQOOQ0QQQWP4a7g -WWO0
QQ[ j@mQP'adQQP4ga, -????" +jQQQOQWQQQQQQQQQWW;)WOWWWW9QQP?"`  -?QzO7L ]O0O
QW j0k0@ jWQOD'-?$QOQ00QQOOQQQQOQQQWWQWQQQWQQQc "4QQQ0a   .QP4QQQQfWkl jQQQ
OE ]0kOk $D?`  waa "?9WWOOQP??T?47`_aamQQQQQOWWQw,-?OWWQQQOQ`"QQQD\Qf(.QWQQ
OQ,-Qm4Q/-0mQ6 "WWQma/  "??OQQQQQL 4W"- -?$QOOQWP`s,awT$QQQ@  "QW@?$:.yQ0QQ
QQm/-4wTQgQWOO,  ?4WWk 4waac -???$wa0QQQQQQQF??'imWWWWWQW?^  ` ]60Q' yQQOQQ
OQOQw,-?QmWQOOQw  a,    ?QWWQ00w _.  "????9VWaamQWV???"  a j/  ]QQf jQQOQ0O
QQQQQQw,"4QQQOQ0m,-$Qa     ???4F jQOQQ0wc ,aaas _aaaaa 4OW ]E  )WQ`=Q0QQQQQ
0QQOQOWQ/ $QQO0QQ0a ?H ]Wwa,     ???9WWWh dQWWW,=QWWU?  ?!     )WO ]QQQQQQQ
QQQQQ0QQQc-QWQQ0QQW6,  QWOWQQOk ,c                             jWQ ]QQQQQQ0
QQQ00QQQQQ,"$WQQWQQQ0g,."?OQQQ'.mQ0Qmaa,.,                . .; QWQ.]Q0OQOQ0
QQ0OQQQ0QWQa ?$WQ0WQQQQQa,."?( mQQQQQQW[:QQQQm[ ammF jy! j( } jQOQ(:QQQQOQQ
QQQQ0QQQQ0WWma "9gw?9gdB?QQwa, -??T$WOQ;:QQOWQ ]WWD _Qf +?! _jQQQWf QQOOQQO
0QQQQOQQQQQQQQQws "Tqau?9maZ?WQmaas,,    --~-- ---  . _ssawmQQQQQQk 3QQQQWQ
QQQQQQQQQQQQQQQQWQga,-?9mwad?1wdT9WQQQQQWVVTTYY?YTVWQQQQWWD5mQQPQQQ ]QQQQQQ
QQQQQQQWQQQQQQQQQQQWQQwa,-??$QwadV}mwBHHVHWWBHHUWWBVTTTV5awBQQD6QQQ ]QQQQQQ
QQQQQQQQQQQQQQQQQQQQQQWWQQga,-"9$WQQmmwwmBUUHTTVWBWQQQQWVT?96aQWQQQ ]QQQQQQ
QQQQQQQQQQWQQQQWQQQQQQQQQQQWQQma,-?9$QQWWQQQQQQQWmQmmmmmQWQQQQWQQW(.yQQQQQW
QQQQQQQQQQQQQWQQQQQQWQQQQQQQQQQQQQga%,.  -??9$QQQQQQQQQQQWQQWQQV? sWQQQQQQQ
QQQQQQQQQWQQQQQQQQQQQQQQWQQQQQQQQQQQWQQQQmywaa,;~^"!???????!^`_saQWWQQQQQQQ
QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQWWWWQQQQQmwywwwwwwmQQWQQQQQQQQQQQ
QQQQQQQWQQQWQQQQQQWQQQWQQQQQWQQQQQQQQQQQQQQQQWQQQQQWQQQWWWQQQQQQQQQQQQQQQWQ
</pre>
</body>
```



Soal yang sangat ngetroll >:(

Tidak perlu memperdulikan gambar trollnya walaupun memang dari SC nya sendiri ngecek dari gambar trollnya. Pada awalnya saya sangat kesal karena tertipu oleh muka troll yang menyebalkan, sehingga saya melamun sambil menangid bingung.

![](/wp-content/2018/10/nangid.png)


Oh sial, saya kena troll >:(

Ternyata saya sadar, ternyata sangat simpel. Kode tersebut akan melakukan pengecekan setiap string dari S[i=0] sampai S[i=n] dan apabila string tersebut salah maka nilai dari variabel **cc** pada index i itu bukan 0. Okay langsung saja kita lakukan **bruteforce **dengan memanfaatkan kodingan yang ada untuk mendapatkan flagnya.

Modifikasi fungsi ck() seperti ini dan lakukan override function/method pada menu console saat melakukan inspect element:


```javascript
function ck(){
    var status = true;
    a = troll.innerHTML;
    bb = {}
    for(i =0; i < 127; i++) {
        s = "";
        for (j = 6; j >=0 ; j--) {
            s += (i & (1<<j))?"O":"0";				
        }
        bb[i] = s;
    }
    ff = ""
    i = 0;
    cc = 0;
    n();

    for (j = 0; j<bendera[ll]; j++) {
        c = bb[bendera[ca](j)]
        for (w = 0; w < 7; w++) {
            cc |= c[ca](w)^a[ca](i);
            if(cc != 0){
                status = false;
            }
            i++;
            n();
        }
    }
    n();

    return status;
}
```


Setelah itu, kita jalankan kode tambahan untuk melakukan bruteforce:


```javascript
char = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_}{ ";
bendera = "GEMASTIK{";

while(true){
    for(var ctr=0; ctr < char.length; ctr++){
        tmp = bendera;
        bendera += char[ctr];
        if(ck()){
            console.log(bendera);
            break;
        }else{
            bendera = tmp;
        }
    }
    if(bendera[bendera.length-1] == "}"){
        break;
    }
}
```


![](/wp-content/2018/10/brute.png)

Akhirnya kita berhasil mendapatkan flag
**GEMASTIK{S0al_HTML_BikiN_ngeTr0LL}**

Terima Kasih.
