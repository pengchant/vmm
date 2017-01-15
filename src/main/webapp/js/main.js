/**
 * Created by cp on 2016/9/8.
 */
$(function(){

    // 控制左侧导航栏的显示与隐藏
    $(".nav_ul>li>a").click(function(){
        // 如果已经展开就隐藏，否则显示
        var $cont = $(this).next();
        var $span = $(this).find("span:eq(0)");
        if($cont.is(":visible")){
            $span.addClass("span_up");
            $cont.slideUp();
        }else{
            $span.removeClass("span_up");
            $cont.slideDown();
        }
    });

    // 显示tip
    $(".mytipTop").tooltip();

});