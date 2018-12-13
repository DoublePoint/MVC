function _InitOpenDialog(responseData) {
	formSubmit(responseData);
}

function formSubmit(responseData) {
	var url = responseData.url;
	var data = responseData;
	var form = $("#popWinForm");// 定义一个form表单
	form.attr("style", "display:none");
	form.attr("target", "");
	form.attr("method", "post");
	form.attr("action", url);
	if (data != null) {
		var ajaxRequest=new Object();
		ajaxRequest.map=data;
		var requestString = JSON.stringify(ajaxRequest);
		
		var fileInput = $("<input>");
		fileInput.attr("type", "hidden");
		fileInput.attr("id", "_hiddenRequestData");
		fileInput.attr("name", "_hiddenRequestData");// 设置属性的名字
		fileInput.attr("value", requestString);// 设置属性的值
		form.append(fileInput);
	}
	$("body").append(form);// 将表单放置在web中
	form.submit();// 表单提交
}
