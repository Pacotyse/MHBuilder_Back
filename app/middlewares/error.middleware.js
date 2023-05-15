// Handle and cath errors from routes

module.exports = {
  errorMiddleware(req, res, next) {
    try {
      next();
    } catch (error) {
      res.status(401).json({ error });
    }
  },
};
