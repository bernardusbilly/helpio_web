$(window).load(function() {
	$('.loading-page').fadeOut();
});

$(document).ready(function() {

	/* Parallax Effect */

	$('.parallax').parallax();

	/***** Map *****/

	$('.map-intro-wrapper').click(function() {
		var x = event.layerX;
		var y = event.layerY;
		var pin = "<img src='img/icon/drop-pin.png' style='position: absolute; top:"+(y-35)+"px; left:"+(x-15)+"px;'></div>";
		console.log("position: " + x +"px "+ y + "px");
		$('.map-intro-bg').append(pin);
	});

	/***************** Waypoints ******************/

	$('.wp1').waypoint(function() {
		$('.wp1').addClass('animated fadeInDown');
	}, {
		offset: '75%'
	});
	$('.wp2').waypoint(function() {
		$('.wp2').addClass('animated fadeInDown');
	}, {
		offset: '75%'
	});
	$('.wp3').waypoint(function() {
		$('.wp3').addClass('animated bounceInDown');
	}, {
		offset: '75%'
	});
	$('.wp4').waypoint(function() {
		$('.wp4').addClass('animated fadeInDown');
	}, {
		offset: '75%'
	});

	/***************** Flickity ******************/

	$('#showcaseSlider').flickity({
		cellAlign: 'left',
		contain: true,
		prevNextButtons: false,
		imagesLoaded: true,
		autoPlay: true,
		pageDots: false,
		wrapAround: true
	});
	$('#testimonySlider').flickity({
		cellAlign: 'left',
		contain: true,
		prevNextButtons: true,
		imagesLoaded: true,
		autoPlay: true,
		pageDots: false,
		wrapAround: true
	});

	/***************** Fancybox ******************/

	$(".youtube-media").on("click", function(e) {
		var jWindow = $(window).width();
		if (jWindow <= 768) {
			return;
		}
		$.fancybox({
			href: this.href,
			padding: 4,
			type: "iframe",
			'href': this.href.replace(new RegExp("watch\\?v=", "i"), 'v/'),
		});
		return false;
	});

	/** info-pin **/

	$('.red-indicator').hover(function() {
		$('.pin-info-1').toggle();
		$('.pin-info-1').addClass('animated bounceInRight');
	});
	$('.yellow-indicator').hover(function() {
		$('.pin-info-2').toggle();
		$('.pin-info-2').addClass('animated bounceInRight');
	})
	$('.blue-indicator').hover(function() {
		$('.pin-info-3').toggle();
		$('.pin-info-3').addClass('animated bounceInRight');
	})
	$('.pin-indicator').hover(function() {
		$('.pin-info-4').toggle();
		$('.pin-info-4').addClass('animated bounceInRight');
	})
});

$(document).ready(function() {
	$("a.single_image").fancybox({
		padding: 4,
	});
});

/***************** Nav Transformicon ******************/

/* When user clicks the Icon */
$(".nav-toggle").click(function() {
	$(this).toggleClass("active");
	$(".overlay-boxify").toggleClass("open");
});

/* When user clicks a link */
$(".overlay ul li a").click(function() {
	$(".nav-toggle").toggleClass("active");
	$(".overlay-boxify").toggleClass("open");
});

/* When user clicks outside */
$(".overlay").click(function() {
	$(".nav-toggle").toggleClass("active");
	$(".overlay-boxify").toggleClass("open");
});

/***************** Smooth Scrolling ******************/

$('a[href*=#]:not([href=#])').click(function() {
	if (location.pathname.replace(/^\//, '') === this.pathname.replace(/^\//, '') && location.hostname === this.hostname) {

		var target = $(this.hash);
		target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
		if (target.length) {
			$('html,body').animate({
				scrollTop: target.offset().top
			}, 2000);
			return false;
		}
	}
});

/***************** Youtube API **********************/

var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;
function onYouTubeIframeAPIReady() {
	player = new YT.Player('yt-player', {
	    height: '400px',
	    width: '100%',
	    videoId: 'jofNR_WkoCE',
	    playerVars: {
	      'controls': 0,
	      'rel': 0,
	      'showinfo': 0,
	      'modestbranding': 1,
	    },
	});
}
