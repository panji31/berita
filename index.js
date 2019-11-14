/*body parser*/
const bodyParser = require("body-parser");

/*group routes*/
require('express-group-routes');

/*express using port:5000*/
const express = require("express");
const port = 5000;
const app = express();

/*contoller*/
const superadmin = require("./controllers/superadmin");
const narator = require("./controllers/narator");
const buzzer = require("./controllers/buzzer");

/*body parser*/
app.use(bodyParser.json());

/*list Api versi 1 */
app.group("/api/v1", (router) => {
    /*endpoint superAdmin*/
    router.post('/superadmin/register', superadmin.createUser);
    router.post('/superadmin/createNews', superadmin.createNews);
    router.get('/superadmin/buzzernews', superadmin.viewBuzzer);

    /*endpoint narator*/
    router.post('/narator/createNews', narator.createNews);
    router.post('/narator/dobuzzer', narator.doBuzzer);

    /*endpoint buzzer*/
    router.get('/buzzer/naratornews', buzzer.viewNews);
    router.post('/buzzer/dobuzzer', buzzer.doBuzzer);
})

/*listing port */
app.listen(port, () => console.log('connected'));  