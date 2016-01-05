$(document).ready(function() {

	/**
		Console controller
	*/
	var debug = false;

	/**
		Initializer
	*/
	$('.carousel').slick({
		dots: true,
		arrows: false,
		infinite: true,
		slidesToShow: 1,
  		slidesToScroll: 1,
  		lazyLoad: 'ondemand',
	});

	/**
		Map
	*/

	/**
		Google map and info-helpio sizing
	*/
	var winHeight = $(window).height();
	// console.log(winHeight);
	$('.scroll-wrapper').height(winHeight - 100);
	$('iframe').height(winHeight-42);

	$(window).resize(function() {
		winHeight = $(window).height();
		// console.log(winHeight);
		$('.scroll-wrapper').height(winHeight - 100);
		$('iframe').height(winHeight-42);
	});

	/**
		Popups
	*/

	$('.info-wrapper').hide();

	// temporary 
	$('.search-bar').click(function(){
		$('.info-wrapper').toggle();
		$('.profile-expand').hide();
		$('.notification-expand').hide();
		$('.message-expand').hide();
	});

	$('.profile-wrapper-header').click(function() {
		$('.info-wrapper').hide();
		$('.profile-expand').toggle();
		$('.notification-expand').hide();
		$('.message-expand').hide();
	});

	$('.profile-close-button').click(function() {
		$('.profile-expand').hide();
	});

	$('img.notification').click(function() {
		$('.info-wrapper').hide();
		$('.profile-expand').hide();
		$('.notification-expand').toggle();
		$('.message-expand').hide();
	});

	$('img.message').click(function() {
		$('.info-wrapper').hide();
		$('.profile-expand').hide();
		$('.notification-expand').hide();
		$('.message-expand').toggle();
	});

	/**
		Comment: Like
	*/
	$('.comment-on').click(function() {
		$('.comment-on').css("display", "none");
		$('.comment-off').css("display", "block");
		console.log("asd");
	});
	$('.comment-off').click(function() {
		$('.comment-off').css("display", "none");
		$('.comment-on').css("display", "block");
	});
	// $('.comment-heart').click(function() {
	// 	var src = ($(this).attr('src') === "<img src='build/img/heart-on.png'/>")
	// 	? "build/img/heart-off.png"
	// 	: "build/img/heart-on.png";
	// 	$(this).attr('src', src);
	// });

	/**
		Profile
	*/
	$('.profile-background-photo').hover(function() {
		$('.profile-edit-button').css("display", "block");
		$('.profile-close-button').css("display", "block");
	}, function() {
		$('.profile-edit-button').css("display", "none");
		$('.profile-close-button').css("display", "none");
	});

	$('.profile-expand-photo').hover(function() {
		$('.profile-wrapper-edit').css("display", "block");
	}, function() {
		$('.profile-wrapper-edit').css("display", "none");
	});

	$('.profile-close-button').hover(function() {
		$('.profile-close-button').css("display", "block");
		$('.profile-edit-button').css("display", "block");
	});

	$('.profile-edit-button').hover(function() {
		$('.profile-edit-button').css("display", "block");
		$('.profile-close-button').css("display", "block");
	});

	$('.profile-photo-edit').hover(function() {
		$('.profile-wrapper-edit').css("display", "block");
	}, function() {
		$('.profile-wrapper-edit').css("display", "none");
	});


	/**
		Message
	 */
	 $('.unread').click(function() {
	 	$(this).removeClass("unread");
	 	checkUnread();
	 });

	 $('.wrapper-message').click(function() {
	 	$('.message-list').hide();
	 	$('.message-load-more').hide();
	 	$('.message-detail').show();
	 	// $('.message-detail').scrollTop(200);
	 });

	 $('.message-back').click(function() {
	 	$('.message-detail').hide();
	 	$('.message-list').show();
	 	$('.message-load-more').show();
	 });

	 /**
	  * Icon on top right header
	 */
	 function checkUnread() {
		 if ($('.notification-content').hasClass("unread")) {
		 	$('.additional-info img.notification').attr("src", "build/img/icons/notif-on.png");
		 } else {
		 	$('.additional-info img.notification').attr("src", "build/img/icons/notif-off.png");
		 }
		 if ($('.wrapper-message').hasClass("unread")) {
		 	$('.additional-info img.message').attr("src", "build/img/icons/mail-on.png");
		 } else {
		 	$('.additional-info img.message').attr("src", "build/img/icons/mail-off.png");
		 }
	}

	 /**
	  * Content
	  */
	 $('#comment-button').click(function() {
	 	var content = $('.comment-input').val();
	 	var str = '<div class="content-message-wrapper">\
						<div class="col-lg-3">\
							<img src="build/img/profile.png" class="width-full"/>\
						</div>\
						<div class="col-lg-9"><div class="row"><div class="comment-name">Jessica Miller</div><div class="comment-message">\
						'+ content +'\
						</div><div class="comment-time">Just now</div></div></div>\
						<div class="comment-like">\
							<img src="build/img/heart-off.png" class="comment-off"/>\
							<img src="build/img/heart-on.png" class="comment-on"/>\
						</div>\
					</div>'
		$('#content-comment').append(str);
		location.hash = "#comment-new";
	 });
});