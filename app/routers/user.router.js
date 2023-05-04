const express = require('express');

const router = express.Router();
const { user } = require('../controllers/api.controller');

router.route('/')
  .get()
  .post();
router.route('/:id')
  .get()
  .put()
  .delete();

module.exports = router;
