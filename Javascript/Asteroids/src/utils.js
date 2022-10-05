const Util = {
  inherits(childClass, parentClass) {
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
  },

  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },

  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  },

  distance(pos1, pos2) {
    let [x1, y1] = pos1;
    let [x2, y2] = pos2;

    return Math.sqrt(
      ((x1 - x2) ** 2) + ((y1 - y2) ** 2)
    )
  }
};

module.exports = Util;