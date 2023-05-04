const client = require('./pg.client');

const User = require('./user.datamapper');
const Loadout = require('./loadout.datamapper');
const Armor = require('./armor.datamapper');

module.exports = {
  user: new User(client),
  loadout: new Loadout(client),
  armor: new Armor(client),
};
