import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item';

export class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <ul>
        <p>This is the pokemon index</p>
        {this.props.pokemon.map((poke) => {
          return <PokemonIndexItem poke={poke} />;
          })
        }
      </ul>
    );
  }
}
