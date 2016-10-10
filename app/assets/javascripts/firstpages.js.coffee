$ ->
  $('.inner-icon').mousemove ->
    $.ajax '/sessions',
      type: 'GET'
      dataType: 'script'
      success: (data, textStatus, jqXHR) ->

