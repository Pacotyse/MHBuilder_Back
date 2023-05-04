const express = require('express');
const routerApi = require('./routers/api.router');

const app = express();
app.use(express.json());
app.use(routerApi);

module.exports = app;
