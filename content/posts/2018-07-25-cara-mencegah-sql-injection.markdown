---
author: cacadosman
date: 2018-07-25 16:55:46+00:00
draft: false
title: Cara Mencegah SQL Injection
type: post
url: /cara-mencegah-sql-injection/
comments: true
categories:
- Cyber Security
- Tutorial
- Web Dev
---

Walaupun SQL Injection tergolong vuln yang sudah sangat tua, namun masih saja banyak programmer yang belum mengetahui bahaya dari SQL Injection. Sehingga banyak sekali website yang mudah terkena deface. Kali ini saya ingin memberikan cara mudah untuk mencegah SQL Injection dengan menggunakan prepared statement.

Untuk kali ini, contoh kasusnya kita menggunakan bahasa pemrograman PHP. Karena bahasa tersebut merupakan salah satu bahasa yang paling banyak penggunanya.

**PDO:**


```php
$conn = new PDO("mysql:host=$db_servername;dbname=$dbname", $db_username, $db_password);

$stmt = $conn->prepare("SELECT * FROM posts WHERE id=:id");
$stmt->bindParam(":id", $post_id);
$stmt->execute();

$posts = $stmt->fetchAll();
```


**Mysqli:**


```php
$conn = new mysqli($db_servername, $db_username, $db_password, $db_name);
$stmt = $conn->prepare("INSERT INTO posts (title, author, content) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $post_title, $post_author, $post_content);
$stmt->execute();
```


Dengan menggunakan method prepare dan bind_param, kita dapat mencegah SQL Injection.

Semoga bermanfaat, terima kasih.
