# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->

  $(document).bind "ajaxSuccess", "form.comment_form", (event, xhr, settings) ->
    $comment_form = $(event.data)
    $error_container = $("#error_explanation", $comment_form)
    $error_container_ul = $("ul", $error_container)
    # alert JSON.stringify(xhr.responseJSON)

    $comments = $(".comments")
    #created_at = xhr.responseJSON.created_at.replace('T', ' ').substr(0, 19)
    created_at = xhr.responseJSON.created_at
    $('<div class="comment">
        <div class="user">'+xhr.responseJSON.user+':</div>
        <div class="created_at">'+created_at+'</div>
        <div class="body">'+xhr.responseJSON.body+'</div>
      </div>').prependTo $comments

    if $("li", $error_container_ul).length
      $("li", $error_container_ul).remove()
      $error_container.hide()

  $(document).bind "ajaxError", "form.comment_form", (event, jqxhr, settings, exception) ->
    $comment_form = $(event.data)

    $error_container = $("#error_explanation", $comment_form)
    $error_container_ul = $("ul", $error_container)
    $error_container.show()  if $error_container.is(":hidden")
    $.each jqxhr.responseJSON, (index, message) ->
      $("<li>").html(message).appendTo $error_container_ul