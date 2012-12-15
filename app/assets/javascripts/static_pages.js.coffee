# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#about_button').hover(
    -> 
      $('#about_button ul').show()
    -> 
      $('#about_button ul').hide()
  )

  $('#get_involved_button').hover(
    -> 
      $('#get_involved_button ul').show()
    -> 
      $('#get_involved_button ul').hide()
  )

  $('#products_button').hover(
    -> 
      $('#products_button ul').show()
    -> 
      $('#products_button ul').hide()
  )

  $('#recipes_button').hover(
    -> 
      $('#recipes_button ul').show()
    -> 
      $('#recipes_button ul').hide()
  )
  
  $('#resources_button').hover(
    -> 
      $('#resources_button ul').show()
    -> 
      $('#resources_button ul').hide()
  )

