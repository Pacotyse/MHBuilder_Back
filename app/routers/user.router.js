const express = require('express');

const router = express.Router();
const { user } = require('../controllers/api.controller');

router.route('/')
  .get(user.getAll)
  .post(user.createOne);
router.route('/:id')
  .get(user.getOne)
  .put(user.updateOne)
  .delete(user.deleteOne);

module.exports = router;
