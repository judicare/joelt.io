# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).on "click", "#hire_me_link", (e) ->
    e.preventDefault()
    $("#mask").show()

$(document).on "submit", "form", (e) ->
    e.preventDefault()
    $("#mask").show()
    $(".error").html("")

$(document).on "click", "#no-hire", (e) ->
    e.preventDefault()
    $("body").removeClass "box-shown"
    setTimeout(() -> $("#main").html(""),
    1000)