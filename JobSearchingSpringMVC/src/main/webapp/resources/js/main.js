$(document).ready(function () {
    $("#password").val("");
    $("#confirmPassword").val("");

    if ($("#dobDay").val() === "0")
        $("#dobDay").val("");

    if ($("#dobMonth").val() === "0")
        $("#dobMonth").val("");

    if ($("#dobYear").val() === "0")
        $("#dobYear").val("");
});

$('.confirmation').on('click', function () {
    return confirm('Bạn có chắc chắn muốn xoá?');
});

imgInp.onchange = evt => {
    const [file] = imgInp.files
    if (file) {
        blah.src = URL.createObjectURL(file)
    }
}
