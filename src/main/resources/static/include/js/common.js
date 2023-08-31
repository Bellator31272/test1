function chkData(item, msg){
	if($(item).val().replace(/\s/g,"")==""){
			alert(msg+" 입력");
			$(item).val("");
			$(item).focus();
			return false;
	} else { return true;}
}

function formCheck(item, tag , msg){
	if($(item).val().replace(/\s/g,"")==""){
			$(tag).text(msg+"를 입력하세요.");
			$(item).focus();
			return false;
	} else { return true;}
}
