const express = require('express');

const router = express.Router();
const { skill } = require('../controllers/api.controller');

router.route('/')
  .get(skill.getAll);

router.route('/:id')
  .get(skill.getOne);

module.exports = router;
