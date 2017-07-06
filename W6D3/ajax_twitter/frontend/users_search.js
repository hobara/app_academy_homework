const APIUtil = require('./api_util.js');

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
