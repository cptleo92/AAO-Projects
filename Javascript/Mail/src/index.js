const Router = require("./router.js");
const Inbox = require("./inbox.js");
const Sent = require("./sent.js");
const Compose = require("./compose.js");

document.addEventListener("DOMContentLoaded", () => {
  const sidebarLi = document.querySelectorAll(".sidebar-nav li");
  
  sidebarLi.forEach(li => {
      li.addEventListener("click", (e) => {
      const loc = e.target.innerText.toLowerCase();
      window.location.hash = loc;
    })
  })

  const content = document.querySelector(".content");
  const router = new Router(content, routes);
  router.start();

  window.location.hash = "inbox";
})

const routes = {
  inbox: Inbox,
  sent: Sent,
  compose: Compose
}