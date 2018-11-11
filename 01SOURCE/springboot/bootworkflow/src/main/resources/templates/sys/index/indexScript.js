function init(){
	$('#admin-side-toggle').on('click', function() {
		var sideWidth = $('#admin-side').width();
		if (sideWidth === 250) {
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
				left : '250px'
			});
			$('#admin-footer').animate({
				left : '250px'
			});
			$('#admin-side').animate({
				width : '250px'
			});
		}
	});
}

function windowResize(){
	if($('#admin-body').css("left")=='0px')
		$('#admin-footer').css("left","0");
	else
		if($('#admin-body').css("left")=='250px')
			$('#admin-footer').css("left","250px");
}



