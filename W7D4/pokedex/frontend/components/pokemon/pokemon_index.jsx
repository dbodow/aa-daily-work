import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import { Route } from 'react-router-dom';

export class PokemonIndex extends React.Component {
  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <div>
        <ul>
          {this.props.pokemon.map((poke) => {
            return <PokemonIndexItem key={poke.id} poke={poke} />;
            })
          }
        </ul>
        <Route path='/pokemon/:pokemonId' component={ PokemonDetailContainer } />
      </div>
    );
  }
}
