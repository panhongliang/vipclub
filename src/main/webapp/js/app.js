//设置单页全屏
$(document).ready(function () {
    var height = $(window).height();
    $('.main-wrap,.login-main-wrap,.vip_reg_main_wrap,.vip_serach_main_wrap').css('height', height);
    console.log("ok");
});

$('#production_date').datetimepicker({
    format: 'yyyy-mm-dd hh:ii',
    language: 'zh-CN',
    autoclose: true
});

