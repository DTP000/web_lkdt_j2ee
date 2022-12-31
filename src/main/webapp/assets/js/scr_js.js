/**
 * 
 */
 
 $(document).ready(function() {
    $('#new-product .owl-carousel').owlCarousel({
        // loop:true,
        margin:0,
        nav:true,
        // items: 2,
        mouseDrag: true,
        touchDrag: true,
        pullDrag: true,
        dots: false,
        responsive:{
            0:{
                items:1
            },
            400: {
                items:2
            },
            600:{
                items:3
            },
            1000:{
                items:4
            }
        }
    });
    $('#crs-owl-end .owl-carousel').owlCarousel({
        // loop:true,
        margin:0,
        nav:true,
        // items: 2,
        mouseDrag: true,
        touchDrag: true,
        pullDrag: true,
        dots: false,
        responsive:{
            0:{
                items:1
            },
            400: {
                items:2
            },
            600:{
                items:2
            },
            1000:{
                items:3
            }
        }
    });
	$(document).ready(function() {
	    $('#cam-ket .owl-carousel').owlCarousel({
	        // loop:true,
	        margin:0,
	        // nav:true,
	        // items: 2,
	        mouseDrag: true,
	        touchDrag: true,
	        pullDrag: true,
	        dots: false,
	        responsive:{
	            0:{
	                items:1
	            },
	            400: {
	                items:2
	            },
	            600:{
	                items:2
	            },
	            1000:{
	                items:3
	            }
	        }
	    })
	}); 
});