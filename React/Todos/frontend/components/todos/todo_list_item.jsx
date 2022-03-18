import React from "react";
import TodoDetailViewContainer from "./todo_detail_view_container";
import TagList from "./tag_list";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);    

    this.state = {details: false}

    this.getTagNames = this.getTagNames.bind(this)
  }

  handleClick(e) {  
    if (e.target.type !== "submit") {     
      this.setState({
        details: !this.state.details
      })    
    } 
  }

  getTagNames(todo) {
    const names = [];
    todo.tags.forEach(tag => {
      names.push(tag.name)
    })  
    return names;
  }

  render() {
    const todo = this.props.todo;
    const isDone = todo.done ? "Undo" : "Done"
    const buttonStyle = {
      backgroundColor: todo.done ? "lightgray" : ""
    }
    
    const hasTags = todo.tags.length !== 0;

    return (
      <div className="todo-item">
        <li className="todo-item-main" onClick={this.handleClick.bind(this)}>   
          <p>{todo.title}</p>
          <button style={buttonStyle} onClick={this.props.toggleDone}>{isDone}</button>     
        </li>
        { hasTags && <TagList tags={this.getTagNames(todo)}/> }
        {this.state.details && <TodoDetailViewContainer todo={todo} />}     
      </div>
    )
  }
}

export default TodoListItem