// class Game {
//   run() {
//     // until the pieces are in the right position
//     // prompt for begin rod
//     // prompt for end rod
//     // repeat
//   }
// }

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});


class Game {
  constructor (numRods, numPieces) {
    this.rods = Array.from(Array(numRods), () =>  []);
    for (let i = numPieces; i > 0; i--) {
      this.rods[0].push(i);
    }
  }

  run (completionCallback) {
    this.promptMove();   
  }

  completionCallback () {
    this.print();
    console.log('You win!')
    reader.close();
  }

  promptMove () {
    this.print();
    reader.question('Enter starting rod number: ', (res) => {
      let startTowerIdx = parseInt(res) - 1;
      reader.question('Enter ending rod number: ', (res2) => {
        let endTowerIdx = parseInt(res2) - 1;        
        this.move(startTowerIdx, endTowerIdx);

        if (!this.isWon()) {
          this.run();
        } else {
          this.completionCallback();
        }
      })
    })
  }

  print () {    
    for(let idx in this.rods) {
      console.log(`Rod ${parseInt(idx) + 1}: ${this.rods[idx]}`)
    }
  }

  move (startTowerIdx, endTowerIdx) {
    if (this.isValidMove(startTowerIdx, endTowerIdx)) {
      const startTower = this.rods[startTowerIdx];
      const endTower = this.rods[endTowerIdx];

      endTower.push(startTower.pop());   
    } else {
      this.invalidMove();
    }
  }

  isValidMove (startTowerIdx, endTowerIdx) {
    let max = this.rods.length - 1;
    if (startTowerIdx > max || startTowerIdx < 0 || endTowerIdx > max || endTowerIdx < 0) {     
      return false;
    }

    if (startTowerIdx === endTowerIdx) {
      return false;
    }
    
    const startTower = this.rods[startTowerIdx];

    if (startTower.length === 0) {
      return false;
    }

    const endTower = this.rods[endTowerIdx];

    if (endTower.length === 0) {
      return true;
    } else {
      const startPiece = startTower.slice(-1);
      const endPiece = endTower.slice(-1); 

      return startPiece <= endPiece;
    }
  }

  invalidMove () {
    console.log('Invalid move!');
    this.promptMove();
  }

  isWon () {
    for(let i = 0; i < this.rods.length - 1; i++) {
      if (this.rods[i].length !== 0) {
        return false;
      } 
    }
    return true;
  }
}

const g = new Game(3, 5);
// g.rods = [[],[2],[1],[5,4,3]];
g.run();
