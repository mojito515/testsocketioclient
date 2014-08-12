var address;
var filter;
function insertParam(d, e) {
    d = escape(d);
    e = escape(e);
    var b = document.location.search.substr(1).split("&");
    if (b == "") {
        document.location.search = "?" + d + "=" + e
    } else {
        var c = b.length;
        var a;
        while (c--) {
            a = b[c].split("=");
            if (a[0] == d) {
                a[1] = e;
                b[c] = a.join("=");
                break
            }
        }
        if (c < 0) {
            b[b.length] = [d, e].join("=")
        }
        document.location.search = b.join("&")
    }
}
$(document).ready(function() {
    filter = parseInt($(document.body).data("filter"));
    address = $(document.body).data("address");
    $("#payment-request").click(function() {
        loadScript("wallet/frame-modal",
        function() {
            showFrameModal({
                title: "Create Payment Request",
                description: "Request Payment into address <b>" + address + "</b>",
                src: root + "payment_request?address=" + address
            })
        })
    });
    $("#create-donation-button").click(function() {
        loadScript("wallet/frame-modal",
        function() {
            showFrameModal({
                title: "Create Donation Button",
                description: "Create Donation Button To Address <b>" + address + "</b>",
                src: root + "create_donation_button?address=" + address,
                height: "600px"
            })
        })
    });
    $(".tx_filter a").click(function() {
        var a = $(this).data("value");
        if (a == "export") {
            loadScript("wallet/frame-modal",
            function() {
                showFrameModal({
                    title: "Export History",
                    description: "",
                    src: root + "export-history?active=" + address
                })
            });
            return
        }
        insertParam("filter", $(this).data("value"))
    });
    if (filter == 0) {
        webSocketConnect(function(a) {
            a.onmessage = function(j) {
                var f = $.parseJSON(j.data);
                if (f.op == "status") {
                    $("#status").html(f.msg)
                } else {
                    if (f.op == "utx") {
                        op = f.x;
                        playSound("beep");
                        var h = TransactionFromJSON(op);
                        h.setConfirmations(0);
                        var m = 0;
                        for (var g = 0; g < h.inputs.length; g++) {
                            var k = h.inputs[g];
                            console.log(k.prev_out.addr);
                            if (k.prev_out.addr == address) {
                                m -= parseInt(k.prev_out.value)
                            }
                        }
                        var d = 0;
                        for (var g = 0; g < h.out.length; g++) {
                            var c = h.out[g];
                            if (c.addr == address) {
                                d += parseInt(c.value)
                            }
                        }
                        $("#total_received span").data("c", parseInt($("#total_received span").data("c")) + d);
                        m += d;
                        $("#final_balance span").data("c", parseInt($("#final_balance span").data("c")) + m);
                        h.result = m;
                        $("#no_tx").hide();
                        var l = $(h.getHTML());
                        var b = $("#tx_container");
                        b.prepend(l);
                        setupSymbolToggle();
                        l.hide().slideDown("slow");
                        if (b.find(".txdiv").length > 50) {
                            b.find(".txdiv:last-child").remove()
                        }
                        $("#n_transactions").text(parseInt($("#n_transactions").text()) + 1);
                        calcMoney()
                    }
                }
            };
            a.onopen = function() {
                $("#status").html("Connected. ");
                a.send('{"op":"addr_sub", "addr":"' + address + '"}')
            };
            a.onclose = function() {
                $("#status").html("Disconnected")
            }
        })
    }
});