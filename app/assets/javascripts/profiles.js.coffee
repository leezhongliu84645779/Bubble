$ ->
  $('.profile-li').mouseover ->
    $(this).css("border-left": "7px solid #4B0082", "color": "black")
    $('#div1').css("display", "block")
  $('.profile-li').mouseout ->
    $(this).css("border-left": "", "color": "grey")
