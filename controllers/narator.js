const connection = require('../connection.js');

/*qeury view news*/
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
/*qeury do buzzer*/
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