$(document).ready(function() {

	/**
		Console controller
	*/
	var debug = false;

	/**
		Initializer - No longer used
	*/
	/*$('.carousel').slick({
		dots: true,
		arrows: false,
		infinite: true,
		slidesToShow: 1,
  		slidesToScroll: 1,
  		lazyLoad: 'ondemand',
	});*/

	/**
		Escape Button
	*/
	$(document).keyup(function(e) {
	     if (e.keyCode == 27) {
	        $('.info-wrapper').hide();
			$('.profile-expand').hide();
			$('.notification-expand').hide();
			$('.message-expand').hide();
	    }
	});

	/**
		Search
	*/
	$(".search-bar").keyup(function(event){
	    if(event.keyCode == 13){
	        console.log('search clicked');
	    }
	});


	/** 
		Api and friends
	*/
	var apiUrl = "http://140.112.7.222:3030";

	// assume already logged in
	var url = "/api/pin/";
	var temporaryPin = '[{"id":1,"uid":2,"title":"Title goes here...","lon":-118.252274,"lat":34.061638,"img":"1448556131_pic.jpg","created_at":"2015-11-26T16:42:11.875Z","updated_at":"2015-11-26T16:42:11.875Z","nickname":"glorio","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":2,"uid":2,"title":"Lets have some bbq!","lon":-122.251358,"lat":37.900303,"img":"1448556380_pic.jpg","created_at":"2015-11-26T16:46:21.178Z","updated_at":"2015-11-26T16:46:21.178Z","nickname":"glorio","prof_img":null,"comment_count":1,"like_count":0,"liked":0},{"id":3,"uid":2,"title":"Snake","lon":-122.278481,"lat":37.897266,"img":"1448556547_asset.JPG","created_at":"2015-11-26T16:49:08.042Z","updated_at":"2015-11-26T16:49:08.042Z","nickname":"glorio","prof_img":null,"comment_count":1,"like_count":1,"liked":0},{"id":4,"uid":2,"title":"test inbox 3","lon":121.53582,"lat":25.029514,"img":null,"created_at":"2015-12-02T16:26:28.775Z","updated_at":"2015-12-02T16:26:28.775Z","nickname":"glorio","prof_img":null,"comment_count":6,"like_count":0,"liked":0},{"id":5,"uid":2,"title":"85 Bakery 50% off!","lon":-122.268082,"lat":37.871918,"img":null,"created_at":"2015-12-04T23:51:47.117Z","updated_at":"2015-12-04T23:51:47.117Z","nickname":"glorio","prof_img":null,"comment_count":8,"like_count":1,"liked":0},{"id":6,"uid":2,"title":"Free cupcakes samplers!","lon":-122.265594,"lat":37.876472,"img":null,"created_at":"2015-12-04T23:54:39.965Z","updated_at":"2015-12-04T23:54:39.965Z","nickname":"glorio","prof_img":null,"comment_count":4,"like_count":1,"liked":0},{"id":7,"uid":2,"title":"Pop up performance by UC choirs club!","lon":-122.262947,"lat":37.870655,"img":null,"created_at":"2015-12-04T23:55:48.459Z","updated_at":"2015-12-04T23:55:48.459Z","nickname":"glorio","prof_img":null,"comment_count":1,"like_count":1,"liked":0},{"id":8,"uid":2,"title":"Hiring cooking assistant! ","lon":-122.265869,"lat":37.86607,"img":null,"created_at":"2015-12-04T23:56:59.124Z","updated_at":"2015-12-04T23:56:59.124Z","nickname":"glorio","prof_img":null,"comment_count":3,"like_count":1,"liked":0},{"id":9,"uid":2,"title":"Someones car got broken into :(","lon":-122.268478,"lat":37.874039,"img":null,"created_at":"2015-12-04T23:58:47.148Z","updated_at":"2015-12-04T23:58:47.148Z","nickname":"glorio","prof_img":null,"comment_count":2,"like_count":1,"liked":0},{"id":10,"uid":2,"title":"Found a blue binder here PM me if its yours ;)","lon":-122.265053,"lat":37.871433,"img":null,"created_at":"2015-12-05T00:00:05.997Z","updated_at":"2015-12-05T00:00:05.997Z","nickname":"glorio","prof_img":null,"comment_count":4,"like_count":0,"liked":0},{"id":11,"uid":2,"title":"The line here is tremendously long!","lon":-122.266685,"lat":37.867672,"img":null,"created_at":"2015-12-05T00:01:17.662Z","updated_at":"2015-12-05T00:01:17.662Z","nickname":"glorio","prof_img":null,"comment_count":7,"like_count":0,"liked":0},{"id":12,"uid":2,"title":"Free one hour bike ride :)","lon":-122.266487,"lat":37.872437,"img":null,"created_at":"2015-12-05T00:09:30.639Z","updated_at":"2015-12-05T00:09:30.639Z","nickname":"glorio","prof_img":null,"comment_count":1,"like_count":1,"liked":0},{"id":13,"uid":2,"title":"Free 1 day trial! ","lon":-122.268669,"lat":37.870796,"img":null,"created_at":"2015-12-05T00:14:47.665Z","updated_at":"2015-12-05T00:14:47.665Z","nickname":"glorio","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":14,"uid":2,"title":"Free up size today! :)","lon":-122.266525,"lat":37.873478,"img":null,"created_at":"2015-12-05T00:20:59.938Z","updated_at":"2015-12-05T00:20:59.938Z","nickname":"glorio","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":15,"uid":2,"title":"Randy is here","lon":-122.26696,"lat":37.869221,"img":null,"created_at":"2015-12-18T17:39:00.804Z","updated_at":"2015-12-18T17:39:00.804Z","nickname":"glorio","prof_img":null,"comment_count":1,"like_count":0,"liked":0},{"id":16,"uid":2,"title":"Sergik","lon":-122.274429,"lat":37.873386,"img":null,"created_at":"2015-12-21T23:18:37.897Z","updated_at":"2015-12-21T23:18:37.897Z","nickname":"glorio","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":17,"uid":5,"title":"Title goes here...","lon":-122.290359,"lat":37.873886,"img":"1450752955_pic.jpg","created_at":"2015-12-22T02:55:56.613Z","updated_at":"2015-12-22T02:55:56.613Z","nickname":"angela","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":18,"uid":5,"title":"Milkent is here hahaha","lon":-122.270943,"lat":37.873188,"img":"1450754471_asset.PNG","created_at":"2015-12-22T03:21:11.984Z","updated_at":"2015-12-22T03:21:11.984Z","nickname":"angela","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":19,"uid":5,"title":"Fire alarm went off!!!","lon":-122.273293,"lat":37.871719,"img":null,"created_at":"2015-12-23T00:24:54.251Z","updated_at":"2015-12-23T00:24:54.251Z","nickname":"angela","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":20,"uid":5,"title":"Friday sale","lon":-73.983162,"lat":40.761593,"img":null,"created_at":"2016-01-01T00:34:58.823Z","updated_at":"2016-01-01T00:34:58.823Z","nickname":"angela","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":21,"uid":9,"title":"","lon":-122.27339431643485,"lat":37.86637479736951,"img":null,"created_at":"2016-01-07T23:49:29.662Z","updated_at":"2016-01-07T23:49:29.662Z","nickname":"papa","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":22,"uid":9,"title":"asdasdasd","lon":31.0,"lat":-122.0,"img":null,"created_at":"2016-01-07T23:51:54.357Z","updated_at":"2016-01-07T23:51:54.357Z","nickname":"papa","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":23,"uid":9,"title":"","lon":-122.2697126492858,"lat":37.86685069385154,"img":null,"created_at":"2016-01-07T23:56:42.544Z","updated_at":"2016-01-07T23:56:42.544Z","nickname":"papa","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":24,"uid":9,"title":"ghhhhh","lon":-122.27047808468342,"lat":37.85449491720207,"img":null,"created_at":"2016-01-07T23:59:12.334Z","updated_at":"2016-01-07T23:59:12.334Z","nickname":"papa","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":25,"uid":9,"title":"","lon":-122.27117478847504,"lat":37.87653126443695,"img":null,"created_at":"2016-01-08T00:08:51.348Z","updated_at":"2016-01-08T00:08:51.348Z","nickname":"papa","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":26,"uid":9,"title":"bububu","lon":-122.27039694786073,"lat":37.859100715666166,"img":null,"created_at":"2016-01-08T00:12:59.089Z","updated_at":"2016-01-08T00:12:59.089Z","nickname":"papa","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":27,"uid":9,"title":"bro","lon":-122.26329747587442,"lat":37.8631593717522,"img":null,"created_at":"2016-01-08T00:18:47.515Z","updated_at":"2016-01-08T00:18:47.515Z","nickname":"papa","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":28,"uid":9,"title":"How are you guys?","lon":-122.26035274565218,"lat":37.867152163948255,"img":null,"created_at":"2016-01-08T00:31:56.227Z","updated_at":"2016-01-08T00:31:56.227Z","nickname":"papa","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":29,"uid":11,"title":"kadal","lon":-122.28191167116164,"lat":37.869950298125644,"img":null,"created_at":"2016-01-08T02:00:01.000Z","updated_at":"2016-01-08T02:00:01.000Z","nickname":"kelapa","prof_img":null,"comment_count":0,"like_count":0,"liked":0},{"id":30,"uid":9,"title":"devina bubuk disinj","lon":-122.27565106004475,"lat":37.871160884350246,"img":null,"created_at":"2016-01-08T03:41:38.683Z","updated_at":"2016-01-08T03:41:38.683Z","nickname":"papa","prof_img":null,"comment_count":0,"like_count":0,"liked":0}]';
	var temporaryJsonPin = JSON.parse(temporaryPin);

	var makePostRequest = function(url, data, onSuccess, onFailure) {
        $.ajax({
            type: 'POST',
            url: apiUrl + url,
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: onSuccess,
            error: onFailure
        });
    };

	var makeGetRequest = function(url, onSuccess, onFailure) {
       	$.ajax({
			type: 'GET',
			url: apiUrl + url,
			dataType: "json",
			success: onSuccess,
			error: onFailure
		});
	};


	/** 
		Pins and Friends
	*/
	var markers = [];
	var bouncingMarker = new google.maps.Marker();

	var displayPins = function(data) {
		for (var i = 0; i < data.length; i++) {
			dropPinOnMap(data[i]);
      	}
	}

	var dropPinOnMap = function(data) {
		// Pin types
		var icon = '/assets/icon/drop-pin.png';
		var score = data.like_count*2 + data.comment_count*3;
		if (score < 10) {
			icon = '/assets/icon/blueTwing.png';
		} else if (score < 25) {
			icon = '/assets/icon/yellowTwing.png';
		} else {
			icon = '/assets/icon/redTwing.png';
		}
		
		var iconImage = {
		    url: icon,
		    origin: new google.maps.Point(0, 0),
		    anchor: new google.maps.Point(16, 45),
		    scaledSize: new google.maps.Size(32, 50)
		};

		var marker = new google.maps.Marker({
		    position: new google.maps.LatLng(data.lat, data.lon),
		    map: map,
		    title: data.title,

		    // Pin's info onclick
		    icon: iconImage,
		    nickname: data.nickname,
		    id: data.id,
		    lat: data.lat,
		    lon: data.lon,
		    comment_count: data.comment_count,
		    like_count: data.like_count,
		    img: data.img,
		    prof_img: data.prof_img,
		    created_at: data.created_at,
		    animation: google.maps.Animation.DROP,
		});

		markers.push(marker);

		marker.addListener('click', function() {

			// Turn of other bouncing marker
			if ((bouncingMarker !== marker) && (bouncingMarker.getAnimation() !== null)) {
				bouncingMarker.setAnimation(null);
			}

			marker.setAnimation(google.maps.Animation.BOUNCE);
			bouncingMarker = marker;
			
			// Information for each marker
			$('#content-owner-name').html(marker.nickname);
			$('#content-text').html(marker.title);
			$('#content-time').html(data.created_at.substring(0,10));

			// Pin's owner's image
			if (marker.prof_img == null) {
				$('#content-owner-photo').attr("src", "/assets/stock/default_profile_picture.png");	
			} else {
				$('#content-owner-photo').attr("src", "http://140.112.7.222:3030/images/upload/resize/" + marker.prof_img);
			}

			// Pin's photo
			if (marker.img == null) {
				$('.content-image-wrapper').hide();
			} else {
				// Check original size of the image
				$("<img/>").attr("src", "http://140.112.7.222:3030/images/upload/resize/" + marker.img)
			    .load(function() {
			        if (this.width < 100) {
						$('#content-image').removeClass("image-full");
						$('#content-image').addClass("image-center");
					} else {
						$('#content-image').removeClass("image-center");
						$('#content-image').addClass("image-full");
					}
			    });

				$('.content-image-wrapper').show();
				$('#content-image').attr("src", "http://140.112.7.222:3030/images/upload/resize/" + marker.img);
			}

			// Pin's number of comment and like
			if (marker.comment_count <= 1) {
				$('#content-comment').html(marker.comment_count + " comment");
			} else {
				$('#content-comment').html(marker.comment_count + " comments");
			}

			if (marker.like_count <= 1) {
				$('#content-like').html(marker.like_count + " like");	
			} else {
				$('#content-like').html(marker.like_count + " likes");
			}

			// Location Request
			$.ajax({
				type: 'GET',
				url: "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + marker.lat + "," + marker.lon + "&key=AIzaSyD30pHRGSlQYv5pWSEXDveA2DuPz001uK8",
				dataType: "json",
				success: function(data) {
					$('#content-loc').html(data.results[0].formatted_address);
				},
				error: function() {
					if (debug == true) {
						console.log(data);
					}
				}
			});

			// Comments Request
			$.ajax({
				type: 'GET',
				url: "http://140.112.7.222:3030/api/pin/" + marker.id + "/comment",
				dataType: "json",
				success: function(data) {
					if (debug == true) {
						console.log(data);
					}
				},
				error: function(data) {
					if (debug == true) {
						console.log(data);
					}
				}
			});

			// Fake Data for Comments
			var temporaryComment = '[{"id":3,"pin_id":5,"uid":2,"like_count":0,"created_at":"2015-12-04T23:52:13.884Z","updated_at":"2015-12-04T23:52:13.884Z","content":"how long will this promotion last?","nickname":"glorio","prof_img":null,"liked":0},{"id":4,"pin_id":5,"uid":2,"like_count":0,"created_at":"2015-12-04T23:52:46.181Z","updated_at":"2015-12-04T23:52:46.181Z","content":"Im going to check it out after my class","nickname":"glorio","prof_img":null,"liked":0},{"id":5,"pin_id":5,"uid":2,"like_count":0,"created_at":"2015-12-04T23:53:15.148Z","updated_at":"2015-12-04T23:53:15.148Z","content":"cant wait to grab my favorite bread :)","nickname":"glorio","prof_img":null,"liked":0},{"id":6,"pin_id":5,"uid":2,"like_count":0,"created_at":"2015-12-04T23:53:32.565Z","updated_at":"2015-12-04T23:53:32.565Z","content":"im sure people will love it","nickname":"glorio","prof_img":null,"liked":0},{"id":7,"pin_id":5,"uid":2,"like_count":0,"created_at":"2015-12-04T23:53:41.404Z","updated_at":"2015-12-04T23:53:41.404Z","content":"is this for real?","nickname":"glorio","prof_img":null,"liked":0},{"id":8,"pin_id":5,"uid":2,"like_count":0,"created_at":"2015-12-04T23:53:52.859Z","updated_at":"2015-12-04T23:53:52.859Z","content":"both drinks and breads?","nickname":"glorio","prof_img":null,"liked":0},{"id":9,"pin_id":5,"uid":2,"like_count":0,"created_at":"2015-12-04T23:54:05.287Z","updated_at":"2015-12-04T23:54:05.287Z","content":"fantastic!","nickname":"glorio","prof_img":null,"liked":0},{"id":10,"pin_id":5,"uid":2,"like_count":0,"created_at":"2015-12-04T23:54:09.201Z","updated_at":"2015-12-04T23:54:09.201Z","content":"love!","nickname":"glorio","prof_img":null,"liked":0}]';
			var temporaryJsonComment = JSON.parse(temporaryComment);
			$('#content-comment-container').html("");

			for (var i = 0; i < temporaryJsonComment.length; i++) {
				// Comment's owner photo
				if (temporaryJsonComment[i].prof_img == null) {
					var photo = '<img src="/assets/stock/default_profile_picture.png" class="width-full"/>';
				} else {
					var photo = '<img src="http://140.112.7.222:3030/images/upload/resize/"' + temporaryJsonComment.prof_img + '" class="width-full">';
				}

				// Construct a comment
				var comment = 	'<div class="content-message-wrapper">\
									<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">\
										' + photo + '\
									</div>\
									<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">\
										<div class="row">\
											<div class="comment-name">\
												' + temporaryJsonComment[i].nickname + '\
											</div>\
											<div class="comment-message">\
												' + temporaryJsonComment[i].content + '\
											</div>\
											<div class="comment-time">\
												' + temporaryJsonComment[i].created_at + '\
											</div>\
											<div class="comment-like">\
												<img src="/assets/icon/heart-off.png" class="comment-off"/>\
												<img src="/assets/icon/heart-on.png" class="comment-on"/>\
											</div>\
										</div>\
									</div>\
								</div>';
				$('#content-comment-container').append(comment);
	      	}

	      	// Only show pin's information
			$('.info-wrapper').show();
			$('.profile-expand').hide();
			$('.notification-expand').hide();
			$('.message-expand').hide();
		});
	}

	// makeGetRequest(url, displayPins, onFailure);

	/**
		Map Section
		Berkeley location: 37.8658482,-122.2685509
	*/
	var location = new google.maps.LatLng(37.8658482,-122.2685509);

	var mapOptions = {
		center: location,
		zoom: 14,
		disableDefaultUI: true,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	var map = new google.maps.Map(document.getElementById("map"), mapOptions);
	
	map.addListener('click', function() {
		// hide infos
		$('.info-wrapper').hide();
		$('.profile-expand').hide();
		$('.notification-expand').hide();
		$('.message-expand').hide();

		// turn off animation
		if (bouncingMarker.getAnimation() !== null) {
			bouncingMarker.setAnimation(null);
		}
	});

	// Create the search box and link it to the UI element.
	var input = document.getElementById('search-bar');
	var searchBox = new google.maps.places.SearchBox(input);

	// Bias the SearchBox results towards current map's viewport.
	map.addListener('bounds_changed', function() {
	searchBox.setBounds(map.getBounds());
	});

	// [START region_getplaces]
	// Listen for the event fired when the user selects a prediction and retrieve
	// more details for that place.
	searchBox.addListener('places_changed', function() {
	    var places = searchBox.getPlaces();

	    if (places.length == 0) {
	      return;
	    }

	    // Clear out the old markers.
	    markers.forEach(function(marker) {
	    	marker.setMap(null);
	    });
	    markers = [];

	    // For each place, get the icon, name and location.
	    var bounds = new google.maps.LatLngBounds();
	    places.forEach(function(place) {
			/*var icon = {
				url: place.icon,
				size: new google.maps.Size(71, 71),
				origin: new google.maps.Point(0, 0),
				anchor: new google.maps.Point(17, 34),
				scaledSize: new google.maps.Size(25, 25)
			};

			// Create a marker for each place.
				markers.push(new google.maps.Marker({
				map: map,
				icon: icon,
				title: place.name,
				position: place.geometry.location
			}));*/

			if (place.geometry.viewport) {
				// Only geocodes have viewport.
				bounds.union(place.geometry.viewport);
			} else {
				bounds.extend(place.geometry.location);
			}
	    });
	    map.fitBounds(bounds);
	});
	// [END region_getplaces]

	displayPins(temporaryJsonPin);

	/**
		Google map and info-helpio sizing
	*/
	var winHeight = $(window).height();
	// console.log(winHeight);
	$('.scroll-wrapper').css("max-height", winHeight - 100);
	$('.message-expand').css("max-height", winHeight - 100);
	$('.message-scroll-wrapper').css("max-height", winHeight - 100);
	$('.notification-expand').css("max-height", winHeight - 100);
	$('.notification-scroll-wrapper').css("max-height", winHeight - 100);

	$(window).resize(function() {
		winHeight = $(window).height();
		$('.scroll-wrapper').css("max-height", winHeight - 100);
		$('.message-expand').css("max-height", winHeight - 100);
		$('.message-scroll-wrapper').css("max-height", winHeight - 100);
		$('.notification-expand').css("max-height", winHeight - 100);
		$('.notification-scroll-wrapper').css("max-height", winHeight - 100);
	});

	/**
		Popups
	*/
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
	});
	$('.comment-off').click(function() {
		$('.comment-off').css("display", "none");
		$('.comment-on').css("display", "block");
	});

	/**
		Profile
	*/
	$('.profile-background-photo').hover(function() {
		$('.profile-edit-button').show();
		$('.profile-close-button').show();
	}, function() {
		$('.profile-edit-button').hide();
		$('.profile-close-button').hide();
	});

	$('.profile-close-button').hover(function() {
		$('.profile-close-button').show();
		$('.profile-edit-button').show();
	});

	$('.profile-edit-button').hover(function() {
		$('.profile-edit-button').show();
		$('.profile-close-button').show();
	});

	$('.profile-expand-photo').hover(function() {
		$('.profile-wrapper-edit').show();
	}, function() {
		$('.profile-wrapper-edit').hide();
	});

	$('.profile-photo-edit').hover(function() {
		$('.profile-wrapper-edit').show();
	}, function() {
		$('.profile-wrapper-edit').hide();
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
	});

	$('.message-back').click(function() {
	 	$('.message-detail').hide();
	 	$('.message-list').show();
	 	$('.message-load-more').show();
	});

	/**
		Icon on top right header
	*/
	function checkUnread() {
		if ($('.notification-content').hasClass("unread")) {
			$('.notification-bubble').show();
		} else {
			$('.notification-bubble').hide();
		}
		if ($('.wrapper-message').hasClass("unread")) {
			$('.message-bubble').show();
		} else {
			$('.message-bubble').hide();
		}
	}

	/**
		Add new Comment
	*/
	$('#comment-button').click(function() {
	 	var content = $('.comment-input').val();
	 	$('.comment-input').val("");
	 	var str = '<div class="content-message-wrapper">\
						<div class="col-lg-3">\
							<img src="build/img/profile.png" class="width-full"/>\
						</div>\
						<div class="col-lg-9"><div class="row"><div class="comment-name">Jessica Miller</div><div class="comment-message">\
						'+ content +'\
						</div><div class="comment-time">Just now</div></div></div>\
						<div class="comment-like">\
							<img src="/assets/icon/heart-off.png" class="comment-off"/>\
							<img src="/assets/icon/heart-on.png" class="comment-on"/>\
						</div>\
					</div>'
		$('#content-comment-container').append(str);
		location.hash = "#comment-new";
		history.pushState('', document.title, window.location.pathname);
	});
});
