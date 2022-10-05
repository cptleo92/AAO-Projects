import React from "react";
import { Link } from "react-router-dom";

class Item extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    const { item } = this.props;
    return (     
      <Link to={`/pokemon/${item.pokemonId}/items/${item.id}`}>
        <img src={item.imageUrl}>          
        </img>    
      </Link>
    )
  }
}

export default Item