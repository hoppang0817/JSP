$(document).ready(function() {
    var header = $(".header").height();
    $(".header").addClass("header-Transparent");

    $(window).scroll(function() {
        var rol = $(this).scrollTop() >= header;

        if (rol) {
            $(".logo-img").attr("src", "resources/img/JMT-logo.png");
            $(".header").removeClass("header-Transparent");
            $(".menu-text").css("color", "#9b9b9b");
            $(".user").css("border-left", "1px solid #dddddd");
            $(".fastmenu li").css("border-left", "1px solid #dddddd");
        } else {
            $(".logo-img").attr("src", "resources/img/JMT-logo-white.png");
            $(".header").addClass("header-Transparent");
            $(".menu-text").css("color", "#ffffff");
            $(".user").css("border", "none");
            $(".fastmenu li").css("border", "none");
        }
    });
});

$(".usermenu").hide();

$('.usericon').click(function() {
    $('.usermenu').slideToggle('slow', function() {
        // 객체가 다 펼치지거나 접히고 나면 여기에 든 내용이 실행된다.
    });
});

function searchToggle(obj, evt){
    var container = $(obj).closest('.search-wrapper');
        if(!container.hasClass('active')){
            container.addClass('active');
            evt.preventDefault();
            $(".header").css("height", "180px");
            $(".detail").css("visibility", "visible");
            $(".search-wrapper").css("top", "25%");
            $(".user").css("padding", "74px 0 74px 40px");
            $(".fastmenu li").css("padding", "78px 0");
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
            $(".header").css("height", "80px");
            $(".detail").css("visibility", "hidden");
            $(".search-wrapper").css("top", "50%");
            $(".user").css("padding", "21px 0 21px 40px");
            $(".fastmenu li").css("padding", "28px 0");
        }
}

$('.starRev span').click(function(){
    $(this).parent().children('span').removeClass('on');
    $(this).addClass('on').prevAll('span').addClass('on');
    return false;
  });