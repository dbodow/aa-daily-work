const APIUtil = require('./api_util');

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
