const CoreDatamapper = require('./core.datamapper');

module.exports = class User extends CoreDatamapper {
  tableName = 'user';
};
