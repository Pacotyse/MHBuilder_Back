// eslint-disable-next-line import/no-extraneous-dependencies
const Joi = require('joi');

module.exports = Joi.object({
  email: Joi.string().email(),
  password: Joi.string().min(8).max(16),
  username: Joi.string().min(5).max(20),
});
