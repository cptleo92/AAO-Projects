/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/compose.js":
/*!************************!*\
  !*** ./src/compose.js ***!
  \************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MessageStore = __webpack_require__(/*! ./message_store.js */ \"./src/message_store.js\");\n\nconst Compose = {\n  render: function () {\n    const div = document.createElement(\"div\");\n    div.className = \"new-message\";\n    div.innerHTML = this.renderForm();\n\n    div.addEventListener(\"change\", (e) => {\n      const name = e.target.name;\n      const value = e.target.value;\n      MessageStore.updateDraftField(name, value);      \n    });\n\n    div.addEventListener(\"submit\", (e) => {\n      e.preventDefault();\n      const msg = MessageStore.getMessageDraft();\n      MessageStore.sendDraft(msg);\n      window.location.hash = \"inbox\";\n    });\n\n    return div;\n  },\n\n  renderForm: function () {\n    const currentDraft = MessageStore.getMessageDraft();\n    \n    const p = '<p class=\"new-message-header\">New Message</p>';\n\n    const form = \n      `<form class=\"compose-form\">\n        <input placeholder=\"Recipient\" name=\"to\" type=\"text\" value=${currentDraft.to}>\n        <input placeholder=\"Subject\" name=\"subject\" type=\"text\" value=\"${currentDraft.subject}\">    \n        <textarea name=\"body\" rows=20>${currentDraft.body}</textarea>\n        <button type=\"submit\" class=\"btn btn-primary submit-message\">Send</button>\n      </form>`\n      \n    return p + form;\n  }\n}\n\nmodule.exports = Compose;\n\n//# sourceURL=webpack://Mail/./src/compose.js?");

/***/ }),

/***/ "./src/inbox.js":
/*!**********************!*\
  !*** ./src/inbox.js ***!
  \**********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MessageStore = __webpack_require__(/*! ./message_store.js */ \"./src/message_store.js\");\n\nconst Inbox = {\n  render: function () {\n    const ul = document.createElement(\"ul\");\n    ul.className = \"messages\";\n\n    const messages = MessageStore.getInboxMessages();\n    messages.forEach(msg => {\n      ul.appendChild(this.renderMessage(msg));\n    })\n\n    return ul;\n  },\n\n  renderMessage: function (msg) {\n    const li = document.createElement(\"li\");\n    li.className = \"message\";\n    li.innerHTML = \n      `<span class=\"from\">${msg.from}</span>\n      <span class=\"subject\">${msg.subject}</span>\n      <span class=\"body\">${msg.body}</span>\n      `\n    return li;\n  }\n};\n\nmodule.exports = Inbox;\n\n//# sourceURL=webpack://Mail/./src/inbox.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const Router = __webpack_require__(/*! ./router.js */ \"./src/router.js\");\nconst Inbox = __webpack_require__(/*! ./inbox.js */ \"./src/inbox.js\");\nconst Sent = __webpack_require__(/*! ./sent.js */ \"./src/sent.js\");\nconst Compose = __webpack_require__(/*! ./compose.js */ \"./src/compose.js\");\n\ndocument.addEventListener(\"DOMContentLoaded\", () => {\n  const sidebarLi = document.querySelectorAll(\".sidebar-nav li\");\n  \n  sidebarLi.forEach(li => {\n      li.addEventListener(\"click\", (e) => {\n      const loc = e.target.innerText.toLowerCase();\n      window.location.hash = loc;\n    })\n  })\n\n  const content = document.querySelector(\".content\");\n  const router = new Router(content, routes);\n  router.start();\n\n  window.location.hash = \"inbox\";\n})\n\nconst routes = {\n  inbox: Inbox,\n  sent: Sent,\n  compose: Compose\n}\n\n//# sourceURL=webpack://Mail/./src/index.js?");

/***/ }),

/***/ "./src/message_store.js":
/*!******************************!*\
  !*** ./src/message_store.js ***!
  \******************************/
/***/ ((module) => {

eval("let messages = {\n  sent: [\n    {\n      to: \"friend@mail.com\",\n      subject: \"Check this out\",\n      body: \"It's so cool\"\n    },\n    { to: \"person@mail.com\", subject: \"zzz\", body: \"so booooring\" }\n  ],  \n  inbox: [\n    {\n      from: \"grandma@mail.com\",\n      subject: \"Fwd: Fwd: Fwd: Check this out\",\n      body:\n        \"Stay at home mom discovers cure for leg cramps. Doctors hate her\"\n    },\n    {\n      from: \"person@mail.com\",\n      subject: \"Questionnaire\",\n      body: \"Take this free quiz win $1000 dollars\"\n    }\n  ]\n};\n\nfunction Message (from = \"\", to = \"\", subject = \"\", body = \"\") {\n  this.from = from;\n  this.to = to;\n  this.subject = subject;\n  this.body = body;\n}\n\nlet messageDraft = new Message();\n\nconst MessageStore = {\n  getInboxMessages: function () {\n    return messages.inbox;  \n  },\n\n  getSentMessages: function () {\n    return messages.sent;\n  },\n\n  updateDraftField: function (field, value) {\n    messageDraft[field] = value;\n  },\n\n  sendDraft: function () {\n    messages.sent.push(messageDraft);\n    messageDraft = new Message();\n  },\n\n  getMessageDraft: function () {\n    return messageDraft;\n  }\n}\n\n\n\nmodule.exports = MessageStore\n\n//# sourceURL=webpack://Mail/./src/message_store.js?");

/***/ }),

/***/ "./src/router.js":
/*!***********************!*\
  !*** ./src/router.js ***!
  \***********************/
/***/ ((module) => {

eval("class Router {\n  constructor (node, routes) {\n    this.node = node;\n    this.routes = routes;\n  }\n\n  start () {\n    this.render();\n\n    window.addEventListener('hashchange', () => {\n      this.render();\n    })    \n  }\n\n  render () {\n    this.node.innerHTML = \"\";        \n    const component = this.activeRoute();\n\n    if (component !== undefined) {\n      this.node.appendChild(component.render());\n    }  \n    \n  }\n\n  activeRoute () {\n    const route = window.location.hash.substring(1);\n    return this.routes[route];\n  }\n}\n\nmodule.exports = Router;\n\n//# sourceURL=webpack://Mail/./src/router.js?");

/***/ }),

/***/ "./src/sent.js":
/*!*********************!*\
  !*** ./src/sent.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MessageStore = __webpack_require__(/*! ./message_store.js */ \"./src/message_store.js\");\n\nconst Sent = {\n  render: function () {\n    const ul = document.createElement(\"ul\");\n    ul.className = \"messages\";\n\n    const messages = MessageStore.getSentMessages();\n    messages.forEach(msg => {\n      ul.appendChild(this.renderMessage(msg));\n    })\n\n    return ul;\n  },\n\n  renderMessage: function (msg) {\n    const li = document.createElement(\"li\");\n    li.className = \"message\";\n    li.innerHTML = \n      `<span class=\"to\">${msg.to}</span>\n      <span class=\"subject\">${msg.subject}</span>\n      <span class=\"body\">${msg.body}</span>\n      `\n    return li;\n  }\n};\n\nmodule.exports = Sent;\n\n//# sourceURL=webpack://Mail/./src/sent.js?");

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
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;