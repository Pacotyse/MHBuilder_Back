/* eslint-disable no-restricted-syntax */
const { skill } = require('../models/index.datamapper');

module.exports = {
  async stats(req, res) {
    const data = req.body;
    console.log(data);

    const stats = {
      attack: 0,
      affinity: 0,
      elements: {
        fire: 0,
        water: 0,
        thunder: 0,
        ice: 0,
        dragon: 0,
      },
      defense: 0,
      resistances: {
        fire: 0,
        water: 0,
        thunder: 0,
        ice: 0,
        dragon: 0,
      },
      skills: [],
    };

    for (const loadoutPiece of Object.values(data)) {
      if (loadoutPiece && loadoutPiece.attack) {
        stats.attack += loadoutPiece.attack;
      }

      if (loadoutPiece && loadoutPiece.affinity) {
        stats.affinity += loadoutPiece.affinity;
      }

      if (loadoutPiece && loadoutPiece.defense) {
        stats.defense += loadoutPiece.defense;
      }
      if (loadoutPiece && loadoutPiece.defense_bonus) {
        stats.defense += loadoutPiece.defense_bonus;
      }

      if (loadoutPiece && loadoutPiece.resistances) {
        for (const [element, value] of Object.entries(loadoutPiece.resistances)) {
          stats.resistances[element] += value;
        }
      }

      if (loadoutPiece && loadoutPiece.skills) {
        for (const oneSkill of loadoutPiece.skills) {
          const existingSkill = stats.skills.find((s) => s.id === oneSkill.id);
          if (existingSkill) {
            existingSkill.level += oneSkill.level;
            if (existingSkill.level > oneSkill.level_max) {
              existingSkill.level = oneSkill.level_max;
            }
          } else {
            stats.skills.push({
              id: oneSkill.id,
              name: oneSkill.name,
              level: oneSkill.level,
              level_max: oneSkill.level_max,
            });
          }
        }
      }
    }

    for (const oneSkill of stats.skills) {
      const dataSkill = await skill.findEffect(oneSkill.id, oneSkill.level);
      if (dataSkill && dataSkill.modifier_field) {
        const field = dataSkill.modifier_field;
        const operator = dataSkill.modifier_operator;
        const value = dataSkill.modifier_value;

        if (field.includes('.')) {
          const [object, element] = field.split('.');
          if (operator === '+') {
            stats[object][element] += value;
          } else if (operator === '*') {
            stats[object][element] *= value;
          }
        } else if (operator === '+') {
          stats[field] += value;
        } else if (operator === '*') {
          stats[field] *= value;
        }
      }
    }

    res.json({ stats });
  },
};
