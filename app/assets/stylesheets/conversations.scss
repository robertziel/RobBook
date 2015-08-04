$(document).ready ->
  get_request = (message_conent)->
    last_id = $('.message').last().attr('data-id')
    $.ajax
      type: 'GET'
      url: $(this).attr('href')
      data: last_id: last_id,  message_content: message_conent
      dataType: 'script'
    return

  chat_loop = ->
    get_request()
    setTimeout chat_loop, 5000
    return

  $('.send').click ->
    message_conent = document.getElementById('message_body').value
    document.getElementById('message_body').value = ""
    get_request(message_conent)
    return


  $('.chatboxcontent').animate { scrollTop: $('.chatboxcontent').position.top+$('.chatboxcontent').height() }, 'fast'
  chat_loop()

  return
