const express = require('express');

const router = express.Router();
const { loadout } = require('../controllers/api.controller');

router.route('/')
  .get(loadout.getAll)
  .post(loadout.createOne);
router.route('/:id')
  .get(loadout.getOne)
  .put(loadout.updateOne)
  .delete(loadout.deleteOne);

module.exports = router;
