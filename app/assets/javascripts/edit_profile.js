/**
 * Created by sti on 27/07/17.
 */

$(document).ready(function () {

    $("#password-fields").hide();
    $("#btn-submit").prop('disabled', true);

    $('#password-checker').click(function () {
        $("#password-fields").toggle(this.checked);
    });

    $("#current-password").on('input', function() {
        if (this.value != "" && this.value.length > 5) {
            $("#btn-submit").prop('disabled', false);
        } else {
            $("#btn-submit").prop('disabled', true);
        }
    });
});