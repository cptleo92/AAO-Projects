import React from "react";
import uniqueId from "../todos/todo_util";

class StepForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      id: uniqueId(),
      title: "",
      body: "",
      done: false,
      todo_id: this.props.todo_id
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    const {className, value} = event.target;
    this.setState(prevState => {
      return {
        ...prevState,
        title: className === "step-form-title" ? value : prevState.title,
        body: className === "step-form-body" ? value : prevState.body,
      }
    })
  }

  handleSubmit(event) {
    event.preventDefault();

    let newStep = {
      ...this.state,
      id: uniqueId()
    }

    this.props.receiveStep(newStep);
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
      <section className="step-form">
        <label>Title</label>
        <input 
          className="step-form-title" 
          type="text" 
          onChange={this.handleChange}
          value={this.state.title}
          placeholder="turn left"
        />

        <label>Body</label>
        <textarea 
          className="step-form-body" 
          onChange={this.handleChange}
          placeholder="lots of miles left"
          value={this.state.body}
        />    

        <button onClick={this.handleSubmit}>Add Step</button>
      </section>
    )
  }
}

export default StepForm;