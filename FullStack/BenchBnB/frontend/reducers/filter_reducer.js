import { CHANGE_FILTER } from "../actions/filter_actions"

const defaultState = {
  bounds: {},
  minSeating: 1,
  maxSeating: 20
}

export default (state = defaultState, action) => {
  switch (action.type) {
    case CHANGE_FILTER:
      return {...state, [action.filter]: action.value }
    default:
      return state;
  }
}