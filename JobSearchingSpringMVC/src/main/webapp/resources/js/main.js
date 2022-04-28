$(document).ready(function () {
    $("#dobDay").val("");
    $("#dobMonth").val("");
    $("#dobYear").val("");
});

var loadFile = function(event) {
    var output = document.getElementById('output');
    var image = document.getElementById('output');
    image.style.display = "block";
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
        URL.revokeObjectURL(output.src)
    }
};
