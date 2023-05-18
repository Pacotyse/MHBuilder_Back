const stats = {
  attack: 100,
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
    fire: 150,
    water: 0,
    thunder: 0,
    ice: 0,
    dragon: 0,
  },
  skills: [],
};

const field = 'elements.fire';

if (field.includes('.')) {
  console.log(field);
  const [object, element] = field.split('.');
  stats[object][element] += 100;
} else {
  console.log(field);
  stats[field] += 100;
}

console.log(stats);
