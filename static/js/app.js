window.disqus_shortname = 'otters';

window.DISQUSWIDGETS = {
  displayCount: function(obj) {
    return $.each(obj.counts, function(_, c) {
      var badge;
      badge = $("span[data-disqus='" + c.id + "'");
      badge.html("" + c.comments + " <span class='glyphicon glyphicon-comment'></span>");
      if (c.comments !== 0) {
        return badge.addClass("commentful");
      }
    });
  }
};

$(document).ready(function() {
  var goTo;
  goTo = function(e) {
    if (e) {
      return window.location = e;
    }
  };
  $(document).on("keydown", function(e) {
    var _ref, _ref1;
    if ((_ref = e.keyCode) === 37 || _ref === 72) {
      goTo($("#pback").attr("href"));
    }
    if ((_ref1 = e.keyCode) === 39 || _ref1 === 76) {
      return goTo($("#pfor").attr("href"));
    }
  });
  return $("[data-tipsy]").tipsy({
    opacity: 1,
    gravity: function() {
      if ($(document).width() < 900 || $(this).offset().left <= 125) {
        return 'w';
      } else {
        return 'e';
      }
    },
    offset: 4
  });
});
