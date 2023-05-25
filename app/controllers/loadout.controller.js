/* eslint-disable camelcase */
const { loadout, loadout_data } = require('../models/index.datamapper');

const loadoutController = {
  async getAll(req, res) {
    const data = await loadout_data.findAll();
    res.json(data);
  },
  async getOne(req, res) {
    const { id } = req.params;
    const data = await loadout_data.findByPk(id);
    res.json(data);
  },
  async getAllByUser(req, res) {
    const { id } = req.params;
    const data = await loadout_data.findAllBy('user_id', id);
    res.json(data);
  },
  async createOne(req, res) {
    const {
      name, description, user_id, weapon_id, head_id, chest_id, arms_id, waist_id, legs_id, stats,
    } = req.body;
    const newLoadout = await loadout.create({
      name, description, user_id, weapon_id, head_id, chest_id, arms_id, waist_id, legs_id, stats,
    });
    res.status(201).json(newLoadout);
  },
  async updateOne(req, res) {
    const loadoutId = req.params.id;
    const {
      name, description, weapon_id, head_id, chest_id, arms_id, waist_id, legs_id, stats,
    } = req.body;
    const data = await loadout.findByPk(loadoutId);
    const updatedLoadout = await loadout.update({
      id: data.id,
      name,
      description,
      weapon_id,
      head_id,
      chest_id,
      arms_id,
      waist_id,
      legs_id,
      stats,
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
