const bcrypt = require('bcrypt');
/**
 * génère un le hash du password passé en paramètre
 * @param {*} password
 * @returns le hash du password ou null si erreur
 */
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

/**
 * Dans la route POST /users/,  intercepte le Json, code le password et le réinject dans le json
 * @param {*} req
 * @param {*} res
 * @param {*} next
 */
async function encryptMiddleware(req, res, next) {
  const { password } = req.body;
  const result = await hashPassword(password);

  if (result != null) {
    req.body.password = result;
    next();
  } else {
    res.status(500).send({ message: 'Erreur lors du hachage du mot de passe.' });
  }
}

module.exports = encryptMiddleware;
