// eslint-disable-next-line import/no-extraneous-dependencies
const jwt = require('jsonwebtoken');

module.exports = {
  authentification(req, res, next) {
    const token = req.header('Authorization');
    if (!token) {
      return res.status(401).json({ error: 'Access denied. No token provided.' });
    }
    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET);
      req.user = decoded;
      return next();
    } catch (error) {
      return res.status(401).json({ error: 'Invalid token.' });
    }
  },
};
