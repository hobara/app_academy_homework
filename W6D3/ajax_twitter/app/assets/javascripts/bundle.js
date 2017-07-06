/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(3);

$( () => {
  $(".follow-toggle").each((index, el) => {
    console.log(el);
    new FollowToggle(el);
  });

  let users = $(".users-search");
  new UsersSearch(users);
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userid = this.$el.data("user-id");
    this.followstate = this.$el.data("initial-follow-state");
    this.render();
    this.handleClick();
  }

  render() {
    if (this.followstate === "follow") {
      this.$el.text("Unfollow!");
    } else {
      this.$el.text("Follow!");
    }
    $(this.$el).prop("disabled", false);
  }

  handleClick() {
    this.$el.on("click", e => {

      $(this.$el).prop("disabled", true);
      e.preventDefault();
      if (this.followstate === "follow") {
        APIUtil.unfollowUser(this.userid)
          .then(() => {
            this.followstate = "unfollow";
            this.render();
          });
      } else {
        APIUtil.followUser(this.userid)
          .then(() => {
            this.followstate = "follow";
            this.render();
          });
      }
    });

  }
}

module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => (
      $.ajax( {
      method: 'POST',
      url: `/users/${id}/follow`,
      dataType: 'JSON',
    })
  ),

  unfollowUser: id => (
    $.ajax( {
      method: 'DELETE',
      url: `/users/${id}/follow`,
      dataType: 'JSON',
    })
  ),

  searchUsers: (queryVal) => (
    $.ajax( {
      method: "GET",
      url: "/users/search",
      dataType: 'JSON',
      data: {query: queryVal}
    })
  ),
};

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

class UsersSearch {
  constructor(user) {
    this.$user = $(user);
    this.$ul = this.$user.find(".users");
    this.$input = this.$user.find("input");
    this.$input.on("input", this.handleInput.bind(this));
  }

  renderResults(users) {
    console.log(users);
    this.$ul.find("li").remove();
    for (let i = 0; i < users.length; i++) {
      this.$ul.append($(`<li>${users[i].username}</li>`));
    }
  }

  handleInput() {
    APIUtil.searchUsers(this.$input.val())
      .then((users) => (
        this.renderResults(users)
        )
      );
  }
}

module.exports = UsersSearch;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map