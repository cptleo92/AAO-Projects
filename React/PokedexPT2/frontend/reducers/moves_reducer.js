import { RECEIVE_POKEMON_MOVES } from "../actions/move_actions";

const movesReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_POKEMON_MOVES:
      return action.moves;
    default:
      return state;
  }
}

export default movesReducer;