const APIUtil = require("./api_util");
const FollowToggle = require("./follow_toggle");

class UsersSearch {
  constructor ($search) {
    this.el = $search;
    this.input = $search.find('input').val();
    this.ul = $search.find('ul');  

    this.handleInput();
  }

  handleInput () {
    this.el.on('input', event => {
      this.input = $(event.target).val();
      APIUtil.searchUsers(this.input).then( (resp) => {
        this.renderResults(resp);
      })
    })
  }

  renderResults (resp) {
    this.ul.find('li').remove();
    resp.forEach( (user) => {
      let $user = $('<li>');
      $user.html(`<a href="/users/${user.id}">${user.username}</a>`);
      let $button = $('<button>');
      new FollowToggle($button, {
        userId: user.id,
        followState: (user.followed ? "followed" : "unfollowed")
      })    
      $user.append($button);
      this.ul.append($user);
    })

  }
}

module.exports = UsersSearch;