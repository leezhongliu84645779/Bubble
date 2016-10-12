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
  
  

  $('#image-cammera, #image-container').on "click", ->
    $('body').css("background-color", "black")
    $('.main-navbar, #background-container').css("opacity", 0.5)
    $('.modal').css("display", "block")
    $('#file').attr("name", "user[image]")
    window.location.href = "#add"
  
  


  
    
