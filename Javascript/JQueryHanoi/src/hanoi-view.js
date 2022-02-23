class View {
  constructor (game, rootEl) {
    this.game = game;
    this.rootEl = rootEl;
    this.clicked = null;

    this.setupTowers();
    this.render();
    this.clickTower();
  }

  setupTowers () {
    let $tower;
    for (let i = 0; i < 3; i++) {
      $tower = $('<ul></ul>').attr("tower-idx", i);
      this.rootEl.append($tower);
    }

    // let $piece;
    // for (let i = 1; i < 4; i++) {
    //   $piece = $(`<li class="${i}"></li>`)
    //   let firstTower = $('ul')[0];
    //   $(firstTower).append($piece);
    // }
  }

  render () {
    $('li').remove();
    const towers = this.game.towers;
    towers.forEach( tower => {
      if (tower.length !== 0) {
        tower.forEach( piece => {
          let idx = towers.indexOf(tower);
          let ul = $('ul')[idx];
          $(ul).prepend($(`<li class="${piece}"></li>`))
        })
      }
    })
  }

  clickTower () {
    $('ul').on('click', event => {
      let tower = $(event.currentTarget);

      if (this.clicked === null) {
        tower.addClass('clicked');
        tower.children().first().addClass('clicked');
        this.clicked = tower.attr("tower-idx");
      } else {
        $('ul').removeClass('clicked');
        let moveTo = tower.attr("tower-idx");
        this.game.move(this.clicked, moveTo);
        this.clicked = null;
        this.render();

        if (this.game.isWon()) {
          alert('You win!');
        }
      }
    })
  }
}

module.exports = View;