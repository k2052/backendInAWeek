#= require jquery/dist/jquery.min.js
#= require jquery-waypoints/waypoints.js

$(document).ready ->
	$('#why').waypoint ->
		$('#menu').addClass('hide')

	$('#menu').hover ->
		$(this).removeClass('hide')

	$('.location').waypoint ->
		$('#menu li.current').removeClass('current')
		$("#menu-" + $(this).attr('id')).addClass('current')
