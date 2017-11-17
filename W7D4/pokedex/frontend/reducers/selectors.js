import { values } from 'lodash';

export const selectAllPokemon = state => (
  values(state.entities.pokemon)
);

export const selectItem = (id, itemArray) => {
  for (let idx = 0; idx < itemArray.length; idx++) {
    if (itemArray[idx]["id"] === id) {
      return itemArray[idx];
    }
  }
};
