import { values } from 'lodash';

export const selectAllPokemon = state => (
  values(state.entities.pokemon)
);

// Object.keys(state.entities.pokemon).map((pokeKey) => (
//   {`${pokeKey}`: state.entities.pokemon[pokeKey]}
// ))
