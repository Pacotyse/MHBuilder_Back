const express = require('express');

const router = express.Router();
const { loadout, armor } = require('../controllers/api.controller');

router.route('/')
  .get(loadout.getAll)
  .post(loadout.createOne);
router.route('/:id')
  .get(loadout.getOne)
  .put(loadout.updateOne)
  .delete(loadout.deleteOne);
router.route('/:idLoadout/armors')
  .get(armor.getAllByLoadout);
router.route(':idLoadout/armors/:idArmor');

module.exports = router;
