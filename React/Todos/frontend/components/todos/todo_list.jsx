import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";

class TodoList extends React.Component {
  constructor(props) {
    super(props);

    this.toggleDone = this.toggleDone.bind(this);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  toggleDone(oldTodo) {   
    return () => {      
      const todo = { ...oldTodo, done: !oldTodo.done }
      this.props.updateTodo(todo)
      }    
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
          createTodo={this.props.createTodo}
          errors={this.props.errors}
          clearErrors={this.props.clearErrors}
        />
      </div>
    )
  }
}

export default TodoList