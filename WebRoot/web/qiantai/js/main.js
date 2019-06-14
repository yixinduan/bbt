(function ($) {
    "use strict";


/*--
    Zymd Sticky
-----------------------------------*/
var windows = $(window);
var sticky = $('.header-sticky');

windows.on('scroll', function() {
    var scroll = windows.scrollTop();
    if (scroll < 300) {
        sticky.removeClass('is-sticky');
    }else{
        sticky.addClass('is-sticky');
    }
});


/*--
   Sidebar Search Active
-----------------------------*/
function sidebarSearch() {
    var searchTrigger = $('.trigger-search'),
        endTriggersearch = $('button.search-close'),
        container = $('.main-search-active');

    searchTrigger.on('click', function() {
        container.addClass('inside');
    });

    endTriggersearch.on('click', function() {
        container.removeClass('inside');
    });

};
sidebarSearch();
    
/*-------- Off Canvas Open close start--------*/
$(".off-canvas-btn").on('click', function () {
    $("body").addClass('fix');
    $(".off-canvas-wrapper").addClass('open');
});

$(".btn-close-off-canvas,.off-canvas-overlay").on('click', function () {
    $("body").removeClass('fix');
    $(".off-canvas-wrapper").removeClass('open');
});
    
    

/*-------- Off Canvas Open close start--------*/
$(".off-canvas-btn").on('click', function () {
    $("body").addClass('fix');
    $(".off-canvas-wrapper").addClass('open');
});

$(".btn-close-off-canvas,.off-canvas-overlay").on('click', function () {
    $("body").removeClass('fix');
    $(".off-canvas-wrapper").removeClass('open');
});
/*-------- Off Canvas Open close end--------*/


/*------- product view mode change js start -------*/
$('.product-view-mode a').on('click', function (e) {
    e.preventDefault();
    var shopProductWrap = $('.shop-product-wrap');
    var viewMode = $(this).data('target');
    $('.product-view-mode a').removeClass('active');
    $(this).addClass('active');
    shopProductWrap.removeClass('grid-view list-view').addClass(viewMode);
})
/*------- product view mode change js end -------*/



/*------- Countdown Activation start -------*/
$('[data-countdown]').each(function () {
    var $this = $(this),
        finalDate = $(this).data('countdown');
    $this.countdown(finalDate, function (event) {
        $this.html(event.strftime('<div class="single-countdown"><span class="single-countdown__time">%D</span><span class="single-countdown__text">Days</span></div><div class="single-countdown"><span class="single-countdown__time">%H</span><span class="single-countdown__text">Hours</span></div><div class="single-countdown"><span class="single-countdown__time">%M</span><span class="single-countdown__text">Mins</span></div><div class="single-countdown"><span class="single-countdown__time">%S</span><span class="single-countdown__text">Secs</span></div>'));
    });
});
/*------- Countdown Activation end -------*/


// quantity change js
$('.pro-qty').prepend('<span class="dec qtybtn">-</span>');
$('.pro-qty').append('<span class="inc qtybtn">+</span>');
$('.qtybtn').on('click', function () {
    var $button = $(this);
    var oldValue = $button.parent().find('input').val();
    if ($button.hasClass('inc')) {
        var newVal = parseFloat(oldValue) + 1;
    } else {
        // Don't allow decrementing below zero
        if (oldValue > 0) {
            var newVal = parseFloat(oldValue) - 1;
        } else {
            newVal = 0;
        }
    }
    $button.parent().find('input').val(newVal);
});


/*-------- scroll to top start --------*/
$(window).on('scroll', function () {
    if ($(this).scrollTop() > 600) {
        $('.scroll-top').removeClass('not-visible');
    } else {
        $('.scroll-top').addClass('not-visible');
    }
});
$('.scroll-top').on('click', function (event) {
    $('html,body').animate({
        scrollTop: 0
    }, 1000);
});
/*-------- scroll to top end --------*/


/*------- Category Zymd start -------*/
// Variables
var categoryToggleWrap = $('.category-toggle-wrap');
var categoryToggle = $('.category-toggle');
var categoryZymd = $('.category-zymd');

// Category Zymd Toggles
function categorySubZymdToggle() {
    var screenSize = $window.width();
    if (screenSize <= 991) {
        $('.category-zymd .zymd-item-has-children > a').prepend('<span class="expand zymd-expand">+</span>');
        $('.category-zymd .zymd-item-has-children ul').slideUp();
    } else {
        $('.category-zymd .zymd-item-has-children > a .zymd-expand').remove();
        $('.category-zymd .zymd-item-has-children ul').slideDown();
    }
}
// Category Sub Zymd
$('.category-zymd').on('click', 'li a, li a .zymd-expand', function (e) {
    var $a = $(this).hasClass('zymd-expand') ? $(this).parent() : $(this);
    if ($a.parent().hasClass('zymd-item-has-children')) {
        if ($a.attr('href') === '#' || $(this).hasClass('zymd-expand')) {
            if ($a.siblings('ul:visible').length > 0) $a.siblings('ul').slideUp();
            else {
                $(this).parents('li').siblings('li').find('ul:visible').slideUp();
                $a.siblings('ul').slideDown();
            }
        }
    }
    if ($(this).hasClass('zymd-expand') || $a.attr('href') === '#') {
        e.preventDefault();
        return false;
    }
});
/*------- Category Zymd end -------*/


/*------- responsive mobile zymd start -------*/
//Variables
var $offCanvasNav = $('.mobile-zymd'),
    $offCanvasNavSubZymd = $offCanvasNav.find('.dropdown');

//Add Toggle Button With Off Canvas Sub Zymd
$offCanvasNavSubZymd.parent().prepend('<span class="zymd-expand"><i></i></span>');

//Close Off Canvas Sub Zymd
$offCanvasNavSubZymd.slideUp();

//Category Sub Zymd Toggle
$offCanvasNav.on('click', 'li a, li .zymd-expand', function(e) {
    var $this = $(this);
    if ( ($this.parent().attr('class').match(/\b(zymd-item-has-children|has-children|has-sub-zymd)\b/)) && ($this.attr('href') === '#' || $this.hasClass('zymd-expand')) ) {
        e.preventDefault();
        if ($this.siblings('ul:visible').length){
            $this.parent('li').removeClass('active');
            $this.siblings('ul').slideUp();
        } else {
            $this.parent('li').addClass('active');
            $this.closest('li').siblings('li').removeClass('active').find('li').removeClass('active');
            $this.closest('li').siblings('li').find('ul:visible').slideUp();
            $this.siblings('ul').slideDown();
        }
    }
});

    
/*--
    Hero Slider
--------------------------------------------*/
var heroSlider = $('.hero-slider-one');
heroSlider.slick({
    arrows: true,
    autoplay: false,
    autoplaySpeed: 5000,
    dots: true,
    pauseOnFocus: false,
    pauseOnHover: false,
    fade: true,
    infinite: true,
    slidesToShow: 1,
    prevArrow: '<button type="button" class="slick-prev"> <i class="ion-ios-arrow-thin-left"></i> </button>',
    nextArrow: '<button type="button" class="slick-next"><i class="ion-ios-arrow-thin-right"></i></button>',
    responsive: [
        {
          breakpoint: 767,
          settings: {
            dots: false,
          }
        }
    ]
});
/*--
    Hero Slider Two
--------------------------------------------*/
var heroSlider = $('.hero-slider-two');
heroSlider.slick({
    arrows: true,
    autoplay: false,
    autoplaySpeed: 5000,
    dots: false,
    pauseOnFocus: false,
    pauseOnHover: false,
    fade: true,
    infinite: true,
    slidesToShow: 1,
    prevArrow: '<button type="button" class="slick-prev"> <i class="ion-ios-arrow-thin-left"></i> </button>',
    nextArrow: '<button type="button" class="slick-next"><i class="ion-ios-arrow-thin-right"></i></button>',
    responsive: [
        {
          breakpoint: 767,
          settings: {
            dots: false,
          }
        }
    ]
});
/*--
    Product Slider
--------------------------------------------*/
var product_4 = $('.product-active-lg-4');
product_4.slick({
    dots: false,
    infinite: true,
    slidesToShow: 4,
    slidesToScroll: 1,
    autoplay: false,
    prevArrow: '<button type="button" class="slick-prev"> <i class="ion-ios-arrow-left"></i> </button>',
    nextArrow: '<button type="button" class="slick-next"><i class="ion-ios-arrow-right"></i></button>',
    responsive: [
        {
            breakpoint: 1199,
            settings: {
                slidesToShow: 3,
            }
        },
        {
            breakpoint: 991,
            settings: {
                slidesToShow: 2,
            }
        },
        {
            breakpoint: 767,
            settings: {
                slidesToShow: 2,
            }
        },
        {
            breakpoint: 480,
            settings: {
                slidesToShow: 2,
            }
        },
        {
            breakpoint: 479,
            settings: {
                slidesToShow: 1,
            }
        }
    ]
});
var product_two_row_4 = $('.product-two-row-4');
product_two_row_4.slick({
    dots: false,
    infinite: true,
    rows: 2,
    slidesToShow: 4,
    slidesToScroll: 1,
    autoplay: false,
    prevArrow: '<button type="button" class="slick-prev"> <i class="ion-ios-arrow-left"></i> </button>',
    nextArrow: '<button type="button" class="slick-next"><i class="ion-ios-arrow-right"></i></button>',
    responsive: [
        {
            breakpoint: 1199,
            settings: {
                slidesToShow: 3,
            }
        },
        {
            breakpoint: 991,
            settings: {
                slidesToShow: 2,
            }
        },
        {
            breakpoint: 767,
            settings: {
                slidesToShow: 2,
            }
        },
        {
            breakpoint: 480,
            settings: {
                slidesToShow: 2,
            }
        },
        {
            breakpoint: 479,
            settings: {
                slidesToShow: 1,
            }
        }
    ]
});
/*-- 
    Testimonial Slider 
-----------------------------*/
var testimonialSlider = $('.testimonial-slider');
testimonialSlider.slick({
    arrows: false,
    autoplay: true,
    autoplaySpeed: 7000,
    dots: true,
    pauseOnFocus: false,
    pauseOnHover: false,
    infinite: true,
    slidesToShow: 1,
    slidesToScoll: 1,
    prevArrow: '<button type="button" class="slick-prev"> <i class="ion-ios-arrow-thin-left"></i> </button>',
    nextArrow: '<button type="button" class="slick-next"><i class="ion-ios-arrow-thin-right"></i></button>'
});
   
  
/*--
    vertical-product-active
--------------------------------------*/
$('.vartical-product-active').slick({
    slidesToShow: 4,
    autoplay: false,
    vertical:true,
    verticalSwiping:true,
    slidesToScroll: 1,
    prevArrow:'<i class="ion-chevron-up arrow-prv"></i>',
    nextArrow:'<i class="ion-chevron-down arrow-next"></i>',
    button:false,
    responsive: [
        {
          breakpoint: 1024,
          settings: {
          slidesToShow: 4,
          }
        },
        { breakpoint: 991,
          settings: {
            slidesToShow: 3,
            vertical:false,
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 3,
            vertical:false,
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 3,
            vertical:false,
          }
        }
    ]
     
});	     
$('.vartical-product-active a').on('click', function () {
    $('.vartical-product-active a').removeClass('active');
});
   
    
/*--
    vertical-product-active
--------------------------------------*/
$('.horizantal-product-active').slick({
    slidesToShow: 4,
    autoplay: false,
    vertical:false,
    verticalSwiping:true,
    slidesToScroll: 1,
    prevArrow:'<i class="ion-chevron-left arrow-prv"></i>',
    nextArrow:'<i class="ion-chevron-right arrow-next"></i>',
    button:false,
    responsive: [
        {
          breakpoint: 1024,
          settings: {
          slidesToShow: 4,
          }
        },
        { breakpoint: 991,
          settings: {
            slidesToShow: 3,
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 3,
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 3,
          }
        }
    ]
     
});	     
$('.horizantal-product-active a').on('click', function () {
    $('.horizantal-product-active a').removeClass('active');
});
    
/*----------
    price-slider active
-------------------------------*/  
$( "#price-slider" ).slider({
   range: true,
   min: 0,
   max: 120,
   values: [ 20, 115 ],
   slide: function( event, ui ) {
        $( "#min-price" ).val('$' + ui.values[ 0 ] );
        $( "#max-price" ).val('$' + ui.values[ 1 ] );
     }
  });
  $( "#min-price" ).val('$' + $( "#price-slider" ).slider( "values", 0 ));   
  $( "#max-price" ).val('$' + $( "#price-slider" ).slider( "values", 1 )); 
    

/*--
    showlogin toggle function
--------------------------*/
$( '#showlogin' ).on('click', function() {
    $('#checkout-login' ).slideToggle(500);
}); 
    
/*--
    showcoupon toggle function
--------------------------*/
$( '#showcoupon' ).on('click', function() {
    $('#checkout-coupon' ).slideToggle(500);
});
    
/*--
    Checkout 
--------------------------*/
$("#chekout-box").on("change",function(){
    $(".account-create").slideToggle("100");
});
    
/*-- 
    Checkout 
---------------------------*/
$("#chekout-box-2").on("change",function(){
    $(".ship-box-info").slideToggle("100");
});    

/*--
    ScrollUp Active
-----------------------------------*/
$.scrollUp({
    scrollText: '<i class="ion-chevron-up"></i>',
    easingType: 'linear',
    scrollSpeed: 900,
    animation: 'fade'
});    
    
    
    
    
    
    
    
    
    
    
    
    
    
})(jQuery);

