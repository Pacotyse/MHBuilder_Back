// eslint-disable-next-line import/no-extraneous-dependencies
const jwt = require('jsonwebtoken');

module.exports = {
  authentification(req, res, next) {
    const token = req.header('Authorization');
    if (!token) {
      return res.status(401).json({ error: 'Access denied. No token provided.' });
    }
    try {
      const [bearer, tokenValue] = token.split(' ');
      if (bearer !== 'Bearer' || !tokenValue) {
        return res.status(401).json({ error: 'Invalid token format.' });
      }
      const decoded = jwt.verify(tokenValue, process.env.JWT_SECRET);
      req.user = decoded;
      const userId = decoded.id;
      req.userId = userId;
      return next();
    } catch (error) {
      return res.status(401).json({ error: 'Invalid token.' });
    }
  },
};
