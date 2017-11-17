import { RECEIVE_POKE } from '../actions/pokemon_actions';

export const itemsReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_POKE:
      return action.payload.items;
    default:
      return state;
  }
};
