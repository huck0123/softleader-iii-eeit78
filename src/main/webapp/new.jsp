<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<link rel="stylesheet" href="/softleader-iii-eeit78/css/new.css">
<style>
.section {
	height: 1200px;
}
</style>


</head>

<body id="body">


	<!-- <div id="headerFixed" class="headerFixed"> -->

	<!-- 					<div class="row"> -->

	<!-- 						<div class="col-md-2 "> -->
	<!-- 							<h2 class="header-brand">TheGivers</h2> -->
	<!-- 						</div> -->
	<!-- 						<div class="col-md-8 "> -->
	<!-- 							<nav class="navbar navbar-default"> -->
	<!-- 								<ul class="nav  header-nav navbar-left"> -->

	<!-- 									<li class="margin-both10"><a href="">關於我們</a></li> -->
	<%-- 									<li class="margin-both10"><a href="<c:url value='/campaign/campaignShow'/>">活動列表</a></li> --%>
	<%-- 									<li class="margin-both10"><a href="<c:url value='/raiser/raiserShow'/>">參與團體</a></li> --%>
	<!-- 									<li class="margin-both10"><a href="#">新聞查詢</a></li> -->
	<!-- 								</ul> -->
	<!-- 							</nav> -->
	<!-- 						</div> -->
	<!-- 						<div class="col-md-2 "> -->
	<!-- 							<nav> -->
	<!-- 								<ul class="nav header-nav navbar-left"> -->
	<!-- 									<li class="margin-both10"><a href="#"><img -->
	<!-- 											class="header-pic" -->
	<!-- 											src="/softleader-iii-eeit78/pictures/search-icon-hi.png" /></a></li> -->


	<!-- 									<li class="margin-both10"><a href="register.jsp"><img class="header-pic" -->
	<!-- 										src="/softleader-iii-eeit78/pictures/login2.png" /></a></li> -->


	<!-- 									<li class="margin-both10"><a href="#body"><img -->
	<!-- 											class="header-pic opacity60" -->
	<!-- 											src="/softleader-iii-eeit78/pictures/back_to_top.png" /></a></li> -->
	<!-- 								</ul> -->
	<!-- 							</nav> -->
	<!-- 						</div> -->

	<!-- 				</div> -->
	<!-- 			</div> -->





	<div class="cover-wrapper">
		<div class="cover-wrapper-inner">

			<div class="cover-container">

				<div class="header">
					<div class="row">
						<div class="col-md-2">
							<h2 class="header-brand">TheGivers</h2>
						</div>
						<div class="col-md-7">


							<nav class="navbar xxx">
							<div class="navbar-header"></div>
							<ul class="nav navbar-nav header-nav">
								<li><a href="#">關於我們</a></li>
								<li><a href="#">最新活動</a></li>
								<li><a href="#">參與團體</a></li>
							</ul>

							</nav>
						</div>

						<div class="col-md-3"></div>
					</div>
				</div>


			</div>
		</div>
	</div>


	<div class="section"></div>
	<div class="section"></div>

	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Brand</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
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