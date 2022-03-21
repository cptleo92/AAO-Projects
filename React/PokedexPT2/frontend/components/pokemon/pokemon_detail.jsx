import React from 'react';
import Item from "../item/item"
import { Route } from 'react-router-dom';
import ItemDetailContainer from '../item/item_detail_container';
import LoadingIcon from './loading_icon';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props)    
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);    
  }

  componentDidUpdate(prevProps) {
    let prevId = prevProps.match.params.pokemonId;

    if (prevId !== this.props.match.params.pokemonId) {
      this.props.requestSinglePokemon(this.props.match.params.pokemonId);    
    }
  }

  render() {        
    const currentPokemon = this.props.pokemon[this.props.match.params.pokemonId - 1]
    return (
      <div className="poke-detail">                
        <ul>
          <li>Type: {currentPokemon.pokeType}</li>
          <li>Attack: {currentPokemon.attack}</li>
          <li>Defense: {currentPokemon.defense}</li>
        </ul>
        <ul className="poke-detail-moves">
          {
            this.props.moves.map(move => <li key={move.id}>{move.name}</li>)
          }
        </ul>
        <ul>
          {
            this.props.items.map(item => (
              <li key={item.id}>
                <Item item={item} />
              </li>
            ))
          }
        </ul>
        <Route path="/pokemon/:pokemonId/items/:itemId" component={ItemDetailContainer} />
      </div>
    )
  }
}

export default PokemonDetail