import React from "react";
import StepListContainer from "../step_list/step_list_container.jsx"

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const todo = this.props.todo;
    return (
      <li className="todo-details">
        <div className="todo-details-main">
          <p>{todo.body}</p>
          <button onClick={() => this.props.removeTodo(todo)}>Delete</button>
        </div>
        <StepListContainer todo_id={todo.id}/>
      </li>
    )
  }
}

export default TodoDetailView