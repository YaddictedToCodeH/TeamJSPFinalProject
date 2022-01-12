$(function() {
	$("#team_recordroom").hide();

	$("#recordroom-tabmenu > span").on("click", function() {
		$("recordroom-tabmenu > span").removeClass("active");
		$(this).addClass("active");
		$("#recordroom-table-wrap > div").stop().hide();
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).stop().fadeIn(200);
	})


	$(".sortMenu").on("click", function() {

		var base = $(this).text();

		$.ajax({
			type: "GET",
			url: "recordingroom2?base=" + base,
			cache: false,
			success: function(data) {
				console.log(data);
				console.dir(data);
				$("#ajaxWrap").html(data);
			}
		});
	})
})