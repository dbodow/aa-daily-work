import React from 'react';

export const PokemonIndexItem = (poke) => {
  console.log(poke);
  return (
    <li key={poke.poke.id}>
      {poke.poke.name}
      <br />
      <img src={poke.poke.image_url} />
    </li>
  );
};
