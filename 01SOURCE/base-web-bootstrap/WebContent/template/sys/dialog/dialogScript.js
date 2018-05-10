function _InitOpenDialog(responseData) {
	document.getElementById("popWinForm").setAttribute("action",responseData.url);
	jq12("#hiddenResponseData").val(JSON.stringify(responseData));
	document.forms[0].submit() ; 
}
