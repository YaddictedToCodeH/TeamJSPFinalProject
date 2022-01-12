$(function() {
	$(".subnav").hide();
	$(".navall").mouseover(function() {
		$(".subnav").stop().slideDown(300);
	}).mouseout(function() {
		$(".subnav").stop().slideUp(300);
	})
})