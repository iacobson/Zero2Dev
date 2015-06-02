#move the 'read more' button upper, over text preview
$(document).on 'page:change', ->
  $('.read_more_button').css({top: -25, left: -15, position:'absolute'})
