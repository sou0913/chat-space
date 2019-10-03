$(function(){

  var search_result = $('#user-search-result');
  var selectedUser = [];
  $(".selected-user-list").each(function(){
    selectedUser.push($(this).val());    
  });
  console.log(selectedUser)
  function buildHTML(user) {
    var html =  `<div class="chat-group-user clearfix">
                   <p class="chat-group-user__name">${user.name}</p>
                   <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id = "${user.user_id}" data-user-name = "${user.name}">追加</div>
                 </div>`
    search_result.append(html);
  }
  function buildErrHTML(msg) {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${msg}</p>
                </div>`
    search_result.append(html);
  }
  $('.group-form').on('keyup',function(e){
    var input = $('#user-search-field').val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: {keyword: input, selected: selectedUser },
      dataType: 'json'

    })
    .done(function(users) {
      $("#user-search-result").empty();
      if (users.length !== 0) {
        users.forEach(function(user){
          buildHTML(user);
        });
      }
      else {
          buildErrHTML("一致するユーザーはいません");
      }
    })
    .fail(function() {
      alert('ユーザー検索に失敗しました');
    })
  })
  function buildUserHTML(user_id, user_name) {
    var html = `<div class='chat-group-user'>
                  <input name='group[user_ids][]' type='hidden' value="${user_id}">
                  <p class='chat-group-user__name'>${user_name}</p>
                  <div class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</div>
                </div>`
    return html;
  }

  $('.user-search-result').on('click', '.user-search-add', function(e){
    var user_id    = $(this).data('user-id');
    var user_name  = $(this).data('user-name');
    html = buildUserHTML(user_id, user_name);
    $(this).parent().remove();
    $('#chat-group-form__field--right').append(html);
    selectedUser.push(user_id);
    })
  $('#chat-group-form__field--right').on('click', '.user-search-remove', function(e){
    var user_id = $(this).data("user-id");
    $(this). parent().remove(); 
    selectedUser = selectedUser.filter(function(id){
      return id !== user_id;
    })
  })
})