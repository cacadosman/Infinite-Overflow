---
title: Tutorial Scraping dengan Python Selenium
author: cacadosman
type: post
date: 2019-10-07T17:06:28+00:00
url: /tutorial-scraping-dengan-python-selenium/
comments: true
categories:
  - Automation
  - Python

---
Halo semua, sekarang kita akan belajar cara scrapping menggunakan selenium dengan bahasa pemrograman python.   
Artikel ini dibuat karena banyak yang minta ajarin scrapping, akhirnya daripada website gak ada isinya, lebih baik bikin konten tentang scrapping.
 
Sebenarnya saya juga masih sangat newbie menggunakan selenium, hanya saja waktu itu pernah ikut training b\*\*b\*\* f\***** tentang UI Testing menggunakan Serenity BDD (tapi pakai java sih wkwkwk). Jadi mohon maaf apabila masih terdapat banyak kesalahan 🙂

<div class="wp-block-image">
  <figure class="aligncenter"><img src="https://www.seleniumhq.org/images/big-logo.png" alt="Image result for selenium" /></figure>
</div>

Apa itu selenium?  
Secara mudahnya selenium itu merupakan tools yang sering digunakan untuk melakukan test secara otomatisasi dengan menggunakan perantara web browser.

Biasanya selenium digunakan untuk melakukan UI Testing berdasarkan features atau skenario yang sudah didefinisikan.  
Untuk saat ini kita tidak akan melakukan testing, tetapi kita akan melakukan scrapping untuk mendapatkan data pada website tertentu.

**Requirements:**

  * Siapkan laptop/komputer dan koneksi internet
  * Google Chrome
  * Download Chromedriver.  
    Link download: <https://chromedriver.chromium.org/downloads> (Sesuaikan dengan versi chrome teman-teman)
  * Python 3.xx dan jangan lupa modul pip nya
  * Visual Studio Code atau sejenisnya
  * Extension ChroPath pada chrome.  
    Link download: <https://chrome.google.com/webstore/detail/chropath/ljngjbnaijcbncmcnjfhigebomdlkcjo?hl=en> 
  * Secangkir kopi.

Pertama, kita copy **chromedriver.exe** yang telah kita download ke **C:\Windows** (bagi pengguna jendela).  
Untuk pengguna linux, kita bisa pindahkan **chromedriver** ke **/usr/bin**

Setelah itu, install python 3.xx dan pastikan command pip bisa dijalankan.

Lalu ketikkan perintah berikut pada cmd/terminal:

`pip install selenium`

Kemudian saatnya kita ngoding, buka VSCode atau text editor favorit teman-teman 🙂

Apa website yang ingin kita scrapping?  
Kita akan melakukan scrapping pada website MyAnimeList sebagai contoh.  
<https://myanimelist.net/anime/season> 

Tampilan antarmuka website:
![MAL](/mal1.png)

Jadi rencananya, kita akan mengambil data semua judul anime pada season sekarang (Fall 2019) dan season selanjutnya (Winter 2020). Oleh karena itu, hal pertama yang akan kita lakukan adalah membuat user story atau mudahnya skenario untuk membantu kita dalam melakukan koding.

Story:

  * Pertama, kita akan membuka website MyAnimeList di halaman season sekarang
  * Kedua, kita akan mengambil semua data judul anime di halaman fall 2019 yang tampil
  * Ketiga, kita akan menekan tombol Winter 2020
  * Keempat, kita akan mengambil lagi semua data judul anime di halaman winter 2020 yang tampil.
  * Kelima, simpan kedalam file dengan format JSON

Namun, permasalahannya adalah saat membuka website MyAnimeList untuk pertama kalinya, kita akan melihat popup privacy policy yang akan mengganggu proses scrapping kita.<figure class="wp-block-image">

![MAL2](/mal2.png)

Sehingga setelah kita berhasil membuka websitenya, kita akan menekan tombol OK terlebih dahulu pada popup Privacy Policy. Oleh karena itu, kita akan merubah lagi user story yang telah kita buat.

Story:

  * Pertama, kita akan membuka website MyAnimeList di halaman season sekarang
  * Kedua, tunggu sampai popup Privacy Policy muncul dan tekan tombol OK
  * Ketiga , kita akan mengambil semua data judul anime di halaman fall 2019 yang tampil
  * Keempat , kita akan menekan tombol Winter 2020
  * Kelima, kita akan mengambil lagi semua data judul anime di halaman winter 2020 yang tampil.
  * Keenam, simpan kedalam file dengan format JSON 

Selanjutnya, kita buat tiga buah file dengan nama:

  * story.py
  * steps.py
  * pages.py

Buka story.py lalu ketikkan dengan kode berikut:

```python
from steps import MyAnimeListStep

myanimelist_step = MyAnimeListStep()

# the user is on the MyAnimeList current season page
myanimelist_step.user_open_myanimelist_website()
# the user should on privacy policy popup then click OK button
myanimelist_step.user_should_on_privacy_policy_popup_then_click_ok_button()
# the user is getting all anime titles on fall 2019 page
myanimelist_step.user_get_all_anime_titles_on_fall_2019_page()
# the user should see winter 2020 button and click on it
myanimelist_step.user_should_see_winter_2020_button_and_click_it()
# the user is getting all anime titles on winter 2020 page
myanimelist_step.user_get_all_anime_titles_on_winter_2020_page()
# the user is saving all anime titles to json file
myanimelist_step.user_save_all_anime_titles_to_json_file()

myanimelist_step.end()
```

File story.py merupakan file utama untuk menuliskan user story atau skenario yang sudah didefinisikan agar kita mudah mengetahui langkah-langkah apa saja yang harus dilakukan saat melakukan scrapping.

Lalu, kita akan membuat file steps.py yang berisikan kode berikut:

```python
from pages import MyAnimeListPage
import json

class MyAnimeListStep:
    def __init__(self):
        self.__base_url = 'https://myanimelist.net/anime/season'
        self.__myanimelist_page = MyAnimeListPage(self.__base_url)

    def user_open_myanimelist_website(self):
        pass

    def user_should_on_privacy_policy_popup_then_click_ok_button(self):
        pass

    def user_get_all_anime_titles_on_fall_2019_page(self):
        pass

    def user_should_see_winter_2020_button_and_click_it(self):
        pass

    def user_get_all_anime_titles_on_winter_2020_page(self):
        pass

    def user_save_all_anime_titles_to_json_file(self):
        pass
    
    def end(self):
        pass
```

File steps.py berfungsi sebagai level abstraksi antara kode yang berurusan langsung dengan aplikasi web dan user story. Mudahnya, agar kode lebih readable dan mudah untuk dimaintain sehingga tidak tercampur aduk.  


Untuk sementara, setiap method pada steps.py kita beri _pass_ karena belum memiliki impelementasi.  
Oleh karena itu, selanjutnya kita akan membuat file pages.py yang berisikan kode berikut:

```python
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class MyAnimeListPage:
    def __init__(self, url):
        self.__url = url
        self.__driver = webdriver.Chrome()

    def open(self, path = ""):
        self.__driver.get(self.__url + path)
```

Pada kode diatas, kita melakukan inisiasi url dan chromedriver yang akan selalu digunakan.  
Lalu kita membuat method open untuk membuka url pada browser.

Setelah itu, kita kembali ke steps.py dan tambahkan implementasi pada method user\_open\_myanimelist_website

```python
def user_open_myanimelist_website(self):
    self.__myanimelist_page.open()
```
  
Lalu kita buka pages.py untuk membuat method yang berfungsi menunggu munculnya popup dan menekan tombol OK.  
Sebelum itu, kita akan menggunakan extension ChroPath untuk mencari nilai dari XPath nya.

Caranya buka website MyAnimeList dan lakukan inspect element. Lalu tunggu sampai popup Privacy Policy muncul dan inspect tombol OK nya.

![MAL3](/mal3.png)

Lalu kita jalankan extension ChroPath nya seperti berikut

![MAL4](/mal4.png)

Lalu kita copy Rel XPath nya untuk kemudian kita pastekan pada kode.

![MAL5](/mal5.png)

Setelah kita mendapatkan Rel XPath, buka kembali pages.py dan edit seperti berikut

```python
class MyAnimeListPage:
    def __init__(self, url):
        self.__url = url
        self.__driver = webdriver.Chrome()

        self.__button_privacy_policy = "//button[contains(text(),'OK')]"
    
    def open(self, path = ""):
        self.__driver.get(self.__url + path)

    def click_button_privacy_policy(self):
        return WebDriverWait(self.__driver, 10).until(
               EC.presence_of_element_located(
               (By.XPATH, self.__button_privacy_policy))).click()
```

Pada file pages.py kita tambahkan Rel XPath pada variabel self._\_button\_privacy_policy  
Lalu, pada method click\_button\_privacy\_policy, kita gunakan WebDriverWait until dan EC.presence\_of\_element\_located untuk memastikan element yang ingin kita klik berdasarkan XPath tersebut sudah tersedia dengan limit waktu sebanyak 10 detik.

Karena nantinya WebDriverWait ini akan selalu kita gunakan, maka kita akan buat method baru agar kita dapat dengan mudah me-reusable WebDriverWait.

```python
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class MyAnimeListPage:
    def __init__(self, url):
        self.__url = url
        self.__driver = webdriver.Chrome()

        self.__button_privacy_policy = "//button[contains(text(),'OK')]"

    def __wait_until(self, ec, by, value):
        return WebDriverWait(self.__driver, 10).until(ec((by, value)))
    
    def open(self, path = ""):
        self.__driver.get(self.__url + path)

    def click_button_privacy_policy(self):
        self.__wait_until(
            EC.presence_of_element_located,
            By.XPATH, self.__button_privacy_policy
        ).click()
```

Pada file pages.py kita menambahkan method _\_wait\_until yang nantinya dapat kita reuseable di method lainnya.

Setelah itu, kita kembali ke steps.py untuk menambahkan implementasi pada method user\_should\_on\_privacy\_policy\_popup\_then\_click\_ok_button

```python
def user_should_on_privacy_policy_popup_then_click_ok_button(self):
    self.__myanimelist_page.click_button_privacy_policy()
```

Sehingga untuk sisanya, kita akan mengulangi tahapan diatas menggunakan ChroPath.  
Maka hasil akhir dari pages.py adalah seperti berikut

```python
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class MyAnimeListPage:
    def __init__(self, url):
        self.__url = url
        self.__driver = webdriver.Chrome()

        self.__button_privacy_policy = "//button[contains(text(),'OK')]"
        self.__text_title = "//a[@class='link-title']"
        self.__button_winter2020 = "//a[contains(text(),'Winter 2020')]"

    def __wait_until(self, ec, by, value):
        return WebDriverWait(self.__driver, 10).until(ec((by, value)))
    
    def open(self, path = ""):
        self.__driver.get(self.__url + path)

    def click_button_privacy_policy(self):
        self.__wait_until(
            EC.presence_of_element_located,
            By.XPATH, self.__button_privacy_policy
        ).click()

    def get_all_title(self):
        return self.__wait_until(
            EC.presence_of_all_elements_located, 
            By.XPATH, self.__text_title
        )

    def click_button_winter2020(self):
        self.__wait_until(
            EC.presence_of_element_located,
            By.XPATH, self.__button_winter2020
        ).click()

    def close(self):
        self.__driver.close()
```

Lalu untuk hasil akhir steps.py adalah seperti berikut

```python
from pages import MyAnimeListPage
import json

class MyAnimeListStep:
    def __init__(self):
        self.__base_url = 'https://myanimelist.net/anime/season'
        self.__myanimelist_page = MyAnimeListPage(self.__base_url)

    def user_open_myanimelist_website(self):
        self.__myanimelist_page.open()

    def user_should_on_privacy_policy_popup_then_click_ok_button(self):
        self.__myanimelist_page.click_button_privacy_policy()

    def user_get_all_anime_titles_on_fall_2019_page(self):
        web_element_titles = self.__myanimelist_page.get_all_title()
        self.__text_titles_fall2019 = [title.text for title in web_element_titles]

    def user_should_see_winter_2020_button_and_click_it(self):
        self.__myanimelist_page.click_button_winter2020()

    def user_get_all_anime_titles_on_winter_2020_page(self):
        web_element_titles = self.__myanimelist_page.get_all_title()
        self.__text_titles_winter2020 = [title.text for title in web_element_titles]

    def user_save_all_anime_titles_to_json_file(self):
        data = {
            'fall-2019': self.__text_titles_fall2019,
            'winter-2020': self.__text_titles_winter2020
        }

        f = open('anime_titles.json', 'w')
        f.write(json.dumps(data, indent = 4))
        f.close()
    
    def end(self):
        self.__myanimelist_page.close()
```

Lalu jalankan programnya dengan menggunakan perintah

`python story.py`

Maka kita akan mendapatkan hasilnya dalam format JSON.

![MAL6](/mal6.png)

Sebelumnya saya mohon maaf karena tidak menjelaskan semua kode yang dikarenakan akan sangat panjang dan menyita waktu karena ini berupa artikel bukan video.  
Saran saya adalah untuk mempelajarinya dari dokumentasi resminya: <https://selenium-python.readthedocs.io/index.html>

Tips paling mudah untuk belajar selenium dari awal adalah mencoba Getting Started dari dokumentasi resmi: <https://selenium-python.readthedocs.io/getting-started.html> 

Demikianlah artikel tentang tutorial scrapping dengan python selenium. Apabila masih ada pertanyaan bisa langsung tulis di kolom komentar atau mengkontak saya.

Apabila terdapat kesalahan baik yang disengaja dan tidak, saya mohon maaf dan tolong untuk dikoreksi.

Semoga artikel ini dapat bermanfaat.  
Terima kasih.