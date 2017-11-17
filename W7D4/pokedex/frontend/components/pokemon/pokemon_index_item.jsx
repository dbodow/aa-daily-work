import React from 'react';
import { Link } from 'react-router-dom';


export const PokemonIndexItem = ({ poke }) => {
  return (
    <li>
      <Link to={`/pokemon/${poke.id}`}>
        {poke.name}
        <img src={poke.image_url} />
      </Link>
    </li>
  );
};
