class Board {
  constructor () {
    this.grid = Board.prototype._makeGrid();
  }

  _makeGrid () {
    return Array.from(Array(3), () => Array(3));
  }

  print () {
    console.log('  0 1 2');
    for(let i = 0; i < 3; i++) {
      let rowStr = `${i} `;
      for (let j = 0; j < 3; j++) {
        let piece = this.grid[i][j];
        if (piece === undefined) {
          rowStr += '_ '
        } else {
          rowStr += `${piece} `;
        }
      }
      console.log(rowStr);
    }
  }

  won () {
    if (this.winner()) {
      this.print();
      console.log(`The winner is ${this.winner()}!`);    
    }     
  }

  winner () {
    if (this._checkHorz()) {
      return this._checkHorz();
    } else if (this._checkVert()) {
      return this._checkVert();
    } else if (this._checkDiag()) {
      return this._checkDiag();
    } else if (this._checkDraw()) {
      return this._checkDraw();
    }
  }
  
  _checkDraw () {
    for (let i = 0; i < 3; i++) {
      if (this.grid[i].includes(undefined)) {
        return false;
      }
    }

    return 'NOBODY!';
  }

  _checkHorz () {
    for (let row = 0; row < 3; row++) {    
      let mark = this.grid[row][0];
      if (mark !== undefined) {
        let mark2 = this.grid[row][1];
        let mark3 = this.grid[row][2];
        if (mark === mark2 && mark2 === mark3) {
          return mark;
        }
      }     
    }    
  }

  _checkVert () {
    for (let col = 0; col < 3; col++) {    
      let mark = this.grid[0][col];
      if (mark !== undefined) {
        let mark2 = this.grid[1][col];
        let mark3 = this.grid[2][col];
        if (mark === mark2 && mark2 === mark3) {
          return mark;
        }
      }     
    }
    // return false;
  }

  _checkDiag () {
    let mark = this.grid[1][1];
    if (mark !== undefined) {
      let mark2 = this.grid[0][0];
      let mark3 = this.grid[2][2];
      if (mark === mark2 && mark2 === mark3) {
        return mark;
      } else {
        mark2 = this.grid[2][0];
        mark3 = this.grid[0][2];
        if (mark === mark2 && mark2 === mark3) {
          return mark;
        }
      }
    }
    // return false;
  }

  empty (pos) {
    return this.grid[pos[0]][pos[1]] === undefined;    
  }

  isValid (pos) {
    let [x,y] = pos;
    return (x >= 0 && x <= 2 && y >= 0 && y <= 2);
  }

  place_mark (pos, mark) {
    if (this.empty(pos) && this.isValid(pos)) {
      this.grid[pos[0]][pos[1]] = mark;
    } else {
      throw new Error('Invalid position!')
    }
  }
}

module.exports = Board;

// let b = new Board();
// b.place_mark ([2,0], 'X');
// b.place_mark ([1,1], 'O');
// b.place_mark ([0,2], 'X');
// b.place_mark ([2,1], 'O');
// b.place_mark ([1,2], 'O');
// b.place_mark ([0,1], 'O');
// b.print();
// console.log(b.won());