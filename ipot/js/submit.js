function SUBMIT() {
    var code = editor.session.getValue();
    document.submitForm.code.value = code;
    document.submitForm.menu.value = "submit";
    document.submitForm.submit();
}

function changeMode() {
    var mode = document.getElementById("chgMode").value;
    editor.session.setMode(mode);
}

window.onload = function() {
    var n = document.getElementById("fontSize");
    n.addEventListener("change", fontHandler, false);
}

function fontHandler() {
	var size = document.getElementById("fontSize").value;
    editor.setFontSize(size.toString() + "px");
    console.log(size);
}