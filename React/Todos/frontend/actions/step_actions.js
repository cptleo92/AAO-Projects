export const RECEIVE_STEPS = "RECEIVE_STEPS";
export const RECEIVE_STEP = "RECEIVE_STEP";
export const REMOVE_STEP = "REMOVE_STEP";
import * as StepAPIUtil from "../util/step_api_util"
import { receiveErrors } from "./error_actions";

export const receiveSteps = (steps) => {
  return {
    type: RECEIVE_STEPS,
    steps
  }
}

export const receiveStep = (step) => {
  return {
    type: RECEIVE_STEP,
    step
  }
}

export const removeStep = (step) => {
  return {
    type: REMOVE_STEP,
    step
  }
}

export const fetchSteps = () => {
  return dispatch => {
    return StepAPIUtil.fetchSteps().then(
      steps => dispatch(receiveSteps(steps)),
      err => dispatch(receiveErrors(err.responseJSON))
    )
  }
}

export const createStep = (step) => {
  return dispatch => {
    return StepAPIUtil.createStep(step).then(
      step => dispatch(receiveStep(step)),
      err => dispatch(receiveErrors(err.responseJSON))
    )
  }
}

export const updateStep = (step) => {
  return dispatch => {
    return StepAPIUtil.updateStep(step).then(
      step => dispatch(receiveStep(step)),
      err => dispatch(receiveErrors(err.responseJSON))
    )
  }
}

export const destroyStep = (step) => {
  return dispatch => {
    return StepAPIUtil.destroyStep(step).then(
      step => dispatch(removeStep(step)),
      err => dispatch(receiveErrors(err.responseJSON))
    )
  }
}
