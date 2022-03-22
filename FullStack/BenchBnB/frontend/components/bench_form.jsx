import React from 'react';

class BenchForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      description: "",
      seating: 0,
    }

    this.update = this.update.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(property) {
    return (e) => {
      this.setState({
        [property]: e.target.value
      })
    }
  }

  handleSubmit(e) {
    e.preventDefault();

    const newBench = {
      ...this.state,
      lat: this.props.lat,
      lng: this.props.lng
    }
    this.props.createBench(newBench)
      .then(() => this.props.history.push("/"), err => console.log(err.responseJSON))      
    
  }

  render() {
    return (
      <form>
          <label>Description: 
            <input
              type="text"
              value={this.state.description}
              onChange={this.update("description")}
            />            
          </label>

          <label>Number of Seats: 
            <input
              type="number"
              min="1"
              max="20"
              value={this.state.seating}
              onChange={this.update("seating")}
            />            
          </label>

          <label>Latitude: 
            <input
              type="number"
              value={this.props.lat}
              onChange={this.update("lat")}
              disabled
            />            
          </label>

          <label>Description: 
            <input
              type="number"
              value={this.props.lng}
              onChange={this.update("lng")}
              disabled
            />            
          </label>          

          <button onClick={this.handleSubmit}>Add Bench</button>
      </form>
    )
  }
}

export default BenchForm;