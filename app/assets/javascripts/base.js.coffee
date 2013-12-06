$ ->
  FastClick.attach document.body
  $("textarea").autosize()

$(document).on 'page:update', ->
  $.backstretch('#{asset_path("skyline-color.jpg")}', {centeredX: false, centeredY: false});
