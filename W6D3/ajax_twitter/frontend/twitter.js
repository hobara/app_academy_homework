const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');

$( () => {
  $(".follow-toggle").each((index, el) => {
    console.log(el);
    new FollowToggle(el);
  });

  let users = $(".users-search");
  new UsersSearch(users);
});
