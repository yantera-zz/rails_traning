init = ->
  $('#slide_search').on 'ajax:success', (e, data) ->
    $('#result').empty()
    $.each data.Slideshows.Slideshow, ->
      $('#result').append(
        $('<li></li>').appned(
          $('<a></a>').attr('href', @url).append("#{@Title} (#{@Description}) ")
        )
      )
  $(document).ajaxStart ->
    $('#progress').html '通信中...'
  .ajaxComplete ->
    $('#progress').html ''
  $('#ajax_form').on 'ajax:success', (e, data) ->
    $('#result').empty()
    $.each data ->
      $('#result').append(
        $('<li></li>').appned(
          $('<a></a>').attr('href', 'http://www.wings.msn.to/index.php/-/A-03/' + @isbn).append(@title)
        )
      )

$(document).ready(init)
$(document).on('page:change', init)
