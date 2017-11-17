import { RECEIVE_POKE } from '../actions/pokemon_actions';

export const uiReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_POKE:
      return {pokeDisplay: action.payload.pokemon.id};
    default:
      return state;
  }
};
