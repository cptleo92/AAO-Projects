import React from 'react';
import Tile from './tile';

export default class Board extends React.Component {
  constructor(props) {
    super(props);

  }

  render() {
    console.log(this.props);
    return (
      <div className="board">
        {
          this.props.board.grid.map( (row, idx1) => 
            <div className="row" key={idx1}> {
              row.map( (tile, idx2) => 
                <Tile tile={tile} updateGame={this.props.updateGame} key={idx2} />
              )
            }
            </div>                
          )
        }
      </div>
    )
  }
}