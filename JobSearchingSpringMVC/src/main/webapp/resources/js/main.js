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

$("textarea").each(function () {
    this.setAttribute("style", "height:" + (this.scrollHeight) + "px;overflow-y:hidden;");
}).on("input", function () {
    this.style.height = "auto";
    this.style.height = (this.scrollHeight) + "px";
});

imgInp.onchange = evt => {
    const [file] = imgInp.files
    if (file) {
        blah.src = URL.createObjectURL(file)
    }
}

function refreshPage() {
    window.location.reload();
}

function removeFilter() {
    window.location.href = window.location.href.split('?')[0]
}

function updateQueryStringParameter(key, value) {
    let uri = window.location.href
    let re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    let separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
        window.location.href = uri.replace(re, '$1' + key + "=" + value + '$2');
    }
    else {
        window.location.href = uri + separator + key + "=" + value;
    }
}
