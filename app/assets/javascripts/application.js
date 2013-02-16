//= require jquery
//= require jquery_ujs
//= require shadowbox
//= require_tree .

window.disqus_no_style = true;

var disqus_shortname = 'otters';
$.getScript("http://otters.disqus.com/embed.js");
$.getScript("http://otters.disqus.com/count.js");

$(document).ready(function() {
    Shadowbox.init({
        overlayOpacity: 0.2,
        fadeDuration: 0.25
    });
});