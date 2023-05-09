const client = require('./pg.client');

const User = require('./user.datamapper');
const Loadout = require('./loadout.datamapper');
const LoadoutArmor = require('./loadoutArmor.datamapper');
const Armor = require('./armor.datamapper');
const Weapon = require('./weapon.datamapper');

module.exports = {
  user: new User(client),
  loadout: new Loadout(client),
  loadoutArmor: new LoadoutArmor(client),
  armor: new Armor(client),
  weapon: new Weapon(client),
};
