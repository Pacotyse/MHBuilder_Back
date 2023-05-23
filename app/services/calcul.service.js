/* eslint-disable no-restricted-syntax */
const { skill } = require('../models/index.datamapper');

module.exports = {
  async stats(req, res) {
    const data = req.body;

    const stats = {
      attack: 0,
      affinity: 0,
      elements: [],
      sharpness: {
        red: 0,
        orange: 0,
        yellow: 0,
        green: 0,
        blue: 0,
        white: 0,
        purple: 0,
        inactiv: 0,
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

      if (loadoutPiece && loadoutPiece.sharpness) {
        for (const [sharpness, value] of Object.entries(loadoutPiece.sharpness)) {
          if (value != null) {
            stats.sharpness[sharpness] += value;
          }
        }
      }

      if (loadoutPiece && loadoutPiece.element !== null) {
        if (loadoutPiece && loadoutPiece.elements) {
          for (const element of loadoutPiece.elements) {
            stats.elements.push(element);
          }
        }
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
              color: oneSkill.color,
            });
          }
        }
      }
    }

    for (const oneSkill of stats.skills) {
      // eslint-disable-next-line no-await-in-loop
      const dataSkill = await skill.findEffect(oneSkill.id, oneSkill.level);
      if (dataSkill && dataSkill.modifier) {
        for (const modifier of dataSkill.modifier) {
          const { field, operator, value } = modifier;

          if (field.includes('.')) {
            const [object, element] = field.split('.');
            if (object === 'elements') {
              const chosenElement = stats[object]?.find((e) => e && e.name === element);

              if (chosenElement) {
                if (operator === '+') {
                  chosenElement.value += value;
                } else if (operator === '*') {
                  chosenElement.value *= value;
                } else if (operator === '-') {
                  chosenElement.value -= value;
                }
              }
            }
            if (operator === '+') {
              stats[object][element] += value;
            } else if (operator === '*') {
              stats[object][element] *= value;
            } else if (operator === '-') {
              stats[object][element] -= value;
            }
          } else if (operator === '+') {
            stats[field] += value;
          } else if (operator === '*') {
            stats[field] *= value;
          } else if (operator === '-') {
            stats[field] -= value;
          }
        }
      }
    }

    res.json({ stats });
  },
};
