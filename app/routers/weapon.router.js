const express = require('express');

const router = express.Router();
const { weapon } = require('../controllers/api.controller');

router.route('/')
  .get(weapon.getAll);

router.route('/:id')
  .get(weapon.getOne);

//! TODO
router.route('/:type')
  .get();

module.exports = router;

/**
Represents a weapon object.
@typedef {object} Weapon,
@property {number} id - The unique identifier for the weapon.
@property {string} type - The type of the weapon.
@property {string} name - The name of the weapon.
@property {integer} rarity - The rarity of the weapon.
@property {integer} affinity - The affinity of the weapon.
@property {string} secret_effect - The secret effect of the weapon.
@property {integer} sharpness_red - The sharpness value of the weapon in the red zone.
@property {integer} sharpness_orange - The sharpness value of the weapon in the orange zone.
@property {integer} sharpness_yellow - The sharpness value of the weapon in the yellow zone.
@property {integer} sharpness_green - The sharpness value of the weapon in the green zone.
@property {integer} sharpness_blue - The sharpness value of the weapon in the blue zone.
@property {integer} sharpness_white - The sharpness value of the weapon in the white zone.
@property {integer} sharpness_purple - The sharpness value of the weapon in the purple zone.
@property {integer} element_fire - The fire element of the weapon.
@property {integer} element_water - The water element of the weapon.
@property {integer} element_thunder - The thunder element of the weapon.
@property {integer} element_ice - The ice element of the weapon.
@property {integer} element_dragon - The dragon element of the weapon.
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
