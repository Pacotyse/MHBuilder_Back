const { weapon } = require('../models/index.datamapper');

const weaponController = {
  async getAll(req, res) {
    const data = await weapon.findAll();
    res.json(data);
  },
  async getByType(req, res) {
    const { type } = req.params;
    const data = await weapon.findByType(type);
    res.json(data);
  },
  async getOne(req, res) {
    const { id } = req.params;
    const data = await weapon.findByPk(id);
    res.json(data);
  },
};

module.exports = weaponController;
