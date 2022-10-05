import React from 'react';

class FilterForm extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      minSeating: 1,
      maxSeating: 20
    }
  }

  update(property) {
    return (e) => {            
      this.setState( prevState => {
        const newState = {
          ...prevState,
          [property]: e.target.value
        }

        this.props.updateFilter([property], e.target.value)

        return newState;
      })
    }
  }

  render() {
    return (
      <div className="filter-form">
        <form>
          <label>Minimum Seats: 
            <input 
              type="number"
              value={this.state.minSeating}
              onChange={this.update("minSeating").bind(this)}
              min="1"
              max="20"
            />
          </label>

          <label>Maximum Seats: 
            <input 
              type="number"
              value={this.state.maxSeating}
              onChange={this.update("maxSeating").bind(this)}
              min="1"
              max="20"
            />
          </label>
        </form>
      </div>
    )
  }

}

export default FilterForm;