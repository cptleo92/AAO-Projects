class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $('ul').on('click', 'li', event => {
      this.makeMove($(event.currentTarget));
      this.updateTracker();
    })
  }

  makeMove($square) {
    let pos = $square.attr("pos");
    pos = pos.split(",").map(Number);

    const mark = this.game.currentPlayer;    

    if (!$square.is('.clicked')) {
      this.game.playMove(pos);
      $square.addClass('clicked');
      $square.text(mark);   
    } else {
      alert('Is not an empty position!');
    }
    
    if (this.game.isOver()) {      
      if (this.game.winner()) {
        alert(`${this.game.winner()} has won!`);
      } else {
        alert('NO ONE WINS!');
      }
    }    
  }

  updateTracker() {
    let str = 'The current player is: ' + this.game.currentPlayer;
    $('.tracker').text(str);
  }

  setupBoard() {
    const $grid = $('<ul></ul>');
    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        $('<li></li>').attr("pos", [row, col]).appendTo($grid);
      }
    }
    this.$el.html($grid);    
    this.$el.after('<h1 class="tracker"></h1>');
  }
}

module.exports = View;
