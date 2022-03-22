import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      username: "",
      email: "",
      password: ""
    }

    this.handleSubmit = this.handleSubmit.bind(this)
    this.update = this.update.bind(this)
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state)
    this.props.processForm({user: user})
      .then(() => this.props.history.push('/'))

    // this.setState({
    //   username: "",
    //   email: "",
    //   password: ""
    // })
  }

  update(property) {
    return (e) => {
      this.setState({
        [property]: e.target.value 
      })
    }
  }

  render() {
    const {errors, formType} = this.props

    const showErrors = () => {
      if (errors.length !== 0) {
        return (
          <ul className="errors">
            { errors.map((err, idx) => <li key={idx}>{err}</li>) }
          </ul>
        )
      }
    }
    
    return (
      <div className="session-form">
        <h2>{formType}</h2>   
        {showErrors()}  
        <form>
          <label>Username:
            <input 
              type="text" 
              value={this.state.username}
              onChange={this.update("username")}
            />
          </label>

          { formType === "Sign up!" &&
            <label>Email:
            <input 
              type="text" 
              value={this.state.email}
              onChange={this.update("email")}
            />
          </label>
          }

          <label>Password:
            <input 
              type="password" 
              value={this.state.password}
              onChange={this.update("password")}
            />
          </label>

          <button onClick={this.handleSubmit}>{formType}</button>
        </form>

        {
          formType === "Sign up!" ? 
          <Link to="/login">Log in</Link> :
          <Link to="/signup">Sign up</Link> 
        }
      </div>
    )
  }
}

export default SessionForm