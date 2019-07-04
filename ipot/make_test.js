function deletecheck() {
	ok = confirm("ªË¡¶");
	if (ok) {
		document.testform.menu.value='delete';
		document.testform.submit();
	} else {
		return;
	}			
}

function insertcheck() {
	if ( document.testform.name.value=="" ) {
		alert("");
		document.testform.name.focus();
		return;
	}
	if ( document.testform.question.value=="" ) {
		alert("");
		document.testform.question.focus();
		return;
	}
	if ( document.testform.question_score.value=="" ) {
		alert("");
		document.testform.question_score.focus();
		return;
	}
	if ( document.testform.answer.value=="" ) {
		alert("");
		document.testform.answer.focus();
		return;
	}
	document.testform.menu.value='insert';
	document.testform.submit();
}

function updatecheck() {
	if ( document.testform.name.value=="" ) {
		alert("");
		document.testform.name.focus();
		return;
	}
	if ( document.testform.question.value=="" ) {
		alert("");
		document.testform.question.focus();
		return;
	}
	if ( document.testform.question_score.value=="" ) {
		alert("");
		document.testform.question_score.focus();
		return;
	}
	if ( document.testform.answer.value=="" ) {
		alert("");
		document.testform.answer.focus();
		return;
	}
	document.boardform.menu.value='update';
	document.boardform.submit();			
}