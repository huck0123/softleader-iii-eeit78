<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
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


<div> this is a template. Do things here. </div>



<div style="height:3000px"></div>

</body>


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
</script>







<footer class="uncover">
<div class="footer_inner clearfix">
<div class="footer_top_holder">
<div class="footer_top">
<div class="container">
<div class="container_inner">
<div class="three_columns clearfix">
<div class="column1">
<div class="column_inner">

<div id="text-34" class="widget widget_text"> <div class="textwidget"><a href="http://www.socialcops.org"><img class="wp-image-16570 size-thumbnail aligncenter" src="http://socialcops.wpengine.netdna-cdn.com/wp-content/uploads/2014/03/1024-150x150.png" alt="" width="150" height="150"/></a></div>
</div><div id="text-35" class="widget widget_text"><h5> </h5> <div class="textwidget"><div style="text-align:center;"><span class='q_social_icon_holder circle_social' data-hover-background-color=#000000 data-hover-color=#ffd649><a href='https://www.facebook.com/SocialCops' target='_'><span class='fa-stack fa-2x' style='background-color: #ffd649;'><i class='fa fa-facebook' style='color: #000000;'></i></span></a></span>
<span class='q_social_icon_holder circle_social' data-hover-background-color=#000000 data-hover-color=#ffd649><a href='https://twitter.com/Social_Cops' target='_'><span class='fa-stack fa-2x' style='background-color: #ffd649;'><i class='fa fa-twitter' style='color: #000000;'></i></span></a></span><span class='q_social_icon_holder circle_social' data-hover-background-color=#000000 data-hover-color=#ffd649><a href='http://instagram.com/SocialCops' target='_'><span class='fa-stack fa-2x' style='background-color: #ffd649;'><i class='fa fa-instagram' style='color: #000000;'></i></span></a></span><span class='q_social_icon_holder circle_social' data-hover-background-color=#000000 data-hover-color=#ffd649><a href='https://www.linkedin.com/company/social-cops' target='_'><span class='fa-stack fa-2x' style='background-color: #ffd649;'><i class='fa fa-linkedin' style='color: #000000;'></i></span></a></span></div></div>
</div> </div>
</div>
<div class="column2">
<div class="column_inner">
<div id="recent-posts-2" class="widget widget_recent_entries"> <h5>Recent News About Us</h5> <ul>
<li>
<a href="http://www.socialcops.org/2014/12/17/child-labour-issue-end-new-law/">Child Labour: Does the issue end with a new law</a>
<span class="post-date">December 17, 2014</span>
</li>
<li>
<a href="http://www.socialcops.org/2014/12/12/why-blaming-uber-is-not-enough/">Why blaming Uber is not enough</a>
<span class="post-date">December 12, 2014</span>
</li>
<li>
<a href="http://www.socialcops.org/2014/11/26/now-serving-dashboards-platters/">Now Serving, Dashboards on Platters</a>
<span class="post-date">November 26, 2014</span>
</li>
</ul>
</div> </div>
</div>
<div class="column3">
<div class="column_inner">
<div id="text-36" class="widget widget_text"> <div class="textwidget">
 
 
</div>
</div> </div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="footer_bottom_holder">
<div class="footer_bottom">
</div>
</div>
</div>
</footer>


















</html>