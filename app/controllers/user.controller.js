const { user } = require('../models/index.datamapper');

const userController = {
  async getAll(req, res) {
    try {
      const data = await user.findAll();
      res.json(data);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while getting the record.');
    }
  },
  async getOne(req, res) {
    const { id } = req.params;
    if (id === []) {
      res.send("Cette page n'existe pas !");
    }
    try {
      const data = await user.findByPk(id);
      res.json(data);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while getting the record.');
    }
  },
  async createOne(req, res) {
    const {
      email, password, pseudo, image, id_steam, id_playstation, id_xbox, id_switch,
    } = req.body;
    try {
      const newUser = await user.create({
        email, password, pseudo, image, id_steam, id_playstation, id_xbox, id_switch,
      });
      res.status(201).json(newUser);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while creating the record.');
    }
  },
  async updateOne(req, res) {
    const userId = req.params.id;
    const {
      email, password, pseudo, image, id_steam, id_playstation, id_xbox, id_switch,
    } = req.body;
    try {
      const data = await user.findByPk(userId);
      const updatedUser = await user.update({
        id: data.id, email, password, pseudo, image, id_steam, id_playstation, id_xbox, id_switch,
      });
      res.status(201).json(updatedUser);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while updating the record.');
    }
  },
  async deleteOne(req, res) {
    const userId = req.params.id;
    try {
      const deletedData = await user.delete(userId);
      res.status(201).json(deletedData);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while deleting the record.');
    }
  },
};

module.exports = userController;
