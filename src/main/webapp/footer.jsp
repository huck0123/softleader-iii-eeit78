<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<style>
.fTitle {
	color: #FFFFFF;
	font-size: 24px;
}

.linkWord {
	color: #F75000;
	font-size: 16px;
}

.date {
	color: orange;
}
#footer{
	position: relative;
}
</style>

<link rel="profile" href="http://gmpg.org/xfn/11" />
<link rel="pingback" href="http://www.socialcops.org/xmlrpc.php" />
<link rel="shortcut icon" type="image/x-icon"
	href="http://socialcops.wpengine.netdna-cdn.com/wp-content/uploads/2014/08/16.png">
<link rel="apple-touch-icon"
	href="http://socialcops.wpengine.netdna-cdn.com/wp-content/uploads/2014/08/16.png" />
<link
	href='http://fonts.googleapis.com/css?family=Raleway:400,300,600,700,500,200|Lato:200,300,400,600,800|Oxygen:200,300,400,600,700,800|Lato:200,300,400,600,700,800|Lato:200,300,400,600,700,800|Lato:200,300,400,600,700,800|Lato:200,300,400,600,700,800|Lato:200,300,400,600,700,800|Oxygen:200,300,400,600,700,800|Lato:200,300,400,600,700,800&subset=latin,latin-ext'
	rel='stylesheet' type='text/css'>
<link rel="canonical" href="http://www.socialcops.org/" />
<link rel="author" href="https://plus.google.com/105357087621746626066" />
<link rel="publisher"
	href="https://plus.google.com/+SocialcopsOrg/about" />
<link rel="stylesheet"
	href="http://www.socialcops.org/wp-content/cache/scripts/cbd58eef9b2b0f5dc8a9b6990413a230.css"
	type="text/css" media="all" />
	
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
	
<style type="text/css">
.ssba {
	
}

.ssba img {
	width: 40px !important;
	padding: 4px;
	border: 0;
	box-shadow: none !important;
	display: inline !important;
	vertical-align: middle;
}

.ssba, .ssba a {
	text-decoration: none;
	background: none;
	font-size: 12px;
}
</style>
<meta name="generator"
	content="Powered by Visual Composer - drag and drop page builder for WordPress." />
<style type="text/css" data-type="vc-custom-css">
.q_icon_with_title .icon_text_holder .icon_title {
	font-weight: 800;
}

p {
	text-align: justify;
}

.mail-chimp {
	background: #ffd800 !important;
	border: none !important;
	font-family: 'Lato', sans-serif;
}

.mail-chimp:hover {
	background: #ffd800 !important;
	border: none !important;
	font-family: 'Lato', sans-serif;
}
</style>


<meta charset="utf-8">
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--      <link rel="icon" href="../../favicon.ico"> -->
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">

</head>

<body id="body">

	<!-- headerFixed start -->

	<div>
		<div id="headerFixed" class="headerFixed">

			<div class="row">
				<div class="col-md-2 ">
					<h2 class="header-brand">TheGivers</h2>
				</div>
				<div class="col-md-8 ">
					<nav class="navbar margin-bottom0">

						<ul class="nav navbar-nav header-nav">

							<li class="margin-both10"><a href="">關於我們</a></li>
							<li class="margin-both10"><a
								href="<c:url value='/campaign/campaignShow'/>">活動列表</a></li>
							<li class="margin-both10"><a
								href="<c:url value='/raiser/raiserShow'/>">參與團體</a></li>
							<!-- 									<li class="margin-both10"><a href="#">新聞查詢</a></li> -->
						</ul>
					</nav>
				</div>

				<div class="col-md-2 ">
					<nav class="navbar margin-bottom0">
						<ul class="nav navbar-nav header-nav">



							<li><a href=""><img class="header-pic"
									src="/softleader-iii-eeit78/pictures/search-icon-hi.png" /></a></li>
							<c:if test="${raiser ==null && giver ==null && admin ==null}">
								<li><a data-toggle="collapse" data-target="#collapse1"
									aria-expanded="false" aria-controls="collapse1"> <img
										class="header-pic"
										src="/softleader-iii-eeit78/pictures/login2.png" /></a></li>
							</c:if>

							<c:if test="${raiser != null || giver != null || admin != null}">
								<li><a class="dropdown-toggle" id="menu1"
									data-toggle="dropdown"><img class="header-pic"
										src="/softleader-iii-eeit78/pictures/login3.png" /></a>
									<ul class="dropdown-menu" role="menu">
										<c:if test="${raiser != null}">
											<li><a role="menuitem"
												href="<c:url value='/raiser/raiserUpdate'/>">修改團體資訊</a></li>
											<li><a role="menuitem"
												href="<c:url value='/raiser/raiserHistory'/>">查看活動紀錄</a></li>
											<li><a role="menuitem"
												href="<c:url value='/campaign/campaignRaise'/>">發起活動</a></li>
										</c:if>
										<c:if test="${giver != null}">
											<li><a role="menuitem"
												href="/softleader-iii-eeit78/giver/giverInfo">修改會員資料</a></li>
											<li><a role="menuitem"
												href="/softleader-iii-eeit78/giver/giverHistory">捐款紀錄</a></li>
										</c:if>
										<c:if test="${admin != null}">
											<li><a href="<c:url value='/giver/AllGiverInfo'/>">顯示所有捐款人資訊</a></li>
											<li></li>
											<li>顯示所有交易紀錄</li>
										</c:if>
										<li class="divider"></li>
										<li><a role="menuitem"
											href="/softleader-iii-eeit78/logout/logoutAction!logout.action">登出</a></li>
									</ul></li>
							</c:if>

							<li><a href="#body"><img class="header-pic opacity60"
									src="/softleader-iii-eeit78/pictures/back_to_top.png" /></a></li>
						</ul>
					</nav>

				</div>

			</div>
			<div class="collapse" id="collapse1">
				<div id="search1" class="well row">

					<div class="col-md-6"">
						<div class="style="display:inline-block;">
							<form action="<c:url value='/login/loginAction'/>" method="post">
								<table>
									<tr>
										<td>ID :</td>
										<td><input type="text" name="account"
											value="${param.account}"></td>
										<td><span class="error">${errors.account}</span></td>
									</tr>
									<tr>
										<td>PWD :</td>
										<td><input type="text" name="passwd"
											value="${param.passwd}"></td>
										<td><span class="error">${errors.passwd}</span></td>
									</tr>
									<tr>
										<td></td>
										<td align="right"><input type="submit" value="Login"></td>
									</tr>
								</table>
								${wrongLogin}
							</form>
						</div>
					</div>

					<div class="col-md-6">
						<p>
							<a href="<c:url value='/giver/giverRegister'/>">註冊為捐款會員</a>
						</p>
						<p>
							<a href="<c:url value='/raiser/raiserRegister'/>">進入團體申請帳號頁面</a>
						</p>
					</div>

				</div>
			</div>


		</div>

	</div>

	<!-- header-fixed end -->




	<!--  header start -->
	<div class="container">
		<div id="header" class="header">
			<div class="row">
				<div class="col-md-2">
					<h2 class="header-brand">TheGivers</h2>
				</div>
				<div class="col-md-8">


					<nav class="navbar margin-bottom0">

						<ul class="nav navbar-nav header-nav">

							<li class="margin-both10"><a href="">關於我們</a></li>
							<li class="margin-both10"><a
								href="<c:url value='/campaign/campaignShow'/>">活動列表</a></li>
							<li class="margin-both10"><a
								href="<c:url value='/raiser/raiserShow'/>">參與團體</a></li>


							<!-- 									<li class="margin-both10"><a href="#">新聞查詢</a></li> -->
						</ul>

					</nav>
				</div>

				<div class="col-md-2">
					<nav class="navbar margin-bottom0">
						<ul class="nav navbar-nav header-nav">

							<li><a href=""><img class="header-pic"
									src="/softleader-iii-eeit78/pictures/search-icon-hi.png" /></a></li>

							<c:if test="${raiser ==null && giver ==null && admin ==null}">
								<li><a data-toggle="collapse"
									data-target="#collapseExample" aria-expanded="false"
									aria-controls="collapseExample"> <img class="header-pic"
										src="/softleader-iii-eeit78/pictures/login2.png" /></a></li>
							</c:if>
							<c:if test="${raiser != null || giver != null || admin != null}">
								<li><a class="dropdown-toggle" id="menu1"
									data-toggle="dropdown"><img class="header-pic"
										src="/softleader-iii-eeit78/pictures/login3.png" /></a>
									<ul class="dropdown-menu" role="menu">
										<c:if test="${raiser != null}">
											<li><a role="menuitem"
												href="<c:url value='/raiser/raiserUpdate'/>">修改團體資訊</a></li>
											<li><a role="menuitem"
												href="<c:url value='/raiser/raiserHistory'/>">查看活動紀錄</a></li>
											<li><a role="menuitem"
												href="<c:url value='/campaign/campaignRaise'/>">發起活動</a></li>
										</c:if>
										<c:if test="${giver != null}">
											<li><a role="menuitem"
												href="/softleader-iii-eeit78/giver/giverInfo">修改會員資料</a></li>
											<li><a role="menuitem"
												href="/softleader-iii-eeit78/giver/giverHistory">捐款紀錄</a></li>
										</c:if>
										<c:if test="${admin != null}">
											<li><a href="<c:url value='/giver/AllGiverInfo'/>">顯示所有捐款人資訊</a></li>
											<li></li>
											<li>顯示所有交易紀錄</li>
										</c:if>
										<li class="divider"></li>
										<li><a role="menuitem"
											href="/softleader-iii-eeit78/logout/logoutAction!logout.action">登出</a></li>
									</ul></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<div class="collapse" id="collapseExample">
			<div id="search2" class="well row">

				<div class="col-md-6"">
					<div class="style="display:inline-block;">
						<form action="<c:url value='/login/loginAction'/>" method="post">
							<table>
								<tr>
									<td>ID :</td>
									<td><input type="text" name="account"
										value="${param.account}"></td>
									<td><span class="error">${errors.account}</span></td>
								</tr>
								<tr>
									<td>PWD :</td>
									<td><input type="text" name="passwd"
										value="${param.passwd}"></td>
									<td><span class="error">${errors.passwd}</span></td>
								</tr>
								<tr>
									<td></td>
									<td align="right"><input type="submit" value="Login"></td>
								</tr>
							</table>
							${wrongLogin}
						</form>
					</div>
				</div>

				<div class="col-md-6">
					<p>
						<a href="<c:url value='/giver/giverRegister'/>">註冊為捐款會員</a>
					</p>
					<p>
						<a href="<c:url value='/raiser/raiserRegister'/>">進入團體申請帳號頁面</a>
					</p>
				</div>

			</div>
		</div>
	</div>
	<!-- header ends -->
	<div class="container">
	<div class="row" style="background-color:#FFAF60">
		<div style="height:50px"></div>
		<div class="col-md-2"></div>
		<div class="col-md-8"><ul class="list-unstyled"><div class="row" id="raiserLogo"></div></ul></div>
		<div class="col-md-2"></div>
	</div>
</div>
	<script>

	</script>


<!-- 	<div style="height: 3000px; background-color:yellow"></div> -->







<footer class="uncover" id="footer">
	<div class="footer_inner clearfix">
		<div class="footer_top_holder">
			<div class="container">
				<div class="container_inner">
					<div class="three_columns clearfix">
						<div class="column1">
							<div class="column_inner">


								<div id="text-34" class="widget widget_text">
									<div class="textwidget">
										<a href="http://www.socialcops.org"><img
											class="wp-image-16570 size-thumbnail aligncenter"
											alt="" width="100" height="100" />THEGIVERS</a>
									</div>
								</div>
								<div id="text-35" class="widget widget_text">
									<h5></h5>
									<div class="textwidget">
										<div style="text-align: center;">
											<span class='q_social_icon_holder circle_social'
												data-hover-background-color=#000000 data-hover-color=#ffd649><a
												href='https://www.facebook.com/SocialCops' target='_'><span
													class='fa-stack fa-2x' style='background-color: #ffd649;'><i
														class='fa fa-facebook' style='color: #000000;'></i></span></a></span> <span
												class='q_social_icon_holder circle_social'
												data-hover-background-color=#000000 data-hover-color=#ffd649><a
												href='https://twitter.com/Social_Cops' target='_'><span
													class='fa-stack fa-2x' style='background-color: #ffd649;'><i
														class='fa fa-twitter' style='color: #000000;'></i></span></a></span><span
												class='q_social_icon_holder circle_social'
												data-hover-background-color=#000000 data-hover-color=#ffd649><a
												href='http://instagram.com/SocialCops' target='_'><span
													class='fa-stack fa-2x' style='background-color: #ffd649;'><i
														class='fa fa-instagram' style='color: #000000;'></i></span></a></span><span
												class='q_social_icon_holder circle_social'
												data-hover-background-color=#000000 data-hover-color=#ffd649><a
												href='https://www.linkedin.com/company/social-cops'
												target='_'><span class='fa-stack fa-2x'
													style='background-color: #ffd649;'><i
														class='fa fa-linkedin' style='color: #000000;'></i></span></a></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="recent-posts-2">
							<h5 class="fTitle">Recent News About Us</h5>
							<ul>
								<li><a
									href="http://www.socialcops.org/2014/12/17/child-labour-issue-end-new-law/"
									class="linkWord">Raise fund for Nepal after the devastating
										earthquake.</a> <span class="date">May 1, 2015</span></li>
								<li><a
									href="http://www.socialcops.org/2014/12/12/why-blaming-uber-is-not-enough/"
									class="linkWord">Help this kid with his education after
										deaths of his parents.</a> <span class="date">April 12,
										2015</span></li>
								<li><a
									href="http://www.socialcops.org/2014/11/26/now-serving-dashboards-platters/"
									class="linkWord">See how large the gap is between the rich
										and the poor in India.</a> <span class="date">January 18,
										2015</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
</body>
<script>
// $(document).ready(function(){
// 	$(window).scroll(function(){
// 		if ($(window).scrollTop() + $(window).height() <= $(document).height() - 500) {
// 			$('#footer').slideUp();
// 		} else {
// 			$('#footer').slideDown();
// 		}
// 	});
// });
</script>
<script>
	// function for popping out head
	$(document).ready(function() {
		$(window).scroll(function() {
			$('.in').removeClass("in");
			if ($(window).scrollTop() > 99) {
				console.log($(window).scrollTop());
				$('#headerFixed').slideDown();
				$('#header').addClass("vis-hidden");

			} else {
				console.log($(window).scrollTop());
				$('#headerFixed').slideUp();
				$('#header').removeClass("vis-hidden");

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
	
	var url = "/softleader-iii-eeit78/raiser/raiserSelectAll!selectAll"
		$.post(url, getData);

		function getData(raisers) {
			raisers = JSON.parse(raisers);
			$(raisers)
					.each(
							function(index, raiser) {
								var srclogo = arrayBufferToBase64(raiser.logo);
								var strimg = "<img src='' class='img-thumbnail' id='logo"+raiser.id+"' style='width:200px; height:200px'>";
								var strhref = "<a href='<c:url value='/raiser/raiserAction!select?account="
										+ raiser.account
										+ "'/>'>"
										+ strimg
										+ "</a>";
								$("#raiserLogo").append(
										"<div class='col-md-3'><li style='padding:5px'>"
												+ strhref + "</li></div>");
								$("#logo" + raiser.id).attr("src",
										"data:image/png;base64," + srclogo);
							});
		}
</script>
</html>