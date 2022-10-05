export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
import * as APIUtil from "../util/todo_api_util";
import { receiveErrors } from "./error_actions";

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos
  }
}

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo
  }
}

export const deleteTodo = (todo) => {
  return {
    type: REMOVE_TODO,
    todo
  }
}

export const fetchTodos = () => {
  return (dispatch) => {
    APIUtil.fetchTodos()
      .then(todos => dispatch(receiveTodos(todos)), error => console.log(error));
  }
}

export const createTodo = todo => {
  return dispatch => {
    return APIUtil.createTodo(todo).then(
      todo => dispatch(receiveTodo(todo)),
      err => dispatch(receiveErrors(err.responseJSON))
    )
  }
}

export const updateTodo = todo => {
  return dispatch => {
    return APIUtil.updateTodo(todo).then(
      todo => dispatch(receiveTodo(todo)),
      err => dispatch(receiveErrors(err.responseJSON))
    )
  }
}

export const removeTodo = todo => {
  return dispatch => {
    return APIUtil.removeTodo(todo).then(
      todo => dispatch(deleteTodo(todo)),
      err => dispatch(receiveErrors(err.responseJSON))
    )
  }
}




