$ ->
  $('#selfie').click ->
    window.location.href = "#add"
    $('#file').attr("name", "user[image]")
  
  # These few lines of code are really repetitive, consider of picking a time to refactor it!
  $('#selfie').mousemove ->
    $('#selfie').css("opacity", 0.7)
    $('#image-cammera').css("font-size", "27px")
  $('#selfie').mouseleave ->
    $('#selfie').css("opacity", 1)
    $('#image-cammera').css("font-size", "35px")

  $('.each-group-img').mousemove ->
    $(this).css("opacity", 0.3)
  $('.each-group-img').mouseleave ->
    $(this).css("opacity", 1)
  
  $('#image-cammera').click ->
    window.location.href = "#add"
    $('#file').attr("name", "user[image]")
  
  


  $('#background-comment').click ->
    window.location.href = "#add"
    $('#file').attr("name", "user[background]")  
  
  $('#background-container').click ->
    window.location.href = "#add"
    $('#file').attr("name", "user[background]")
    
