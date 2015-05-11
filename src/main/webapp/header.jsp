<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<!-- headerFixed start -->
<div>
	<div id="headerFixed" class="headerFixed">

		<div class="row">
			<div class="col-md-2 ">
				<h2 class="header-brand">
					<a href="<c:url value='/index.jsp'/>">TheGivers</a>
				</h2>
			</div>
			<div class="col-md-8 ">
				<nav class="navbar margin-bottom0">

					<ul class="nav navbar-nav header-nav">


						<li class="margin-both10"><a
							href="<c:url value='/campaign/campaignShow'/>">活動列表</a></li>
						<li class="margin-both10"><a
							href="<c:url value='/raiser/raiserCheck'/>">參與團體</a></li>
						<li class="margin-both10"><a href="">關於我們</a></li>
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
										<li><a href="<c:url value='/raiser/raiserShow'/>">管理團體資訊</a></li>
										<li><a href="<c:url value='/campaign/campaignAdmin'/>">管理活動</a></li>
										<li><a href="<c:url value='/donate/transactionDetail'/>">顯示所有交易紀錄</a></li>
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
		<div class="collapse" id="collapse1"
			style="background-color: #EEEEEE; text-align: left; padding: 15px 15px 30px 60px">
			<div id="search1" class="row" style="padding: 15px 0px 0px 0px">
				<h2 style="padding-left: 15px">登入您的帳號</h2>
				<div class="col-md-6 col-sm-6">
					<p>
						<a href="<c:url value='/login/login'/>" class="btn btn-primary">登入</a>
					</p>

					<p>立即登入，您將可以使用TheGivers給您的各項服務。</p>



				</div>

				<div class="col-md-6 col-sm-6"
					style="border-left: 1px black solid; padding-left: 30px">
					<p>
						<a href="<c:url value='/giver/giverRegister'/>"
							class="btn btn-primary">一般會員註冊</a>
					</p>
					<p>立即註冊成為一般會員，紀錄捐款，並得到更多統計資訊。</p>
					<p>
						<a href="<c:url value='/raiser/raiserRegister'/>"
							class="btn btn-primary">公益團體註冊</a>
					</p>
					<p>立即以公益團體身分註冊，讓愛心多一個管道投遞。</p>
					<p>我們會在收到您的申請時，先以電話確認，並當面訪談。簽妥同意書即開通您的帳號。</p>
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
				<h2 class="header-brand">
					<a href="<c:url value='/index.jsp'/>">TheGivers</a>
				</h2>
			</div>
			<div class="col-md-8">


				<nav class="navbar margin-bottom0">

					<ul class="nav navbar-nav header-nav">


						<li class="margin-both10"><a
							href="<c:url value='/campaign/campaignShow'/>">活動列表</a></li>
						<li class="margin-both10"><a
							href="<c:url value='/raiser/raiserCheck'/>">參與團體</a></li>
						<li class="margin-both10"><a href="">關於我們</a></li>
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
							<li><a data-toggle="collapse" data-target="#collapseExample"
								aria-expanded="false" aria-controls="collapseExample"> <img
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
										<li><a href="<c:url value='/raiser/raiserShow'/>">管理團體資訊</a></li>
										<li><a href="<c:url value='/campaign/campaignAdmin'/>">管理活動</a></li>
										<li><a href="<c:url value='/donate/transactionDetail'/>">顯示所有交易紀錄</a></li>
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
	<div class="collapse" id="collapseExample"
		style="background-color: #EEEEEE; text-align: left; padding: 15px 15px 30px 25px;">
		<h2 style="padding-left: 15px">登入您的帳號</h2>
		<div id="search2" class="row" style="padding: 15px 0px 0px 0px">

			<div class="col-md-6 col-sm-6">
				<p>
					<a href="<c:url value='/login/login'/>" class="btn btn-primary">登入</a>
				</p>

				<p>立即登入，您將可以使用TheGivers給您的各項服務。</p>



			</div>

			<div class="col-md-6 col-sm-6"
				style="border-left: 1px black solid; padding-left: 30px">
				<p>
					<a href="<c:url value='/giver/giverRegister'/>"
						class="btn btn-primary">一般會員註冊</a>
				</p>
				<p>立即註冊成為一般會員，紀錄捐款，並得到更多統計資訊。</p>
				<p>
					<a href="<c:url value='/raiser/raiserRegister'/>"
						class="btn btn-primary">公益團體註冊</a>
				</p>
				<p>立即以公益團體身分註冊，讓愛心多一個管道投遞。</p>
				<p>我們會在收到您的申請時，先以電話確認，並當面訪談，簽妥同意書即開通您的帳號。</p>
			</div>

		</div>
	</div>
</div>
<!-- header ends -->


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

