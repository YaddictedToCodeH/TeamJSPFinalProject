$(function() {

	$(".staff_c1").on("click", function() {
		$("#modalWrap").stop().fadeIn(200);
		$(".staff_c-detail1").stop().fadeIn(200);
		$("body").addClass("wrapper");
	})
	$(".staff_c2").on("click", function() {
		$("#modalWrap").stop().fadeIn(200);
		$(".staff_c-detail2").stop().fadeIn(200);
		$("body").addClass("wrapper");
	})
	$(".staff_c3").on("click", function() {
		$("#modalWrap").stop().fadeIn(200);
		$(".staff_c-detail3").stop().fadeIn(200);
		$("body").addClass("wrapper");
	})
	$(".staff_c4").on("click", function() {
		$("#modalWrap").stop().fadeIn(200);
		$(".staff_c-detail4").stop().fadeIn(200);
		$("body").addClass("wrapper");
	})

	$(".ico-close").on("click", function() {
		console.log("hi");
		$("#modalWrap").stop().fadeOut(200);
		$(".staff_c-modal").stop().fadeOut(200);
		$("body").removeClass("wrapper")
	})


})