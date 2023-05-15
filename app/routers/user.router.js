const express = require('express');
const userSchema = require('../schemas/user.schema');
const validate = require('../middlewares/validate.middleware');
const login = require('../services/login.service');
const encrypt = require('../middlewares/encrypt.middleware');

const router = express.Router();
const { user } = require('../controllers/api.controller');

router.route('/')
  .get(user.getAll);

router.route('/:id')
  .get(user.getOne)
  .put(user.updateOne)
  .delete(user.deleteOne);

router.route('/register')
  .post(validate(userSchema, 'body'), encrypt.password, user.createOne);

router.route('/login')
  .post(login.check);

module.exports = router;

/**
Represents a user object.
@typedef {object} User
@property {number} id - The unique identifier for the user.
@property {string} email - The user's email address.
@property {string} password - The user's password.
@property {string} username - The user's username.
@property {string} created_at - The date and time the user was created.
@property {string|null} updated_at - The date and time the user was last updated,
or null if never updated.
*/

/**
  GET /users/
  @summary Get one user
  @return {object} 200 - success response
  @return {Array.<User>} 200 - User object
  @returns {object} 404 - error response
  */

/**
  GET /users/{id}
  @summary Get one user
  @param {integer} id.path.required - ID of the user to get
  @return {object} 200 - success response
  @return {User} 200 - User object
  @returns {object} 404 - error response
  */

/**
  PUT /users/{id}
  @summary Post a new user user
  @param {integer} id.path.required - ID of the user to get
  @param {object} request.body.required required - User information
  @param {string} request.body.email.required required - User information
  @param {string} request.body.password.required required - User information
  @param {string} request.body.username.required required - User information
  @return {object} 200 - success response
  @return {User} 200 - User object
  @returns {object} 404 - error response
  */

/**
  DELETE /users/{id}
  @summary Delete a user
  @param {integer} id.path.required - ID of the user to get
  @return {object} 200 - success response
  @return {User} 200 - User object
  @returns {object} 404 - error response
  */

/**
  POST /users/register
  @summary Register a new user
  @param {object} request.body.required required - User information
  @param {string} request.body.email.required required - User information
  @param {string} request.body.password.required required - User information
  @param {string} request.body.username.required required - User information
  @return {object} 200 - success response
  @return {User} 200 - User object
  @returns {object} 404 - error response
  */

/**
  POST /users/login {email, password}
  @sumary User verification
  @param {string} request.body.email.required required - User information
  @param {string} request.body.password.required required - User information
  @return {User} 200 - User object
  @returns {object} 404 - error response
 */
