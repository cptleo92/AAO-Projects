import React from "react";
import TodoDetailViewContainer from "./todo_detail_view_container";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);    

    this.state = {details: false}
  }

  handleClick(e) {  
    if (e.target.type !== "submit") {     
      this.setState({
        details: !this.state.details
      })    
    } 
  }

  render() {
    const todo = this.props.todo;
    const isDone = todo.done ? "Undo" : "Done"

    return (
      <div className="todo-item">
        <li className="todo-item-main" onClick={this.handleClick.bind(this)}>   
          <p>{todo.title}</p>
          <button onClick={this.props.toggleDone}>{isDone}</button>     
        </li>
        {this.state.details && <TodoDetailViewContainer todo={todo} />}     
      </div>
    )
  }
}

export default TodoListItem