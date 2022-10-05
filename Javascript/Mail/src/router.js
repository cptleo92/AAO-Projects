class Router {
  constructor (node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start () {
    this.render();

    window.addEventListener('hashchange', () => {
      this.render();
    })    
  }

  render () {
    this.node.innerHTML = "";        
    const component = this.activeRoute();

    if (component !== undefined) {
      this.node.appendChild(component.render());
    }  
    
  }

  activeRoute () {
    const route = window.location.hash.substring(1);
    return this.routes[route];
  }
}

module.exports = Router;