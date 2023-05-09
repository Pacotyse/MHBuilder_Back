const express = require('express');
const userRouter = require('./user.router');
const loadoutRouter = require('./loadout.router');
const armorRouter = require('./armor.router');
const weaponRouter = require('./weapon.router');
const decorationRouter = require('./decoration.router');

const router = express.Router();

router.use('/users', userRouter);
router.use('/loadouts', loadoutRouter, armorRouter);
router.use('/armors', armorRouter);
router.use('/weapons', weaponRouter);
router.use('/decorations', decorationRouter);

module.exports = router;
