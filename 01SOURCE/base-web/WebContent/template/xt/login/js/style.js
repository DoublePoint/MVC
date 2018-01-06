$("#zhishi").click(function() {
    $(this).hide();
})
$(".qiehuan").click(function (){
	$("#zhishi").hide(1000);
	$(this).parents(".login").hide().siblings().show();	
});


$(".login-tab li").click(function() {
	$(this).addClass("login-on").siblings().removeClass("login-on");
	$(".login-style").eq($(this).index()).show().siblings().hide();
//	$(".tishi").hide();
	})
var wait =60;document.getElementById("btn").disabled =false;function time(o) {if (wait ==0) {o.removeAttribute("disabled");o.value ="获取动态密码";wait =60;} else {o.setAttribute("disabled",true);o.value ="重新发送(" + wait + ")";wait--;setTimeout(function () {time(o);},1000)
}
}

//登录操作
function cliLogin() {

	var txtUser = $.trim($("#txtUser").val());
	var txtPwd = $("#Userpwd").val();
	var txtCode = $.trim($('#txtCode').val());
	if ($.trim(txtUser) == "") {
		Tip('请输入账号！');
		$("#txtUser").focus();
		return;
	}
	if ($.trim(txtPwd) == "") {
		Tip('请输入密码！');
		$("#Userpwd").focus();
		return;
	}
	if ($('#logincode').attr('iscode') == "1" && txtCode == "") {
		Tip('请输入验证码！');
		$("#txtCode").focus();
		return false;
	}
	return false;
}

function Sendpwd(sender) {
	var code = $("#txtCode2").val();
	var phone = $.trim($("#phone").val());
	if ($.trim(phone) == "") {
		Tip('请填写手机号码！');
		$("#phone").focus();
		return;
	}
	if ($("#yz-code").is(":visible") && $.trim(code) == "") {
		Tip('请填写验证码！');
		$("#txtCode2").focus();
		return;
	}
	return;
}
$("#dynamicLogon").click(function() {
	var pwd = $.trim($("#dynamicPWD").val());
	var phone = $.trim($("#phone").val());
	var code = $("#txtCode2").val();
	if ($.trim(phone) == "") {
		Tip('请填写手机号码！');
		$("#phone").focus();
		return;
	}
	if ($("#yz-code").is(":visible") && $.trim(code) == "") {
		Tip('请填写验证码！');
		$("#txtCode2").focus();
		return;
	}
	if ($.trim(pwd) == "") {
		Tip('动态密码未填写！');
		$("#dynamicPWD").focus();
		return;
	}
	return;
}); 
function Tip(msg) {
	$(".tishi").show().text(msg);
}