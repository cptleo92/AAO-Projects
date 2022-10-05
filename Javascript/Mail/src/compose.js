const MessageStore = require("./message_store.js");

const Compose = {
  render: function () {
    const div = document.createElement("div");
    div.className = "new-message";
    div.innerHTML = this.renderForm();

    div.addEventListener("change", (e) => {
      const name = e.target.name;
      const value = e.target.value;
      MessageStore.updateDraftField(name, value);      
    });

    div.addEventListener("submit", (e) => {
      e.preventDefault();
      const msg = MessageStore.getMessageDraft();
      MessageStore.sendDraft(msg);
      window.location.hash = "inbox";
    });

    return div;
  },

  renderForm: function () {
    const currentDraft = MessageStore.getMessageDraft();
    
    const p = '<p class="new-message-header">New Message</p>';

    const form = 
      `<form class="compose-form">
        <input placeholder="Recipient" name="to" type="text" value=${currentDraft.to}>
        <input placeholder="Subject" name="subject" type="text" value="${currentDraft.subject}">    
        <textarea name="body" rows=20>${currentDraft.body}</textarea>
        <button type="submit" class="btn btn-primary submit-message">Send</button>
      </form>`
      
    return p + form;
  }
}

module.exports = Compose;