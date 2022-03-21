import { RECEIVE_POKEMON_ITEMS } from "../actions/item_actions";

const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_POKEMON_ITEMS:
      return action.items
    default:
      return state;
  }
}

export default itemsReducer