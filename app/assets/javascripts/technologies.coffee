# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  $('.tags_wrapper .panel-body, .tags_wrapper .panel-footer').hide()

  $('.tags_wrapper').on 'click', '.show_tag_filters', ->
    $('.tags_wrapper .panel-body, .tags_wrapper .panel-footer').slideToggle()

#initiate Chosen Gem
$(document).on 'page:change', ->
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'Oops! No result! You can create below the label:'
    width: '100%'
    search_contains: true
    max_selected_options: 10
    display_disabled_options: false
