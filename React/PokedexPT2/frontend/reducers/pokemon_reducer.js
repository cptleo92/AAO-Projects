import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from './../actions/pokemon_actions';


const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type){
  case RECEIVE_ALL_POKEMON:
    return Object.assign({}, state, action.pokemon);
  case RECEIVE_SINGLE_POKEMON:
    let newState = Object.assign({}, state);
    newState[action.pokemon.id] = action.pokemon;
    return newState;
  default:
    return state;
  }
}
  
export default pokemonReducer;
