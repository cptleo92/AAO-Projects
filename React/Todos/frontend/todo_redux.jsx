import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root"
import { allTodos, stepsByTodoId } from "./reducers/selectors";

// --- FOR TESTING ---
import { receiveTodos, receiveTodo, removeTodo, fetchTodos } from "./actions/todo_actions"
import { receiveSteps, receiveStep, removeStep } from "./actions/step_actions"
window.newTodos = [{ id: 1, title: "buy eggs", body: "two dozen", done: false }, { id: 2, title: "clean house" }, {id: 3, title: "laundry", body: "all towels", done: true}];
// window.newTodoA = {id: 4, title: "go home", body: "it's late", done: false}
// window.newTodoB = {id: 1, title: "go home", body: "it's late", done: false}
window.store = configureStore;
window.receiveTodos = receiveTodos;
// window.receiveTodo = receiveTodo;
// window.removeTodo = removeTodo;
window.receiveSteps = receiveSteps;
window.receiveStep = receiveStep;
window.removeStep = removeStep;
window.allTodos = allTodos;
window.stepsByTodoId = stepsByTodoId;
window.fetchTodos = fetchTodos;

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <Root store={configureStore}/>, 
    document.getElementById("root"));
})