const express = require('express');

const router = express.Router();
const { armor } = require('../controllers/api.controller');

router.route('/')
  .get(armor.getAll);

router.route('/:id')
  .get(armor.getOne);

//! TODO
router.route('/:type')
  .get();

module.exports = router;

/**
Represents an armor object.
@typedef {object} Armor
@property {number} id - The unique identifier for the armor.
@property {string} type - The type of the armor.
@property {string} name - The name of the armor.
@property {integer} rarity - The rarity of the armor.
@property {integer} defense - The defense value of the armor.
@property {integer} resistance_fire - The fire resistance value of the armor.
@property {integer} resistance_water - The water resistance value of the armor.
@property {integer} resistance_thunder - The thunder resistance value of the armor.
@property {integer} resistance_ice - The ice resistance value of the armor.
@property {integer} resistance_dragon - The dragon resistance value of the armor.
*/

/**
  GET /armors/
  @summary Get all armors
  @return {object} 200 - success response
  @return {Array.<Armor>} 200 - Array of Armor objects
  @returns {Error} 404 - error response
  */

/**
  GET /armors/{id}
  @summary Get one armor
  @param {integer} id.path.required - ID of the armor to get
  @return {object} 200 - success response
  @return {Armor} 200 - Armor object
  @returns {Error} 404 - error response
  */
