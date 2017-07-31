$(document).ready(function () {
    $('#tweet').keyup(updateCount);
    $('#tweet').keydown(updateCount);

    function updateCount() {
        var cs = $(this).val().length;
        if (cs == 0) {
            $('#characters-count').hide();
        } else {
            var remaining = 140 - cs;
            $('#characters-count').show();
            $('#characters-count').text(remaining + " characters remaining.");
        }
    }
});