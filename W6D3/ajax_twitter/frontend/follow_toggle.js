const APIUtil = require('./api_util.js');

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
