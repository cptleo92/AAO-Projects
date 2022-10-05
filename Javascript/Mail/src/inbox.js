const MessageStore = require("./message_store.js");

const Inbox = {
  render: function () {
    const ul = document.createElement("ul");
    ul.className = "messages";

    const messages = MessageStore.getInboxMessages();
    messages.forEach(msg => {
      ul.appendChild(this.renderMessage(msg));
    })

    return ul;
  },

  renderMessage: function (msg) {
    const li = document.createElement("li");
    li.className = "message";
    li.innerHTML = 
      `<span class="from">${msg.from}</span>
      <span class="subject">${msg.subject}</span>
      <span class="body">${msg.body}</span>
      `
    return li;
  }
};

module.exports = Inbox;