const connection = require('../connection.js');

exports.viewNews = (req, res) => {
    const id_akses = 2;
    connection.query(
        'SELECT news.* from news INNER join user on user.id_user = news.id_user WHERE user.id_akses=?', [id_akses]
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
exports.doBuzzer = (req, res) => {
    const id_news = req.body.id_news;
    const id_user = req.body.id_user;
    const id_media = req.body.id_media;

    connection.query(
        'insert into sharing(id_news,id_user,id_media) VALUES(?,?,?)', [id_news, id_user, id_media],
        function (err, rows) {
            if (err) {
                res.send(err);
            } else {
                res.send(rows);
            }
        }
    )
}