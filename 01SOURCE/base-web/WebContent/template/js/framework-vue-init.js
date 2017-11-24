var $lform;
$(document).ready(function() {
	$lform = new Vue({
		el : "form",
		methods : {
			incrementTotal : function() {
				this.total += 1
			}
		}
	})
//	if (documentWriteHtml != "")
//		$("body").append(documentWriteHtml);
	
	if (init != null)
		init();
});
