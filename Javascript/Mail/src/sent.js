const MessageStore = require("./message_store.js");

const Sent = {
  render: function () {
    const ul = document.createElement("ul");
    ul.className = "messages";

    const messages = MessageStore.getSentMessages();
    messages.forEach(msg => {
      ul.appendChild(this.renderMessage(msg));
    })

    return ul;
  },

  renderMessage: function (msg) {
    const li = document.createElement("li");
    li.className = "message";
    li.innerHTML = 
      `<span class="to">${msg.to}</span>
      <span class="subject">${msg.subject}</span>
      <span class="body">${msg.body}</span>
      `
    return li;
  }
};

module.exports = Sent;