-- Deploy mhbuilder:view to pg

BEGIN;

CREATE VIEW armor_with_skill AS
SELECT armor.id, armor.name, armor.type, armor.rarity, armor.defense, armor.resistance_fire, armor.resistance_water, armor.resistance_thunder, armor.resistance_ice, armor.resistance_dragon, skill.name AS skill_name, skill.description AS skill_description, ahs.level, effect.description AS effect_description
FROM armor
JOIN armor_has_skill ahs ON armor.id = ahs.armor_id
JOIN skill ON ahs.skill_id = skill.id
JOIN effect ON skill.id = effect.skill_id AND ahs.level = effect.level;

CREATE VIEW weapon_with_element AS
SELECT weapon.id, weapon.name, weapon.rarity, weapon.affinity, weapon.defense_bonus, weapon.secret_effect, json_build_object(
    'red', weapon.sharpness_red,
    'orange', weapon.sharpness_orange,
    'yellow', weapon.sharpness_yellow,
    'green', weapon.sharpness_green,
    'blue', weapon.sharpness_blue,
    'white', weapon.sharpness_white,
    'purple', weapon.sharpness_purple
  ) AS sharpness, element.name AS element, weapon_has_element.value AS elemental_damage FROM weapon 
JOIN weapon_has_element ON weapon_id = weapon.id
JOIN element on element.id = element_id;

CREATE VIEW loadout_with_armor AS
SELECT loadout.id, loadout.name, loadout.description, armor_with_skill, loadout.created_at FROM loadout
JOIN loadout_has_armor ON loadout.id = loadout_has_armor.loadout_id
JOIN armor_with_skill ON loadout_has_armor.armor_id = armor_with_skill.id
JOIN weapon_with_element ON loadout.weapon_id = weapon_with_element.id;

COMMIT;
