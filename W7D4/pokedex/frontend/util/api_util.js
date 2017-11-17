export const fetchAllPokemon = () => {
  return $.ajax({
    method: 'get',
    url: '/api/pokemon'
  });
};

export const fetchPoke = (id) => {
  return $.ajax({
    method: 'get',
    url: `/api/pokemon/${id}`
  });
};

export const postPoke = (pokemon) => {
  return $.ajax({
    method: 'post',
    url: '/api/pokemon',
    data: { pokemon }
  });
};
