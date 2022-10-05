import React from 'react';

export default class Tile extends React.Component {
  constructor() {
    super();
  }

  handleClick(e) {
    this.props.updateGame(this.props.tile, e.shiftKey);
  }

  render() {
    const tile = this.props.tile;
    let klass = "tile"
    let tileStr = "";
    if (tile.explored) {
      klass += " explored"
      if (tile.bombed) {
        tileStr = "B";       
      } else {
        let bombs = tile.adjacentBombCount();
        tileStr = bombs >= 1 ? bombs : "";
      }
    }
    else if (tile.flagged) {
      tileStr = "F"
    }  

    return (
      <div className={klass} onClick={this.handleClick.bind(this)}>
        {tileStr}
      </div>
    )
  }
}