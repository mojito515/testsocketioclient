var socket = io.connect('http://localhost:10119');
socket.on('connect', function() {
	socket.emit('news');
});
socket.on('message', function(data) {
	var h = eval("(" + data + ")");

	if (h.op == "transaction") {
        var b = h.x;
        var c;
        c = '<a href="' + root + "tx/" + b.txid + '">' + b.txid.substring(0, 25) + "...</a>";
        var f = $("<tr><td><div>" + c + '</div></td><td class="hidden-phone" data-time="' + b.received_time + '"><div>< 1 minute</div></td><td><div><button class="btn btn-success cb">' + formatMoney(b.out, true) + "</button></div></td></tr>");
        f.insertAfter($("#txs tr:first")).find("div").hide().slideDown("slow");
        $("#txs tr:last-child").remove();
    } else {
        if (h.op == "block") {
            var j = h.x;
            if ($("#bi:" + j.hash).length > 0) {
                return
            }
            var g = "Unknown";
            if (j.relayed_by != null) {
                g = '<a href="' + j.relayed_by + '">' + j.relayed_by + "</a>";
            }
            $('<tr id="bi:' + j.hash + '"><td><div><a href="' + root + "blk/" + j.hash + '">' + j.height + '</a></div></td><td data-time="' + j.time + '"><div>< 1 minute</div></td><td class="hidden-phone"><div>' + j.txcount + '</div></td><td class="hidden-phone"><div>' + formatMoney(j.totalOut, true) + "</div></td><td><div>" + g + '</div></td><td class="hidden-phone"><div>' + parseInt(j.size / 1024) + "</div></td></tr>").insertAfter($("#blocks tr:first")).find("div").hide().slideDown("slow");
            $("#blocks tr:last-child").remove();
        }
    }
	
	
	setupSymbolToggle();
});
socket.on('disconnect', function() {

});

function updateTimes() {
	var a = new Date().getTime() / 1000;
	$("td[data-time]").each(
			function(b) {
				var e = parseInt($(this).data("time"));
				if (e == 0) {
					$(this).text("");
				}
				var d = a - e;
				if (d < 60) {
					$(this).text("< 1 minute");
				} else {
					if (d < 3600) {
						var c = (parseInt(d / 60) > 1) ? "s" : "";
						$(this).text(parseInt(d / 60) + " minute" + c);
					} else if (d < 3600 * 24) {
						var c = (parseInt(d / 3600) > 1) ? "s" : "";
						$(this).text(
								parseInt(d / 3600) + " hour" + c + " "
										+ parseInt((d % 3600) / 60)
										+ " minutes");
					} else {
						$(this).text("> 1 day");
					}

				}
			});
}
$(document).ready(function() {
	if (top.location != self.location) {
		top.location = self.location.href;
	}

	setInterval(updateTimes, 1000);
});