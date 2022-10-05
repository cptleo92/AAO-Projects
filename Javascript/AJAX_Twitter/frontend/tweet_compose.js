const APIUtil = require("./api_util.js");

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