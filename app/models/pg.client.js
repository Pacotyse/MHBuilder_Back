const pg = require('pg');

const { Client } = pg;
const logger = require('../utils/logger');
require('dotenv').config();

const client = new Client({
  database: 'mhbuilder',
  host: 'localhost',
  user: 'spedata',
  password: 'spedata',
});

// const client = new Client({
//   database: 'mhbuilder',
//   host: 'localhost',
//   user: 'mhbuilder',
//   password: 'mhbuilder',
// });

client.connect((err) => {
  if (err) throw err;
  logger.log('Connecté à la base de données PostgreSQL !');
});

module.exports = client;
