import React from "react";
import ErrorList from "../error_list"
import uniqueId from "./todo_util";
import TagList from "./tag_list"

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      title: "",
      body: "",
      done: false,
      tag_names: [],
      tag_field: ""
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.addTag = this.addTag.bind(this);
    this.removeTag = this.removeTag.bind(this);
  }

  handleChange(event) {
    const {className, value} = event.target;
    this.setState(prevState => {
      return {
        ...prevState,
        title: className === "form-title" ? value : prevState.title,
        body: className === "form-body" ? value : prevState.body,
        tag_field: className === "form-tags" ? value : prevState.tag_field
      }
    })
  }

  handleSubmit(event) {
    event.preventDefault();

    let todo = Object.assign({}, this.state)

    this.props.createTodo({todo}).then(
      () => {
        this.setState({title: "", body: "", tag_names: []})
        this.props.clearErrors()
      }
    )
  }

  removeTag(idx) {    
    this.setState({
      tag_names: this.state.tag_names.filter((el, index) => index !== idx)
    })
  }

  addTag() {
    if (this.state.tag_field !== "") {
      this.setState(prevState => {
        return {
          ...prevState,
          tag_names: [...prevState.tag_names, prevState.tag_field],
          tag_field: ""
        }
      })
    }
  }

  render() {    
    const hasErrors = this.props.errors.length !== 0;

    return (
      <form className="form" onSubmit={this.handleSubmit}>
        {hasErrors && <ErrorList errors={this.props.errors} />}
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

        <label>Tags</label>
        <TagList tags={this.state.tag_names} removeTag={this.removeTag}/>      
        <div className="tag-input">
          <input
            className="form-tags"
            type="text"
            placeholder="Enter tags here..."
            value={this.state.tag_field}
            onChange={this.handleChange}
          />
          <button 
            type="button" 
            className="tag-button"            
            onClick={this.addTag}>
              Add tag
          </button>
        </div>
        <button>Add Todo</button>
      </form>
    )
  }
}

export default TodoForm;