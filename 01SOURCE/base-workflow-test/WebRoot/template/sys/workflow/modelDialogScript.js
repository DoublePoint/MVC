function init(response) {
	var type = response.get("type");
	if (type == "add") {
	} else {
		var admin = response.get("admin");
		ajaxform.setData(admin);
	}

}

function onClickSave() {
	if (!ajaxform.validate(true)) {
		return;
	}
	var data = ajaxform.collectData();
	$.request({
		url : $$pageContextPath + "/workflow/model/model-create?key=" + data.key + "&name=" + data.name + "&description=" + data.description,
		data : {

		},
		success : function(response) {
			var modelId = response.get("modelId");
			$.openTab("1", {
				title : "Model:"+modelId,
				content : '<iframe src="' + $$pageContextPath + "/modeler.html?modelId=" + modelId + '"></iframe>',
				id : modelId
			});
		},
		error : function(ecx) {
			$.shakeTips('保存失败');
			return false;
		}
	});
}
