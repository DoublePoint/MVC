function init(){
	$('#admin-side-toggle').on('click', function() {
		var sideWidth = $('#admin-side').width();
		if (sideWidth === 200) {
			$('#admin-body').animate({
				left : '0'
			}); // admin-footer
			$('#admin-footer').animate({
				left : '0'
			});
			$('#admin-side').animate({
				width : '0'
			});
		} else {
			$('#admin-body').animate({
				left : '200px'
			});
			$('#admin-footer').animate({
				left : '200px'
			});
			$('#admin-side').animate({
				width : '200px'
			});
		}
	});
}

function windowResize(){
	if($('#admin-body').css("left")=='0px')
		$('#admin-footer').css("left","0");
	else
		if($('#admin-body').css("left")=='200px')
			$('#admin-footer').css("left","200px");
}



