import React from 'react';
import { Route, Link } from 'react-router-dom';
import ItemDetailContainer from '../item/item_detail_container';

export class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
    this.pokemonId = props.match.params.pokemonId;
  }

  componentDidMount() {
    this.props.requestSinglePoke(this.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    const newPokemonId = newProps.match.params.pokemonId;
    if (this.pokemonId !== newPokemonId ) {
      this.props.requestSinglePoke(newPokemonId);
      this.pokemonId = newPokemonId;
    }
  }

  render(){
    const currentPoke = this.props.pokemon[this.pokemonId];
    if (!currentPoke || !currentPoke.moves) {
      return null;
    }
    return (
      <section className="pokemon-detail">
        <figure>
          <img src={currentPoke.image_url}/>
        </figure>
        <ul>
          <li><h2>Name: {currentPoke.name}</h2></li>
          <li>Type: {currentPoke.poke_type}</li>
          <li>Attack: {currentPoke.attack}</li>
          <li>Defense: {currentPoke.defense}</li>
          <li>Moves: {currentPoke.moves.join(", ")}</li>
        </ul>

        <div className="poke-items">
          <h3>Items</h3>
          <ul>
            {this.props.items.map( (item) => (
              <li key={item.id}>
                <Link to={`/pokemon/${this.pokemonId}/item/${item.id}`}>
                  <img src={item.image_url}/>
                </Link>
              </li>
            ) )}
          </ul>
        </div>
        <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer}/>
      </section>
    );
  }
}
