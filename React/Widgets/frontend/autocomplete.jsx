import React from 'react';

export default class Autocomplete extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      inputVal: ""
    }
  }

  search(e) {
    const searchStr = e.target.value;
    this.setState({ inputVal: searchStr })
  }

  filter(sub) {
    return this.props.names.filter( name => name.includes(sub));
  }

  clickName(e) {
    this.setState({ inputVal: e.target.innerText })
  }

  render() {
    const filteredList = this.filter(this.state.inputVal)
    return (
      <div>
        <h1>YOU AUTOCOMPLETE ME</h1>  
        <div className="auto">
          <input className="auto-input" 
            placeholder="Search..." 
            onChange={this.search.bind(this)} 
            value={this.state.inputVal}>
          </input>
          <ul className="autoList">
            {
              filteredList.map( (name, idx) => <li key={idx} onClick={this.clickName.bind(this)}>{name}</li>)
            }  
          </ul>    
        </div>
      </div>
    )
  }
}