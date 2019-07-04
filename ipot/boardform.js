function deletecheck() {
	if ( document.boardform.passwd.value=="" ) {
		alert("��ȣ�� �Է��� �ּ���.");
		document.boardform.passwd.focus();
		return;
	}		

	ok = confirm("�����Ͻðڽ��ϱ�?");
	if (ok) {
		document.boardform.menu.value='delete';
		document.boardform.submit();
	} else {
		return;
	}			
}

function insertcheck() {
	if ( document.boardform.name.value=="" ) {
		alert("�̸��� �Է��� �ּ���.");
		document.boardform.name.focus();
		return;
	}
	if ( document.boardform.passwd.value=="" ) {
		alert("��ȣ�� �Է��� �ּ���.");
		document.boardform.passwd.focus();
		return;
	}
	document.boardform.menu.value='insert';
	document.boardform.submit();
}

function updatecheck() {
	if ( document.boardform.name.value=="" ) {
		alert("�̸��� �Է��� �ּ���.");
		document.boardform.name.focus();
		return;
	}
	if ( document.boardform.passwd.value=="" ) {
		alert("��ȣ�� �Է��� �ּ���.");
		document.boardform.passwd.focus();
		return;
	}
	document.boardform.menu.value='update';
	document.boardform.submit();			
}
