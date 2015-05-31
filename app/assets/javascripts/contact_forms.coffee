
# checked selector https://api.jquery.com/checked-selector/
$(document).on 'page:change', ->
  $('input').on 'click', ->
    switch $( "input:checked" ).val()
      when "contribute"
        $('.contact_form_mail small').text("Your e-mail used for Trello and Slack in order to receive your invitations:")
        $('.contact_form_message small').text("nformation about your interests, skills, or areas where you would like to contribute:")
        $('#contact_submit_button').prop('value', 'REQUEST INVITATION')
      when "feature"
        $('.contact_form_mail small').text("Your e-mail:")
        $('.contact_form_message small').text("What else would you like to be implemented for this project? \nPlease remember that the best way to suggest a complex, well documented feature is by adding it directly to the Trello (Concept board - New Features list)")
        $('#contact_submit_button').prop('value', 'REQUEST NEW FEATURE')
      when "bug"
        $('.contact_form_mail small').text("Your e-mail")
        $('.contact_form_message small').html('Details about the bug you encountered. If the bug is complex and you need to attach screenshots in order to document it, please open an issue on <a href="https://github.com/iacobson/Zero2Dev/issues/new" target="_blank">github issues</a>')
        $('#contact_submit_button').prop('value', 'SUBMIT BUG')
      when "feedback"
        $('.contact_form_mail small').text("Your e-mail")
        $('.contact_form_message small').text("Your feedback on the project is greatly appreciated:")
        $('#contact_submit_button').prop('value', 'SEND FEEDBACK')
