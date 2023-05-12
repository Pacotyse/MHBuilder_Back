// Middleware to handle all errors from the controller
const errorMiddleware = function (req, res, next) {
  try {
    next();
  } catch (error) {
    res.status(401).json({ error });
  }
};

module.exports = {
  errorMiddleware,
};
