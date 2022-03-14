import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP } from "../actions/step_actions";

const initialState = {
  1: {
    id: 1,
    title: "pet dog",
    body: "pet 3 times",
    todo_id: 2,
    done: false
  },
  2: {
    id: 2,
    title: "drive away",
    body: "into the sunset",
    todo_id: 1,
    done: true
  }
};

const stepsReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_STEPS:
      let newState = {}
      action.steps.forEach(step => newState[step.id] = step)
      return newState;
    case RECEIVE_STEP:
      newState = Object.assign({}, state);
      newState[action.step.id] = action.step;
      return newState;
    case REMOVE_STEP:
      newState = Object.assign({}, state);
      delete newState[action.step.id];
      return newState;
    default:
      return state;
  }
}

export default stepsReducer;