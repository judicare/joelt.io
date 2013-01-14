function $(i) {
    return document.getElementById(i);
}

window.addEventListener("load", function() {
    var times = $("short_term").getElementsByTagName("time");
    var lis = $("short_term").getElementsByTagName("li");
    var allDone = true;
    var total_min = 0;
    for(var t = 0; t < times.length; t++) {
        total_min += parseInt(times[t].innerHTML);
        allDone = allDone && lis[t].getAttribute("done") === "true";
    }
    
    var money = document.createElement("author");
    money.innerHTML = "$" + (Math.ceil(total_min / 30) * 7.5).toFixed(2);
    $("total").appendChild(money);
    
    var total_span = document.createElement("time");
    total_span.innerHTML = "" + total_min + " minutes";
    $("total").appendChild(total_span);
    
    $("total").setAttribute("done", allDone ? "true" : "false")
}, false)