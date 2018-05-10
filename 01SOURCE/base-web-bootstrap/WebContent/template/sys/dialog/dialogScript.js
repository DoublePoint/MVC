function _InitOpenDialog(url, responseData) {
	document.getElementById("popWinForm").setAttribute("action",url);
	jq12("#hiddenResponseData").val(JSON.stringify(responseData));
	document.forms[0].submit() ; 
//	responseData = responseData;
//	var settings = {};
//	settings.url = url;
//	settings.type = "POST";
//	settings.contentType = 'application/json;charset=UTF-8';
//	settings.dataType = "html";
//	settings.data = JSON.stringify(responseData);
//	settings.success = function(response) {
//		jq12("html").html(response + "<script type='text/javascript'>initReady();</script>");
//	}
//	jq12.ajax(settings);
}
