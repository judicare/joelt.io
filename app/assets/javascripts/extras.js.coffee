$(document).on "click", "#hire_me_link", (e) ->
    e.preventDefault()
    $("#mask").show()

$(document).on "submit", "form", (e) ->
    $("#mask").show()
    $(".error").html("")

$(document).on "click", "#no-hire", (e) ->
    e.preventDefault()
    $("body").removeClass "box-shown"
    setTimeout(() -> $("#main").html(""),
    1000)