const client = require('./pg.client');

const User = require('./user.datamapper');
const Loadout = require('./loadout.datamapper');

module.exports = {
  user: new User(client),
  loadout: new Loadout(client),
};
