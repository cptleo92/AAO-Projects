import React from "react";
import uniqueId from "./todo_util";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      id: uniqueId(),
      title: "",
      body: "",
      done: false
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    const {className, value} = event.target;
    this.setState(prevState => {
      return {
        ...prevState,
        title: className === "form-title" ? value : prevState.title,
        body: className === "form-body" ? value : prevState.body,
      }
    })
  }

  handleSubmit(event) {
    event.preventDefault();

    let newTodo = {
      ...this.state,
      id: uniqueId()
    }

    this.props.receiveTodo(newTodo);
    this.setState(oldState => (
      {
        ...oldState,
        title: "",
        body: ""
      })
    )
  }

  render() {    

    return (
      <section className="form">
        <label>Title</label>
        <input 
          className="form-title" 
          type="text" 
          onChange={this.handleChange}
          value={this.state.title}
          placeholder="Buy eggs"
        />

        <label>Body</label>
        <textarea 
          className="form-body" 
          onChange={this.handleChange}
          placeholder="2 dozen, happy"
          value={this.state.body}
        />    

        <button onClick={this.handleSubmit}>Add Todo</button>
      </section>
    )
  }
}

export default TodoForm;