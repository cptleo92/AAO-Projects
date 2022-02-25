const APIUtil = {
  followUser: id => {
    return $.ajax({     
      url: '/users/' + id + '/follow',
      dataType: 'json',
      method: 'POST'
    })    
  },

  unfollowUser: id => {    
    return $.ajax({
      url: '/users/' + id + '/follow',
      dataType: 'json',
      method: 'DELETE'
    })    
  },

  // followUser: id => APIUtil.changeFollowStatus(id, 'POST'),

  // unfollowUser: id => APIUtil.changeFollowStatus(id, 'DELETE'),

  // changeFollowStatus: (id, method) => (
  //   $.ajax({
  //     url: `/users/${id}/follow`,
  //     dataType: 'json',
  //     method
  //   })
  // )

  searchUsers: queryVal => {
    return $.ajax({
      url: '/users/search',
      data: { query: queryVal },
      dataType: 'json',
      method: 'GET'
    })
  },

  createTweet: data => {    
    $(':input').prop("disabled", true);    
    return $.ajax({
      url: '/tweets',
      data: data,
      dataType: 'json',
      method: 'POST'
    })
  }
}

module.exports = APIUtil;