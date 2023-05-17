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
router.route('/user/:id')
  .get(loadout.getAllByUser);

module.exports = router;

/**
Represents a loadout object.
@typedef {object} Loadout
@property {number} id - The unique identifier for the loadout.
@property {string} name - The name of the loadout.
@property {string} description - The description of the loadout.
@property {integer} user_id - The ID of the user that owns the loadout.
@property {integer} head_id - The ID of the armor piece that is equipped as head.
@property {integer} chest_id - The ID of the armor piece that is equipped as chest.
@property {integer} arm_id - The ID of the armor piece that is equipped as arm.
@property {integer} waist_id - The ID of the armor piece that is equipped as waist.
@property {integer} leg_id - The ID of the armor piece that is equipped as leg.
@property {string} created_at - The date and time the loadout was created.
@property {string|null} updated_at - The date and time the loadout was last updated,
or null if never updated.
*/

/**
  GET /loadouts
  @summary Get all loadouts
  @return {object} 200 - success response
  @return {Array.<Loadout>} 200 - An array of Loadout objects
  @returns {object} 404 - error response
  */

/**
  GET /loadouts/{id}
  @summary Get a loadout by ID
  @param {integer} id.path.required - The ID of the loadout to get
  @return {object} 200 - success response
  @return {Loadout} 200 - The Loadout object
  @returns {object} 404 - error response
  */
/**
  GET /loadouts/user/id}
  @summary Get a user loadout by user_id
  @param {integer} id.path.required - The user_id of the loadout to get
  @return {object} 200 - success response
  @return {Loadout} 200 - The Loadout object
  @returns {object} 404 - error response
  */

/**
  DELETE /loadouts/{id}
  @summary Delete a loadout by ID
  @param {integer} id.path.required - The ID of the loadout to delete
  @return {object} 204 - success response
  @returns {object} 404 - error response
  */
