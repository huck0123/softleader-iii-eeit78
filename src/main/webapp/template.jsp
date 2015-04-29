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

<link rel="stylesheet" href="/softleader-iii-eeit78/css/cover.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/givers.css">
<style>

.section {
	height: 1200px;
}
</style>


</head>
<html>
<body id="body">


<div class="outer-wrapper2">

	<div class="inner-wrapper height-auto">

		<div class="cover-container">

			<div id="headerFixed" class="headerFixed">
				<div class="inner">
					<div class="row">

						<div class="col-md-2 ">
							<h2 class="masthead-brand">TheGivers</h2>
						</div>
						<div class="col-md-6 ">
							<nav class="header-font">
								<ul class="nav masthead-nav masthead-nav-left">

<!-- 									<li class="margin-both10"><a href="">關於我們</a></li> -->
									<li class="margin-both10"><a href="<c:url value='/campaign/campaignShow'/>">活動列表</a></li>
									<li class="margin-both10"><a href="<c:url value='/raiser/raiserShow'/>">參與團體</a></li>
<!-- 									<li class="margin-both10"><a href="#">新聞查詢</a></li> -->
								</ul>
							</nav>
						</div>
						<div class="col-md-4 ">
							<nav>
								<ul class="nav masthead-nav">
									<li class="margin-both10"><a href="#"><img
											class="header-pic"
											src="/softleader-iii-eeit78/pictures/search-icon-hi.png" /></a></li>
											
											
									<li class="margin-both10"><a href="register.jsp"><img class="header-pic"
										src="/softleader-iii-eeit78/pictures/login2.png" /></a></li>
										
										
									<li class="margin-both10"><a href="#body"><img
											class="header-pic opacity60"
											src="/softleader-iii-eeit78/pictures/back_to_top.png" /></a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>

			<!-- 以下是heading的部分 -->
				<div id="header" class="masthead">
					<div class="inner">
						<div class="row ">
							<div class="col-md-2 center-block ">
								<h1 class="masthead-brand">TheGivers</h1>
							</div>
							<div class="col-md-6 center-block ">
								<nav>
								<ul class="nav masthead-nav masthead-nav-left ">

									<!-- 									<li class="margin-both10"><a href="#bottom">關於我們</a></li> -->
									<li class="margin-both10"><a
										href="<c:url value='/campaign/campaignShow'/>">活動列表</a></li>
									<li class="margin-both10"><a
										href="<c:url value='/raiser/raiserShow'/>">參與團體</a></li>

									<c:if test="${giver != null}">
										<li class="margin-both10"><a
											href="<c:url value='/giver/giverArea'/>">捐款人專區</a></li>
									</c:if>
									<c:if test="${giver != null}">
										<li class="margin-both10"><a
											href="<c:url value='/raiser/raiserInfo'/>">進入團體專區</a></li>
									</c:if>
									<!-- 									<li class="margin-both10"><a href="#">新聞查詢</a></li> -->
								</ul>
								</nav>
							</div>
							<div class="col-md-4 center-block ">
								<nav>
								<ul class="nav masthead-nav ">
									<li class="margin-both10"><a href="#"><img
											class="header-pic"
											src="/softleader-iii-eeit78/pictures/search-icon-hi.png" /></a></li>

									<li class="margin-both10"><a href="register.jsp"><img
											class="header-pic"
											src="/softleader-iii-eeit78/pictures/login2.png" /></a></li>
									<c:if
										test="${raiser != null || giver != null || admin != null}">
										<li class="margin-both10"><a
											href="/softleader-iii-eeit78/logout/logoutAction!logout.action">登出</a></li>
									</c:if>
								</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- headin部分結束 -->

		</div>
	</div>
</div>







<div class="outer-wrapper">
	<div class="inner-wrapper">
		<div class="wrapped-container" style="background-color: green">
			
			do things here 
			
		</div>
	</div>
</div>



</body>
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script>
	// function for popping out head
	$(document).ready(function() {
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
		$('a[href^="#"]').click(function() {
			$('html, body').animate({
				scrollTop : $($.attr(this, 'href')).offset().top
			}, 600, 'easeInOutExpo');
			return false;
		});	
			
	});
</script>

</html>