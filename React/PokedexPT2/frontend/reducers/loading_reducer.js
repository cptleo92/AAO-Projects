import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON, RECEIVE_POKEMON_ERRORS, START_LOADING_ALL_POKEMON, START_LOADING_SINGLE_POKEMON} from "../actions/pokemon_actions"

const loadingReducer = (state = false, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
    case RECEIVE_SINGLE_POKEMON: 
    case RECEIVE_POKEMON_ERRORS:
      return false
    case START_LOADING_ALL_POKEMON:
    case START_LOADING_SINGLE_POKEMON:      
      return true
    default:
      return state;
  }
}

export default loadingReducer