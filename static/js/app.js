window.disqus_shortname = 'otters';

window.DISQUSWIDGETS = {
  displayCount: function(obj) {
    return $.each(obj.counts, function(_, c) {
      var badge = $("span[data-disqus='" + c.id + "']");
      badge.html("" + c.comments + " <span class='glyphicon glyphicon-comment'></span>");
      if(c.comments !== 0) {
        badge.addClass("commentful");
      }
    });
  }
};

$(document).ready(function() {
  var goTo = function(e) {
    if(e) window.location = e;
  }

  $(document).on("keydown", function(e) {
    console.log(e.keyCode, e.keyCode === 37, $("#pback"));
    if(e.keyCode === 37 || e.keyCode === 72) goTo($("#pback").attr("href"));
    if(e.keyCode === 39 || e.keyCode === 76) goTo($("#pfor").attr("href"));
  });

  $("[data-tipsy]").tipsy({
    opacity: 1,
    gravity: function() {
      if ($(document).width() < 900) {
        return 'w';
      } else {
        if ($(this).offset().left <= 125) {
          return 'w';
        } else {
          return 'e';
        }
      }
    },
    offset: 4
  });
});
