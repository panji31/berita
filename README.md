<b>DOKUMENTASI ENDPOINT</b>
 
 <hr>

<font size="12">
<b>Teknologi Yang Digunakan</b><br>
 
1.node js<br>
2.mysql<br>
3.postman<br>
</font> 

<font size="12">
 <b>Tatacara Penggunaan</b><br>
 
1.Pastikan komputer atau laptop sudah terinstal node js,postman dan mySql sebagai databasenya<br>
2.Lakukan import database dengan nama file berita.sql dan cek koneksinya di file connection.js, user dan password di sesuaikan<br>
3.unduh semua file githubnya<br>
4.cek endpoint dengan postman<br>
5.selsai<br>
</font> 


<br><b>Skema Database</b>

<a href="https://ibb.co/56PsCj8"><img src="https://i.ibb.co/rmV5qp6/schema.jpg" alt="schema" border="0"></a>

<b>Tatacara Penggunaan dan aturan Endpoint menggunakan aplikasi Postman</b>

<b>1.Super Admin</b>

<b>Create User Narator dan Buzzer</b>

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

<b>Create News</b>

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

<b>News Buzzer</b>

deskripsi  : digunakan melihat buzzer telah menyebarkan berita apa saja

Method : GET

Url : http://localhost:5000/api/v1/superadmin/buzzernews

Format pengisian:

<b>2.Narator</b>

<b>Create News</b>

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

<b>Do Buzzer</b>

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

<b>3.Buzzer</b>

<b>Do Buzzer</b>

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

<b>View News</b>

deskripsi  : melihat berita yang dibuat narator

Method : GET

Url : http://localhost:5000/api/v1/buzzer/naratornews

Format pengisian:


