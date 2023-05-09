const express = require('express');

const router = express.Router();
const { decoration } = require('../controllers/api.controller');

router.route('/')
  .get(decoration.getAll);

router.route('/:id')
  .get(decoration.getOne);

module.exports = router;
