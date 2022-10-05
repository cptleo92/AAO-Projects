/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/***/ ((module) => {

const APIUtil = {
  followUser: id => {
    return $.ajax({     
      url: '/users/' + id + '/follow',
      dataType: 'json',
      method: 'POST'
    })    
  },

  unfollowUser: id => {    
    return $.ajax({
      url: '/users/' + id + '/follow',
      dataType: 'json',
      method: 'DELETE'
    })    
  },

  // followUser: id => APIUtil.changeFollowStatus(id, 'POST'),

  // unfollowUser: id => APIUtil.changeFollowStatus(id, 'DELETE'),

  // changeFollowStatus: (id, method) => (
  //   $.ajax({
  //     url: `/users/${id}/follow`,
  //     dataType: 'json',
  //     method
  //   })
  // )

  searchUsers: queryVal => {
    return $.ajax({
      url: '/users/search',
      data: { query: queryVal },
      dataType: 'json',
      method: 'GET'
    })
  },

  createTweet: data => {    
    $(':input').prop("disabled", true);    
    return $.ajax({
      url: '/tweets',
      data: data,
      dataType: 'json',
      method: 'POST'
    })
  }
}

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js")

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

/***/ }),

/***/ "./frontend/tweet_compose.js":
/*!***********************************!*\
  !*** ./frontend/tweet_compose.js ***!
  \***********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");

class TweetCompose {
  constructor (el) {
    this.el = el;    

    this.submit();
    this.el.find('textarea').on('input', event => {
      this.updateChars(event);
    });    
  }

  submit () {
    this.el.on('submit', event => {     
      event.preventDefault();
      const tComp = this;
      APIUtil.createTweet($(event.currentTarget).serializeJSON()).then( (data) => {                
        tComp.handleSuccess(data);
      });
    })
  }

  handleSuccess (data) {
    $('textarea').val("");      
    $('select').val("");      
    let newTweet = $('<li>').text(JSON.stringify(data));
    // console.log(newTweet);
    $('ul#feed').prepend(newTweet);
    $(':input').prop("disabled", false);
  }

  updateChars (event) {
    let counter = $('.chars-left');
    let charsSoFar = event.currentTarget.value.length;
    counter.text(140 - parseInt(charsSoFar));
  }
}

module.exports = TweetCompose;

/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

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

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");
const UsersSearch = __webpack_require__(/*! ./users_search.js */ "./frontend/users_search.js")
const TweetCompose = __webpack_require__(/*! ./tweet_compose.js */ "./frontend/tweet_compose.js")

$( () => {
  $('.follow-toggle').each(function() {
    new FollowToggle($(this));
  })

  $('nav.users-search').each(function() {
    new UsersSearch($(this));
  })

  $('.tweet-compose').each(function() {
    new TweetCompose($(this));
  })
})
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map