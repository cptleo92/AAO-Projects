import React from "react";
import { Link } from "react-router-dom";

class PokemonIndexItem extends React.Component{ 
  constructor(props) {
    super(props);    
  }

  render() {
    const {id, src, name} = this.props;
    return (
      <Link to={`/pokemon/${id}`}>
        <li className="pokemon-index-item">
            <span>{id}</span>
            <img src={src}/>
            <span>{name}</span>       
        </li>
      </Link>
    )
  }
}

export default PokemonIndexItem