# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', ':button[type="cart_del"]', ->
  console.log @type
  $.ajax
    url: '/tracking_lists/' + @id.split('_')[1]
    method: 'DELETE'
    success: (data) ->
      $('.cart-table').html data
      return
  return

$(document).on 'click', ':button[type="all_del"]', ->
  console.log @type
  $.ajax
    url: '/tracking_lists/all'
    method: 'DELETE'
    success: (data) ->
      $('.cart-table').html data
      return
  return