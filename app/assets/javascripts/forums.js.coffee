ready = ->
  $('#school-input').keyup ->
    input = $('#school-input').val()
    $.ajax '/forumsearch',
      type: 'GET'
      data: { 'content' : input }
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        $('#content-container').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        $('#content-container').html("")
        for i in [0...data.length]
          text = data[i].name
          $('#content-container').append "<div>#{text}</div>"
        $('#content-container div').click ->
          alert "choose this one"
# $(document).ready(ready)
$(document).on('turbolinks:load', ready)