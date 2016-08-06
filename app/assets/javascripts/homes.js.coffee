$ ->
  $('#selfie').click ->
    window.location.href = "#add"
    $('#file').attr("name", "user[image]")
  
  # These few lines of code are really repetitive, consider of picking a time to refactor it!
  $('#image-comment').mouseover ->
    $('#image-comment').css("background-color", "rgba(0,0,0,0.8)")
    $('#image-comment').css("font-size", "20px")
  $('#image-comment').mouseout ->
    $('#image-comment').css("background-color", "rgba(0,0,0,0.5)")
    $('#image-comment').css("font-size", "26px")
  $('#background-comment').mouseover ->
    $('#background-comment').css("color", "white")
  $('#background-comment').mouseout ->
    $('#background-comment').css("color", "grey")
  
  
    
  
  $('#image-comment').click ->
    window.location.href = "#add"
    $('#file').attr("name", "user[image]")
  
  $('#background-comment').click ->
    window.location.href = "#add"
    $('#file').attr("name", "user[background]")  
  
  $('#background-container').click ->
    window.location.href = "#add"
    $('#file').attr("name", "user[background]")
    
