$(document).ready(function() {
	//ul -> tabs -> li에 있는 걸 클릭하면
	$('ul.tabs li').click(function() {
		var tab_id = $(this).attr('data-tab');
		//현페이지가 사라지고
		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');
		//클릭한 페이지가 생긴다. ? 
		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})

});