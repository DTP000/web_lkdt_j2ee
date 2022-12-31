<%@ page language="java" contentType="text/html"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

<script>
$(document).ready(function () {
    $('#new-product .owl-carousel').owlCarousel({
        // loop:true,
        margin: 0,
        nav: true,
        // items: 2,
        mouseDrag: true,
        touchDrag: true,
        pullDrag: true,
        dots: false,
        responsive: {
            0: {
                items: 1
            },
            400: {
                items: 2
            },
            600: {
                items: 3
            },
            1000: {
                items: 4
            }
        }
    });
    $('#cam-ket .owl-carousel').owlCarousel({
        // loop:true,
        margin: 0,
        // nav:true,
        // items: 2,
        mouseDrag: true,
        touchDrag: true,
        pullDrag: true,
        dots: false,
        responsive: {
            0: {
                items: 1
            },
            400: {
                items: 2
            },
            600: {
                items: 2
            },
            1000: {
                items: 3
            }
        }
    });
});
</script>