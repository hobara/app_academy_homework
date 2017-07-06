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
