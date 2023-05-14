const bcrypt = require('bcrypt');

async function hashPassword(password) {
  try {
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(password, salt);
    return hash;
  } catch (err) {
    console.error(err);
    return null;
  }
}

async function encryptMiddleware(req, res, next) {
  const { password } = req.body;
  const result = await hashPassword(password);

  if (result != null) {
    req.body.password = result;
    console.log(result);
    next();
  } else {
    console.log(result);
    res.status(500).send({ message: 'Erreur lors du hachage du mot de passe.' });
  }
}

module.exports = encryptMiddleware;
