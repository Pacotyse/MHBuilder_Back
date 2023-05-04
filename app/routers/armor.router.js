const express = require('express');

const router = express.Router();
const { armor } = require('../controllers/api.controller');

router.route('/')
  .get();

router.route('/:id')
  .get();

module.exports = router;
