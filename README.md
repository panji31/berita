# berita

DOKUMENTASI ENDPOINT
===============================================================================================================================
Teknologi Yang Digunakan
1.node js
2.mysql
3.postman
===============================================================================================================================
Tatacara Penggunaan<br>
1.Pastikan komputer atau laptop sudah terinstal node js,postman dan mySql sebagai databasenya<br>
2.Lakukan import database dengan nama file berita.sql dan cek koneksinya di file connection.js, user dan password di sesuaikan<br>
3.unduh semua file githubnya<br>
4.cek endpoint dengan postman<br>
5.selsai<br>
===============================================================================================================================
Skema Database

<a href="https://ibb.co/56PsCj8"><img src="https://i.ibb.co/rmV5qp6/schema.jpg" alt="schema" border="0"></a>
===============================================================================================================================
Tatacara Penggunaan dan aturan Endpoint menggunakan aplikasi Postman

1.Super Admin

Create User Narator dan Buzzer

deskripsi  : digunakan untuk membuat user narator dan buzzer

Method : POST

Url : http://localhost:5000/api/v1/superadmin/register

Format pengisian:
username | varchar 
passsword  | varchar
id_akses | integer (isi sesuai dengan id di tabel akses)

Contoh format pengisin Raw JSON:
{
 “username”:”budi”,
“password”:”12345”,
“id_akses”:”2”
}

Create News

Method : POST

deskripsi  : digunakan untuk membuat berita

Url : http://localhost:5000/api/v1/superadmin/createNews

Format pengisian:
title | varchar 
content  | varchar
file | varchar 
id_user | integer (isi sesuai dengan id di tabel user)

Contoh format pengisin Raw JSON:
{
 “title”:”contoh judul”,
“content”:”isi konten”,
“file”:”tes.jpg”,
“id_user”:”1”
}

News Buzzer

deskripsi  : digunakan melihat buzzer telah menyebarkan berita apa saja

Method : GET

Url : http://localhost:5000/api/v1/superadmin/buzzernews

Format pengisian:

2.Narator

Create News

Method : POST

deskripsi  : digunakan untuk membuat berita oleh narator

Url : http://localhost:5000/api/v1/narator/createNews

Format pengisian:
title | varchar 
content  | varchar
file | varchar 
id_user | integer (isi sesuai dengan id di tabel user)

Contoh format pengisin Raw JSON:
{
 “title”:”contoh judul”,
“content”:”isi konten”,
“file”:”tes.jpg”,
“id_user”:”1”
}

Do Buzzer

Method : POST

deskripsi  : digunakan untuk menyebarkan berita

Url : http://localhost:5000/api/v1/narator/dobuzzer

Format pengisian:
id_news | integer (isi sesuai dengan id di tabel news)
id_user  | integer (isi sesuai dengan id di tabel user)
id_media | integer (isi sesuai dengan id di tabel media)

Contoh format pengisin Raw JSON:
{
 “id_news”:”1”,
“id_user”:”3”,
“id_media”:”1”
}

3.Buzzer

Do Buzzer

deskripsi  : melakukan sharing buzzer

Method : POST

Url : http://localhost:5000/api/v1/buzzer/dobuzzer

Format pengisian:
id_news | integer (isi sesuai dengan id di tabel news)
id_user  | integer (isi sesuai dengan id di tabel user)
id_media | integer (isi sesuai dengan id di tabel media)

Contoh format pengisin Raw JSON:
{
 “id_news”:”1”,
“id_user”:”3”,
“id_media”:”1”
}

View News

deskripsi  : melihat berita yang dibuat narator

Method : GET

Url : http://localhost:5000/api/v1/buzzer/naratornews

Format pengisian:

===============================================================================================================================
