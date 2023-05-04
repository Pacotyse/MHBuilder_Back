const express = require('express');

const router = express.Router();
const { weapon } = require('../controllers/api.controller');

router.route('/')
  .get(weapon.getAll);

router.route('/:id')
  .get(weapon.getOne);

module.exports = router;
