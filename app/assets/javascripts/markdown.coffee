
#options for Bootstrap Markdown
$(document).on 'page:change', ->
  $(".markdown_input_field").markdown
    iconlibrary:"fa"
    resize:"vertical"
