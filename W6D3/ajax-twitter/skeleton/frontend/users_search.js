const APIUtil = require('./api_util');

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
