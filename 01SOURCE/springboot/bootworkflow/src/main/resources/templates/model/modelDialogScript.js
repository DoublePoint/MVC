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
	var dataPacket = ajaxform.collectDataPacket();
	var data=dataPacket.getData();
	$.request({
		url : $$pageContextPath + "oll/model/model-create?key=" + data.key + "&name=" + data.name + "&description=" + data.description,
		data : {

		},
		success : function(response) {
			var modelId = response.get("modelId");
			$.tips("创建成功。");
			$.close();
			$.openTab({
				title : "Model:"+modelId,
				content : '<iframe src="' + $$pageContextPath + '/modeler.html?modelId=' + modelId + '"></iframe>',
				id : modelId
			});
		},
		error : function(ecx) {
			$.shakeTips('保存失败');
			return false;
		}
	});
}

