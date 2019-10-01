$(function(){
  function buildHTML(message){
    var htmlImage = message.image.url? `<img src = "${message.image.url}">` : "" ;

    var html =`<div class = main__contents__letter> 
                <p class = main__contents__letter__name>${message.user_name}</p>
                <p class = main__contents__letter__date>${message.created_at}</p>
                <p class = main__contents__letter__message>${message.body}</p>
                ${htmlImage}
              </div>`;
    return html;
  }
  
  $('#message-form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url= $(this).attr('action')
    $.ajax({
      type: 'POST',
      url: url,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.main__contents').append(html);
      $('#message-form')[0].reset();
      $('.main__contents').animate({ scrollTop: $('.main__contents')[0].scrollHeight});
      $('.main__foot__button').attr('disabled', false);
      $('.main__foot__button').attr('value', 'Send');
    })
    .fail(function(){
      alert('error');
    })
  })
})