/*body parser*/
const bodyParser = require("body-parser");

/*jwt*/
const jwt = require('jsonwebtoken');

/*group routes*/
require('express-group-routes');

/*express*/
const express = require("express");
const port = 5000;
const app = express();

/*model*/
const superadmin = require("./controllers/superadmin");
const narator = require("./controllers/narator");
const buzzer = require("./controllers/buzzer");

//middlewares
const { authenticated } = require('./middleware');

app.use(bodyParser.json());


app.group("/api/v1", (router) => {
    router.post('/superadmin/register', superadmin.createUser);
    router.post('/superadmin/createNews', superadmin.createNews);
    router.get('/superadmin/buzzernews', superadmin.viewBuzzer);

    router.post('/narator/createNews', narator.createNews);
    router.post('/narator/dobuzzer', narator.doBuzzer);

    router.get('/buzzer/naratornews', buzzer.viewNews);
    router.post('/buzzer/dobuzzer', buzzer.doBuzzer);
})

app.get('/', function (req, res) {
    res.send('tes koneksi');
})


/*listing port */
app.listen(port, () => console.log('connected'));  