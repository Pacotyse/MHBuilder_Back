const CoreDatamapper = require('./core.datamapper');

module.exports = class Armor extends CoreDatamapper {
  tableName = 'armor';

  async findAllByLoadout(id) {
    const preparedQuery = {
      text: `SELECT * FROM "${this.tableName}" JOIN loadout_has_armor ON armor.id = loadout_has_armor.armor_id WHERE loadout_has_armor.loadout_id = $1`,
      values: [id],
    };

    const result = await this.client.query(preparedQuery);

    if (!result.rows) {
      return null;
    }

    return result.rows;
  }
};
