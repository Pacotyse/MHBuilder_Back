// eslint-disable-next-line import/no-extraneous-dependencies
const bcrypt = require('bcrypt');
const { user } = require('../models/index.datamapper');

module.exports = {
  // eslint-disable-next-line consistent-return
  async check(req, res) {
    const { email, password } = req.body;
    try {
      const data = await user.findByEmail(email);
      if (!data) {
        return res.status(404).json({ error: 'Invalid login' });
      }
      const passwordMatch = await bcrypt.compare(password, data.password);
      if (!passwordMatch) {
        return res.status(401).json({ error: 'Invalid login' });
      }
      res.json(data);
    } catch (error) {
      return res.status(500).json({ error: 'Internal Server Error' });
    }
  },
};
