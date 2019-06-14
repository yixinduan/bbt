/**
 * Created by Administrator on 14-11-16.
 */
$(document).ready(function(){
    $('#zymd').tendina({
        openCallback: function(clickedEl) {
            clickedEl.addClass('opened');
            setTimeout(zymdResize, 500);// 设个定时，不然浏览器会计算 显示 之前的高度
        },
        closeCallback: function(clickedEl) {
            clickedEl.addClass('closed');
            setTimeout(zymdResize, 500);// 设个定时，不然浏览器会计算 隐藏 之前的高度
        }
    });

});
$(function(){

	$("#ad_setting").click(function(){
        $("#ad_setting_ul").show();
    });
    $("#ad_setting_ul").mouseleave(function(){
        $(this).hide();
    });
    $("#ad_setting_ul li").mouseenter(function(){
        $(this).find("a").attr("class","ad_setting_ul_li_a");
    });
    $("#ad_setting_ul li").mouseleave(function(){
        $(this).find("a").attr("class","");
    });
    
});