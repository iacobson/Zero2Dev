$(document).on 'page:change', ->
  $('.tags_wrapper .panel-body, .panel-footer').hide()




  $('.tags_wrapper').on 'click', '.show_tag_filters', ->
    $('.tags_wrapper .panel-body, .panel-footer').slideToggle()
