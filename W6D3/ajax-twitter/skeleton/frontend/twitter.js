const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');

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
