export const fetchTodos = () => {
  return $.ajax({
    type: "GET",
    url: "api/todos"
  })
}

export const createTodo = (todo) => {
  console.log(todo)
  return $.ajax({
    type: "POST",
    url: "api/todos/",
    data: todo
  })
}

export const updateTodo = (todo) => {
  return $.ajax({
    type: "PATCH",
    url: "api/todos/" + todo.id,
    data: {todo}
  })
}

export const removeTodo = (todo) => {
  return $.ajax({
    type: "DELETE",
    url: "api/todos/" + todo.id
  })
}