
# checked selector https://api.jquery.com/checked-selector/
$(document).on 'page:change', ->
  $('input').on 'click', ->
    switch $( "input:checked" ).val()
      when "contribute"
        $('.contact_form_mail small').text("please input your e-mail you are using for Trello and Slack in order to receive your invitations")
        $('.contact_form_message small').text("any information about your motivation, interests, skills or areas you would like to contribute to the project")
        $('#contact_submit_button').prop('value', 'Request Invitation')
      when "feature"
        $('.contact_form_mail small').text("please input your e-mail")
        $('.contact_form_message small').text("what else would you like to be implemented for this project? \nPlease remember that the best way to suggest a complex, well documented feature is by adding it directly to the Trello (Concept board - New Features list)")
        $('#contact_submit_button').prop('value', 'Request New Feature')
      when "bug"
        $('.contact_form_mail small').text("please input your e-mail")
        $('.contact_form_message small').html('describe as detailed as possible the bug you encountered. If the bug is complex and you need to attach screenshots in order to document it, please open an issue on <a href="https://github.com/iacobson/Zero2Dev/issues/new" target="_blank">github</a>')
        $('#contact_submit_button').prop('value', 'Submit Bug')
      when "feedback"
        $('.contact_form_mail small').text("please input your e-mail")
        $('.contact_form_message small').text("your feedback on the project is greatly appreciated")
        $('#contact_submit_button').prop('value', 'Send Feedback')
