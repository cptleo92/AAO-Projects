export const fetchAllPokemon = () => {
  return $.ajax({
    method: "GET",
    url: "/api/pokemon"
  })
}

export const fetchSinglePokemon = (pokeId) => {
  return $.ajax({
    method: "GET",
    url: `/api/pokemon/${pokeId}`
  })
}

export const sendNewPokemon = pokemon => {
  return $.ajax({
    method: "POST",
    url: "/api/pokemon",
    data: {pokemon}
  })
}