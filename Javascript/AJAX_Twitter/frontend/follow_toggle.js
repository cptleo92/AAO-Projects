const APIUtil = require('./api_util.js')

class FollowToggle {

  constructor ($follow, options) {
    this.el = $follow;
    this.userId = this.el.attr('data-id') || options.userId;
    this.followState = this.el.attr('data-follow-state') || options.followState;
    
    this.render();
    this.handleClick();
  }

  render () {
    if (this.followState === "followed") {
      this.el.text("Unfollow!");
      this.el.prop("disabled", false)  
    } else if (this.followState === "following") {
      this.el.text("Following...")
      this.el.prop("disabled", true)    
    } else if (this.followState === "unfollowing") {
      this.el.text("Unfollowing...")
      this.el.prop("disabled", true)
    } else {
      this.el.text("Follow!");
      this.el.prop("disabled", false)  
    }
  }

  handleClick () {    
    this.el.on("click", event => {
      event.preventDefault();      

      if (this.followState === "followed") {
        this.followState = "unfollowing";
        this.render();   
        APIUtil.unfollowUser(this.userId).then( () => {          
          this.followState = "unfollowed";
          this.render();
        });
      } else if (this.followState === "unfollowed") {   
        this.followState = "following";
        this.render();   
        APIUtil.followUser(this.userId).then( () => {
          this.followState = "followed";
          this.render();
        });
      }                      
    })
  }


}

module.exports = FollowToggle;