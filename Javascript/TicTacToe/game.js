const Board = require('./board.js');
const Player = require('./player.js')

class Game {
  constructor () {
    this.board = new Board();
    this.player1 = new Player('human', 'X');
    this.player2 = new Player('human', 'O');
    this.currentPlayer = this.player1;
  }

  run (reader, gameCompletionCallback) {
    this.promptMove(reader, gameCompletionCallback);
  }

  promptMove (reader, gameCompletionCallback) {
    this.board.print();
    let currentMark = this.currentPlayer.mark;
    reader.question(`${currentMark}, it is your turn: `, (pos) => {
      let parsedPos = pos.split(pos[1]).map(Number);
      this.board.place_mark(parsedPos, currentMark);

      if (this.board.winner()) {
        this.board.won();
        gameCompletionCallback();
      } else {
        this.switchPlayer();
        this.promptMove(reader, gameCompletionCallback);
      }
    })    
  }

  switchPlayer () {
    this.currentPlayer = (this.currentPlayer === this.player1 ? this.player2 : this.player1);
  }
}

module.exports = Game;