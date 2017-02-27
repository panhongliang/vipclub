/**
 * 
 * @ahthor : zhangz
 * @date : 20160606
 * 
 */
$(function() {
	$(".J_ajax_form").submit(function(e) {
		var form = $(this);
		$.post(form.attr('action'), form.serialize(), function(rep) {
			if (rep.code != 0) {
				alert(rep.msg);
			} else {
				if (rep.msg != null && rep.msg != undefined && rep.msg != '') {
					window.location.href = rep.msg;
				}
			}
		}, 'json');
		return false;
	});
});