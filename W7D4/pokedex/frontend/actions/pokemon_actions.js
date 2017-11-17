// import { fetchAllPokemon } from '../util/api_util';
import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_POKE = 'RECEIVE_POKE';

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const requestAllPokemon = () => (dispatch) => {
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};

export const receivePoke = payload => ({
  type: RECEIVE_POKE,
  payload
});

export const requestSinglePoke = (id) => (dispatch) => {
  return APIUtil.fetchPoke(id)
    .then(poke => dispatch(receivePoke(poke)));
};

export const createPokemon = (pokemon) => (dispatch) => {
  return APIUtil.postPoke(pokemon)
  .then(newPoke => dispatch(receivePoke(newPoke)));
};
