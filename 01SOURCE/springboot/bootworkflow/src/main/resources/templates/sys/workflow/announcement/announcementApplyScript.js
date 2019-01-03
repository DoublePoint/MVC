var worksheetNo;
function retrieve() {
	$.request({
		url:$$pageContextPath+"sys/workflow/announcement/findWorksheet",
		data:{
			worksheetNo:worksheetNo,
		},
		success:function(response){
			var annChangedPacket=response.get("annChangedPacket");
			if(annChangedPacket!=null)
				ajaxformWorksheet.setData(annChangedPacket.data);
			var worksheetPacket=response.get("worksheetPacket");
			if(worksheetPacket!=null)
				ajaxformAnnouncement.setData(annChangedPacket.data);
		}
			
	});
}

function onClickAdd() {
	$.request({
		url:$$pageContextPath+"sys/workflow/announcement/save",
		data:{
			annChangedPacket:ajaxformAnnouncement.collectDataPacket(),
		},
		success:function(response){
			if(response.get("worksheetNo")!=null){
				worksheetNo=response.get("worksheetNo");
				$.alert("保存成功。");
				retrieve();
			}
			else
				$.alert("保存失败。")
		}
			
	});
}
