var worksheetNo;
function retrieve() {
	$.request({
		url:$$pageContextPath+"/template/sys/workflow/announcement/findWorksheet",
		data:{
			worksheetNo:worksheetNo,
		},
		success:function(response){
			var annChangedWrap=response.get("annChangedWrap");
			if(annChangedWrap!=null)
				ajaxformWorksheet.setData(annChangedWrap.data);
			var worksheetWrap=response.get("worksheetWrap");
			if(worksheetWrap!=null)
				ajaxformAnnouncement.setData(annChangedWrap.data);
		}
			
	});
}

function onClickAdd() {
	$.request({
		url:$$pageContextPath+"/template/sys/workflow/announcement/save",
		data:{
			annChangedWrap:ajaxformAnnouncement.collectDataWrap(),
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
