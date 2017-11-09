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
const UsersSearch = __webpack_require__(2);

$(() => {
  const $followButtons = $(".follow-toggle");
  $followButtons.each((idx, el) => {
    const toggler = new FollowToggle($(el));
    toggler.render();
    $followButtons.on("click", $(el), () => {
      toggler.handleClick();
      console.log('the toggle was clicked!');
    });
  });
});

$(() => {
  const $usersSearch = $(".users-search ul");
  $usersSearch.each((idx, el) => {
    const search = new UsersSearch($(el));
    $userSearch.on("input", $(el))
  });
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(3);

class FollowToggle {
  constructor($button) {
    this.$button = $button;
    this.userId = $button.data("user");
    this.followState = $button.data("initial-follow-state");
  }

  renderInterimState() {
    const interimStates = {true: 'Unfollowing...', false: 'Following...'};
    this.$button.text(interimStates[this.followState]);
  }

  render() {
    if(!this.followState) {
      this.$button.text('Follow');
    } else {
      this.$button.text('Unfollow');
    }
  }

  toggleFollowState() {
    this.followState = !this.followState;
  }

  handleClick() {
    // const success = this.followState ? APIUtil.unfollowUser.bind(null, this.userId) : APIUtil.followUser.bind(null, this.userId);
    // let success;
    // if (this.followState) {
    //   success = APIUtil.unfollowUser.bind(null, this.userId);
    // } else {
    //   success = APIUtil.followUser.bind(null, this.userId);
    // }

    this.renderInterimState();
    if (this.followState) {
      APIUtil.unfollowUser(this.userId).then(this.render.bind(this));
    } else {
      APIUtil.followUser(this.userId).then(this.render.bind(this));
    }
    this.toggleFollowState();
    // success().then(this.render.bind(this));
  }
}

module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(3);

class UsersSearch {
  constructor($el) {
    this.$el = $el;
    this.$input = $($el.find('input'));
    this.$ul = $($el.find('ul'));
  }

  handleInput(val) {
    APIUtil.searchUsers(val);
  }
}

module.exports = UsersSearch;


/***/ }),
/* 3 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      method: `POST`,
      dataType: 'JSON'
    });
  },

  unfollowUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      method: `DELETE`,
      dataType: 'JSON'
    });
  },

  searchUsers: (queryVal) => {
    return $.ajax({
      url: '/users/search',
      method: 'GET',
      dataType: 'JSON',
      data: {
        query: queryVal
      }
    });
  }
};

module.exports = APIUtil;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map