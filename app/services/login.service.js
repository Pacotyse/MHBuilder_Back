/* eslint-disable import/no-extraneous-dependencies */
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { user } = require('../models/index.datamapper');

module.exports = {
  // eslint-disable-next-line consistent-return
  async authentify(req, res) {
    const { email, password } = req.body;
    const data = await user.findByEmail(email);
    const passwordMatch = await bcrypt.compare(password, data.password);
    if (!data || !passwordMatch) {
      return res.status(400).json({ error: 'Invalid login or password' });
    }
    const token = jwt.sign({
      id: data.id,
      email: data.email,
      username: data.username,
      ip: req.ip,
    }, process.env.JWT_SECRET, { expiresIn: 3600 });
    return res.json({ token });
  },
};
