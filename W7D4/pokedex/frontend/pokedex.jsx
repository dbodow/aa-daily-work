import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';
import { configureStore } from './store/store';

import { fetchAllPokemon, postPoke } from './util/api_util';
import { RECEIVE_ALL_POKEMON,
         receiveAllPokemon,
         requestAllPokemon} from './actions/pokemon_actions.js';
import { selectAllPokemon } from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.postPoke = postPoke;
  ReactDOM.render(<Root store={store}/>, rootEl);

});
