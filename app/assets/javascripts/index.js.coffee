# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#search-form').on 'click', (event) ->
    event.preventDefault()

    $.getJSON '/search?query=test', (results) ->
      $results = $('#results')
      $results.empty()

      $.each results, (index, result) ->
        $results.append('<li>' + result.name + '</li>')
