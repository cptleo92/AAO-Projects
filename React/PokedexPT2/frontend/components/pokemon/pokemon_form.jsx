import React from 'react';

class PokemonForm extends React.Component{
  constructor(props){
    super(props);

    this.state = {
      name: "",
      attack: 0,
      defense: 0,
      image_url: "",
      poke_type: ""
    }

    this.update = this.update.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(property) {
    return e => this.setState({
      [property]: e.target.value
    })
  }

  handleSubmit(e) {
    e.preventDefault();

    this.props.createPokemon(this.state).then(newPokemon => {
      console.log(this);
      this.props.history.push(`pokemon/${newPokemon.id}`);
    });

    this.setState({
      name: "",
      attack: 0,
      defense: 0,
      image_url: "",
      poke_type: ""
    })
  }

  render() {
    const types = [
      'fire',
      'electric',
      'normal',
      'ghost',
      'psychic',
      'water',
      'bug',
      'dragon',
      'grass',
      'fighting',
      'ice',
      'flying',
      'poison',
      'ground',
      'rock',
      'steel'
    ]

    return (
      <form onSubmit={this.handleSubmit}>
        <ul>
        { 
          this.props.errors.length !== 0 &&
            this.props.errors.map(err => <li>{err}</li>)          
        }
        </ul>
     
        <label>Name</label>
        <input 
          type="text"
          value={this.state.name}
          onChange={this.update("name")}
        />

        <label>Attack</label>
        <input 
          type="text"
          value={this.state.attack}
          onChange={this.update("attack")}
        />

        <label>Defense</label>
        <input 
          type="text"
          value={this.state.defense}
          onChange={this.update("defense")}
        />

        <label>Type</label>
        <select onChange={this.update("poke_type")}>
          <option defaultValue="">--Select Type--</option>
          {
            types.map(type => <option value={type}>{type}</option>)
          }          
        </select>

        <label>Image URL</label>
        <input 
          type="text"
          value={this.state.image_url}
          onChange={this.update("image_url")}
        />

        <button type="submit">Add Pokemon</button>
      </form>
    )
  }
}

export default PokemonForm;