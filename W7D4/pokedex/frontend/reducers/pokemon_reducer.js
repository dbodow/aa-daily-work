import merge from 'lodash/merge';
import { RECEIVE_ALL_POKEMON, RECEIVE_POKE } from '../actions/pokemon_actions';

export const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, action.pokemon);
    case RECEIVE_POKE:
      const newPokemon = {
        [action.payload.pokemon.id]: action.payload.pokemon
      };
      return merge({}, state, newPokemon);
    default:
      return state;
  }
};
