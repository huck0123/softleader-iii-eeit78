<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--      <link rel="icon" href="../../favicon.ico"> -->
<title>Insert title here</title>

<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="/softleader-iii-eeit78/css/test.css">
<style>
.section {
	height: 1200px;
}
</style>


</head>

<body id="body">


<div>
	<div class="cover-wrapper">
		<div class="cover-wrapper-inner">
			<h1>aaaaaaaaaa</h1>
			<h1>bbbbbbbbbbb</h1>
		</div>
	</div>





	<div class="normal-wrapper">
		<div class="normal-wrapper-inner">
			<h1>fffffffffffffff</h1>
			<h1>ggggggggggg</h1>
		</div>
	</div>

	<div class="normal-wrapper">
		<div class="normal-wrapper-inner">
			<h1>hhhhhhhhhhhhhhhh</h1>
			<h1>rrrrrrrrrrr</h1>
		</div>
	</div>

</body>

<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script>
	// function for popping out head
	$(document)
			.ready(
					function() {
						$(window).scroll(function() {
							if ($(window).scrollTop() > 99) {
								console.log($(window).scrollTop());
								$('#headerFixed').slideDown();
								$('#header').fadeOut();
							} else {
								console.log($(window).scrollTop());
								$('#headerFixed').slideUp();
								$('#header').fadeIn(800);
							}
						});

						// function for moving smoothly to anchor
						$('a[href^="#"]').click(
								function() {
									$('html, body').animate(
											{
												scrollTop : $(
														$.attr(this, 'href'))
														.offset().top
											}, 600, 'easeInOutExpo');
									return false;
								});

						// function for ajax to dynamically get raisers' logo,
						// not finished yet
						function getRaisers() {

							$
									.getJSON(
											'',
											{},
											function(data) {
												$('#showColumn').empty();
												$(data)
														.each(
																function(index,
																		value) {
																	var child = $('<a></a>');
																	child
																			.attr(
																					"href",
																					"#");
																	child
																			.text(value.id
																					+ ", "
																					+ value.name);
																	child
																			.on(
																					'click',
																					function() {
																						goDetail(value)
																					});
																	var imgchild = $('<img src="data:image/jpeg;base64,"'+ value.image  +'/>');
																	imgchild
																			.appendTo($('#showColumn'));
																	child
																			.appendTo($('#showColumn'));
																})
											})
						}

					});
</script>

</html>