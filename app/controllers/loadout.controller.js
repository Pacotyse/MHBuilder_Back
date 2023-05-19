/* eslint-disable camelcase */
const { loadout } = require('../models/index.datamapper');

const loadoutController = {
  async getAll(req, res) {
    const data = await loadout.findAll();
    res.json(data);
  },
  async getOne(req, res) {
    const { id } = req.params;
    const data = await loadout.findByPk(id);
    res.json(data);
  },
  async getAllByUser(req, res) {
    const { id } = req.params;
    const data = await loadout.findAllBy('user_id', id);
    res.json(data);
  },
  async createOne(req, res) {
    const {
      name, description, weapon_id,
    } = req.body;
    const newLoadout = await loadout.create({
      name, description, weapon_id,
    });
    res.status(201).json(newLoadout);
  },
  async updateOne(req, res) {
    const loadoutId = req.params.id;
    const {
      name, description, weapon_id,
    } = req.body;
    const data = await loadout.findByPk(loadoutId);
    const updatedLoadout = await loadout.update({
      id: data.id, name, description, weapon_id,
    });
    res.status(201).json(updatedLoadout);
  },
  async deleteOne(req, res) {
    const loadoutId = req.params.id;
    const deletedData = await loadout.delete(loadoutId);
    res.status(201).json(deletedData);
  },
};

module.exports = loadoutController;
