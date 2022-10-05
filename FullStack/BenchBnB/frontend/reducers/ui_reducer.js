import { combineReducers } from "redux";
import filtersReducer from "./filter_reducer"

const uiReducer = combineReducers({
  filters: filtersReducer
})

export default uiReducer;