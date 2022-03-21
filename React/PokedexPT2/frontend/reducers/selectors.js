export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon)
}
  
export const selectItems = (state) => {
  return Object.values(state.entities.items)
}

export const selectMoves = (state) => {
  return Object.values(state.entities.moves)
}