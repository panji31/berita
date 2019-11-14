'use strict'

/*setup connection for mysqli
host : ,
host : ,
data:
*/
const mysql = require('mysql');
const connectionSQL = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'berita'
});

/*connection status*/
connectionSQL.connect(function (err) {
    if (err) {
        console.log('Database Failed to Connect');
    } else {
        console.log('Database Connected Successfully');
    }
});

module.exports = connectionSQL;