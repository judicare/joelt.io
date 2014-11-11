window.disqus_shortname = 'otters';

window.DISQUSWIDGETS = {
  displayCount: function(obj) {
    return $.each(obj.counts, function(_, c) {
      var badge;
      badge = $("span[data-disqus='" + c.id + "']");
      badge.html("" + c.comments + " <span class='glyphicon glyphicon-comment'></span>");
      if (c.comments !== 0) {
        return badge.addClass("commentful");
      }
    });
  }
};
