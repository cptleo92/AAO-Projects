export const allTodos = (state) => {
  return Object.values(state.todos);
};

export const allSteps = (state) => {
  return Object.values(state.steps);
};

export const stepsByTodoId = (steps, todoId) => {
  const stepsById = [];
  Object.values(steps).forEach(step => {
    if (step.todo_id === todoId) {
      stepsById.push(step)
    }
  }) 
  return stepsById; 
}

export const allErrors = (state) => {
  return Object.values(state.errors)
}