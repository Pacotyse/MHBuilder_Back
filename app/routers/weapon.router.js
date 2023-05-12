const express = require('express');

const router = express.Router();
const { weapon } = require('../controllers/api.controller');

router.route('/')
  .get(weapon.getAll);

router.route('/:id')
  .get(weapon.getOne);

router.route('/type/:type')
  .get(weapon.getByType);

module.exports = router;

/**
Represents a weapon object.
@typedef {object} Weapon,
@property {number} id - The unique identifier for the weapon.
@property {string} type - The type of the weapon.
@property {string} name - The name of the weapon.
@property {integer} rarity - The rarity of the weapon.
@property {integer} attack - The attack of the weapon.
@property {integer} affinity - The affinity of the weapon.
@property {string} secret_effect - The secret effect of the weapon.
@property {object} sharpness - - The sharpness value of the weapon.
@property {object} element - The elements value of the weapon.
*/

/**
  GET /weapons/
  @summary Get all weapons
  @return {object} 200 - success response
  @return {Weapon} 200 - Weapon object
  @returns {object} 404 - error response
  */

/**
  GET /weapons/{id}
  @summary Get one weapon
  @param {integer} id.path.required - ID of the weapon to get
  @return {object} 200 - success response
  @return {Weapon} 200 - Weapon object
  @returns {object} 404 - error response
  */

/**
  GET /weapons/type/{type}
  @summary Get all weapons by type
  @param {string} type.path.required - Type of the weapons to get
  @return {object} 200 - success response
  @return {Weapon} 200 - Weapon object
  @returns {object} 404 - error response
  */
