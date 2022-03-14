import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";

class TodoList extends React.Component {
  constructor(props) {
    super(props);

    this.toggleDone = this.toggleDone.bind(this);
  }

  toggleDone(todo) {   
    return () => this.props.receiveTodo({
      ...todo,
      done: !todo.done
    })
  }

  render() {
    return (
      <div className="todo-list">
        <ul>
          {
            this.props.todos.map(todo => 
              <TodoListItem 
                key={todo.id} 
                todo={todo} 
                removeTodo={this.props.removeTodo} 
                toggleDone={this.toggleDone(todo)}               
              />)
          }
        </ul>
        <TodoForm 
          receiveTodo={this.props.receiveTodo}           
        />
      </div>
    )
  }
}

export default TodoList