const express = require('express');

const router = express.Router();
const { armor } = require('../controllers/api.controller');

router.route('/')
  .get(armor.getAll);

router.route('/:id')
  .get(armor.getOne);

module.exports = router;
