$(document).ready(function () {
    if ($("#dobDay").val() === "0")
        $("#dobDay").val("");

    if ($("#dobMonth").val() === "0")
        $("#dobMonth").val("");

    if ($("#dobYear").val() === "0")
        $("#dobYear").val("");

    $("#password").val("");
    $("#confirmPassword").val("");
});

imgInp.onchange = evt => {
    const [file] = imgInp.files
    if (file) {
        blah.src = URL.createObjectURL(file)
    }
}

let elems = document.getElementsByClassName('confirmation');
let confirmIt = function (e) {
    if (!confirm('Are you sure?')) e.preventDefault();
};
let i = 0, l = elems.length;
for (; i < l; i++) {
    elems[i].addEventListener('click', confirmIt, false);
}

