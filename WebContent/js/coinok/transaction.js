$(document).ready(function() {
    try {
        $("[rel=popover]").popover({
            offset: 10
        }).click(function(b) {
            b.preventDefault()
        })
    } catch(a) {}
});