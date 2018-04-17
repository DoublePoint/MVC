function gridLeftOncheck(row){
	var rows=gridResource.getCheckedDataList();
	gridAim.addRecords(rows);
	
	gridResource.removeChecked();
}