

$('.technology_field').empty()
$('.technology_field').append('
<%= simple_form_for @current_post do |f| %>
  <%= j render "technologies/technology_field", f: f  %>
<%end%>
')

$('.chosen-select').chosen
  allow_single_deselect: true
  no_results_text: 'Oops! No result!'
  width: '100%'
  search_contains: true
  max_selected_options: 10
  display_disabled_options: false

$('.new_technology_input').val('')
