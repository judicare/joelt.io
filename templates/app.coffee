window.disqus_shortname = 'otters'

window.DISQUSWIDGETS =
  displayCount: (obj) ->
    console.log(c)
    $.each(obj.counts, (_, c) ->
      badge = $("span[data-disqus='#{c.id}'")
      badge.html("#{c.comments} <span class='glyphicon glyphicon-comment'></span>")
      if c.comments != 0
        badge.addClass("commentful")
    )

$(document).ready ->
  goTo = (e) -> window.location = e if e

  $(document).on "keydown", (e) ->
    if e.keyCode in [37, 72]
      goTo($("#pback").attr("href"))
    if e.keyCode in [39, 76]
      goTo($("#pfor").attr("href"))

  $("[data-tipsy]").tipsy
    opacity: 1
    gravity: ->
      if $(document).width() < 900 || $(this).offset().left <= 125
        'w'
      else
        'e'
    offset: 4
