jQuery(function($) {
    var mySwiper = new Swiper('.swiper-container', {
        spaceBetween: 30,
        centeredSlides: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev'
        },
        autoplay: {
            delay: 2000,
            disableOnInteraction: true // 쓸어 넘기거나 버튼 클릭 시 자동 슬라이드 정지.
        },
        loop: true
    });

    // 데스크톱에서는 포커스가 빠진 경우 자동 슬라이드 재생.
    $(".swiper-container").on("focusout", function() {
        setTimeout(function() {
            if ($(this).find(":focus").length === 0) {
                mySwiper.autoplay.start();
                console.log("focusout, startAutoplay");
            }
        }, 100);
    });

    // 모바일에서는 화면을 움직이면 자동 슬라이드 기능 재생.
    $(document).on("touchmove", function() {
        mySwiper.autoplay.start();
        console.log("touchmove, startAutoplay");
    });

});