# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#search-form').on 'click', (event) ->
    event.preventDefault()

    query = $('#search-form').serializeArray()[0].value

    $.getJSON '/search?query=' + query, (results) ->
      $results = $('#results')
      $results.empty()

      template = Handlebars.compile $("#result-template").html()

      $.each results, (index, result) ->
        $results.append template result

  Handlebars.registerHelper 'decimal', (number) ->
    Number(number).toFixed 2