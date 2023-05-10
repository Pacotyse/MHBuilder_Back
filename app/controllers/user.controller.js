const { user } = require('../models/index.datamapper');

const userController = {
  async getAll(req, res) {
    const data = await user.findAll();
    res.json(data);
  },
  async getOne(req, res) {
    const { id } = req.params;
    const data = await user.findByPk(id);
    res.json(data);
  },
  async createOne(req, res) {
    const {
      email, password, username,
    } = req.body;
    const newUser = await user.create({
      email, password, username,
    });
    res.status(201).json(newUser);
  },
  async updateOne(req, res) {
    const userId = req.params.id;
    const {
      email, password, username,
    } = req.body;
    const data = await user.findByPk(userId);
    const updatedUser = await user.update({
      id: data.id, email, password, username,
    });
    res.status(201).json(updatedUser);
  },
  async deleteOne(req, res) {
    const userId = req.params.id;
    const deletedData = await user.delete(userId);
    res.status(201).json(deletedData);
  },
};

module.exports = userController;
