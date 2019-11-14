const connection = require('../connection.js');

/*qeury create User*/
exports.createUser = (req, res) => {
    const username = req.body.username;
    const password = req.body.password;
    const id_akses = req.body.id_akses;

    connection.query(
        'insert into user(username,password,id_akses) VALUES(?,?,?);', [username, password, id_akses],
        function (err, rows) {
            if (err) {
                res.send(err);
            } else {
                res.send(rows);
            }
        }
    )
}

/*qeury create news*/
exports.createNews = (req, res) => {
    const title = req.body.title;
    const content = req.body.content;
    const file = req.body.file;
    const id_user = req.body.id_user;


    connection.query(
        'insert into news(title,content,file,id_user) values(?,?,?,?);', [title, content, file, id_user],
        function (err, rows) {
            if (err) {
                res.send(err);
            } else {
                res.send(rows);
            }
        }
    )
}

/*qeury view news buzzer*/
exports.viewBuzzer = (req, res) => {
    const id_akses = 3;
    connection.query(
        'SELECT user.username,news.title,media.media,count(news.title) as jumlah_sharing FROM sharing inner join user on user.id_user = sharing.id_user inner join news on news.id_news = sharing.id_news inner join media on media.id_media = sharing.id_media where user.id_akses =? group by user.username,news.title,media.media', [id_akses]
        ,
        function (err, rows) {
            if (err) {
                res.send(err);
            } else {
                res.send(rows);
            }
        }
    )
}