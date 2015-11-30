$(document).ready ->
  $('a.load-more').click (e) ->
    e.preventDefault()
    $('.load-more').hide()
    $('.loading-gif').show()
    last_id = $('.post-record').last().attr('data-id')
    $.ajax
      type: 'GET'
      url: $(this).attr('href')
      data: id: last_id
      dataType: 'script'
      success: ->
        $('.loading-gif').hide()
        $('.load-more').show()
        return
    return
  return
