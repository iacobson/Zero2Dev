# front end validation for file upload (size to be < 5MB)
$(document).on 'page:change', ->
  $('#picture_image').bind 'change', ->
    size_in_megabytes = this.files[0].size/1024/1024
    if (size_in_megabytes > 5)
      alert "Maximum file size is 5MB. Please choose a smaller file"
      $('#picture_image').val('')
