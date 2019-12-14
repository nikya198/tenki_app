# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'change', '#prefecture_id', ->
  $.ajax(
    type: 'GET'
    url: '/home/get_cities'
    data: {
      prefecture_id: $(this).val()
    }
  )