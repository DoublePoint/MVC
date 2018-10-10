function init(response) {
	var admin = response.get("dataWrap");
	ajaxgrid.setData(admin);
}

function onClickSave() {
	if (!ajaxform.validate(true)) {
		return;
	}
	var dataWrap = ajaxform.collectDataWrap();
	var data=dataWrap.getData();
	$.request({
		url : $$pageContextPath + "/template/sys/workflow/model-create?key=" + data.key + "&name=" + data.name + "&description=" + data.description,
		data : {

		},
		success : function(response) {
			var modelId = response.get("modelId");
			$.tips("创建成功。");
			$.close();
			$.openTab({
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

