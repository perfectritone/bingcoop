# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#about').hover(
    -> 
      $('#about ul').show()
    -> 
      $('#about ul').hide()
  )

  $('#get_involved').hover(
    -> 
      $('#get_involved ul').show()
    -> 
      $('#get_involved ul').hide()
  )

  $('#products').hover(
    -> 
      $('#products ul').show()
    -> 
      $('#products ul').hide()
  )

  $('#recipes').hover(
    -> 
      $('#recipes ul').show()
    -> 
      $('#recipes ul').hide()
  )
  
  $('#resources').hover(
    -> 
      $('#resources ul').show()
    -> 
      $('#resources ul').hide()
  )

