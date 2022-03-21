export const RECEIVE_POKEMON_MOVES = "RECEIVE_POKEMON_MOVES"

export const receivePokemonMoves = (moves) => ({
  type: RECEIVE_POKEMON_MOVES,
  moves
})