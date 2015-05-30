'<% @technology.to_a.each_with_index do |t,i| %>'

$('.chosen-choices').prepend('

  <li class="search-choice">
    <span><%=t%></span>
    <a class="search-choice-close" data-option-array-index="<%=i%>"></a>
  </li>
')

'<%end%>'

$('.new_technology_input').val('')
