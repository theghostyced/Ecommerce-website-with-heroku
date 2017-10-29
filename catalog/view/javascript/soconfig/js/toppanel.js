$(document).ready(function(){
	// Menu header top 
	var duration = {headerTransform: 500},
	$window = $(window),
	$header = $("header"),
	$wrapper = $("#wrapper"),
	active = false,
	$switcher = $(".navbar-switcher", $header),
	headerStaticHeight = $header.outerHeight(),
	headerHeight = $header.outerHeight(),
	latent = $window.scrollTop() >= headerHeight;
	var $heightNew = $header.outerHeight();
	var windowWidth = window.innerWidth || document.documentElement.clientWidth; 
	var reculcPosHeader = function () {
    var headerCompact = false;
        if (!$header.hasClass("navbar-compact")) {
            headerCompact = true;
            $header.addClass("navbar-compact");
        }
        positionHeader = -$header.height() + 3;
        if (headerCompact) $header.removeClass("navbar-compact");
        if (parseInt($header.css("top")) < -1) $header.css("top", positionHeader + "px");
    };
	
	if (windowWidth > 1200 && !isiPhone()) {
		var CurrentScroll = 0;
		$window.scroll(function () {
			//Sets the current scroll position
           var NextScroll = $(this).scrollTop();
			if ( !latent && NextScroll < CurrentScroll) {
				$switcher.show();
				$header.addClass("navbar-compact");
				reculcPosHeader();
				$header.css("top", positionHeader + "px");

				//push the header giving it a top-margin
				$wrapper.css("margin-top", $header.height() + "px");

				latent = true;
				if (!$(".navbar-switcher-container").length){
					active = !active;
					$header.animate({
						top: active ? "0" : positionHeader
					}, {
						duration: duration.headerTransform
					})
				}
				
				
			} else if (latent && NextScroll >= CurrentScroll || NextScroll ==0  ) {
				
				$switcher.hide();
				//push the header giving it a top-margin
				$wrapper.css("margin-top", "0px");

				$header.stop().css("top", "").removeClass("navbar-compact").css("top", "0px");
				//$wrapper.stop().css("margin-top", "0px");
				$switcher.removeClass("active");
				active = false;
				latent = false;
			}
			//Updates scroll position
			CurrentScroll = NextScroll;  
		});
		
		$switcher.click(function () {
			active = !active;
			$switcher.toggleClass("active");
			$header.animate({
				top: active ? "0" : positionHeader
			}, {
				duration: duration.headerTransform
			})
		})
	
	}
	
});

function isiPhone() {
	return (
		(navigator.userAgent.toLowerCase().indexOf("iphone") > -1) ||
			(navigator.userAgent.toLowerCase().indexOf("ipod") > -1)
		);
}
