# when the page is ready for manipulation
$(document).ready ->
  # when the load more link is clicked
  $('a.load-more').click (e) ->
    # prevent the default click action
    e.preventDefault()
    # hide load more link
    $('.load-more').hide()
    # show loading gif
    $('.loading-gif').show()
    # get the last id and save it in a variable 'last-id'
    last_id = $('.post-record').last().attr('data-id')
    # make an ajax call passing along our last user id
    $.ajax
      type: 'GET'
      url: $(this).attr('href')
      data: id: last_id
      dataType: 'script'
      success: ->
        # hide the loading gif
        $('.loading-gif').hide()
        # show our load more link
        $('.load-more').show()
        return
    return
  return

# ---
# generated by js2coffee 2.1.0
