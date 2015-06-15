<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<!-- facebook og -->
<meta property="og:image" content="http://thegivers.cloudapp.net/softleader-iii-eeit78/pictures/rsz_thanks.jpg" />
<style type="text/css">
/*general setting*/
.container {
	padding: 0px;
}
a:hover{cursor: pointer;}
/*general setting*/

/*nav properties start*/
.scroll-header {
	position: fixed;
	top: 0;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.8);
}

#header-wrapper {
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
	text-align: left;
	top:0;
	z-index: 9999;
	width: 100%;
}

.navbar-header-custom {
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
	background-image: none;
	background-color: white;
	margin-bottom: 0px;
	border: 0px;
	box-shadow: none;
	-webkit-box-shadow: none;
	border-radius: 0px;
	padding: 10px 0px;
}

.navbar-header-custom-scroll {
	background-color: transparent;
}

li:hover {
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
	background-color: rgba(200, 200, 200, 0.2);
}

ul.nav {
	font-size: 18px;
}
/*nav properties end*/

/*brand starts*/
.brand {
	font-size: 30px;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .25);
	float: left;
	height: 50px;
	padding: 15px 15px;
	line-height: 20px;
	color: grey;
}

.brand:HOVER {
	text-decoration: none;
	color: orangered;
}

.brand-scroll {
	color: white;
}
/*brand ends*/

/* left nav properties start*/
#nav-left li {
	margin: 0px 6px 0px 14px;
}

#nav-left li a {
	color: orangered;
	font-weight: bold;
}

#nav-left li::before {
	content: "";
	width: 100%;
	height: 100%;
	position: absolute;
	border-bottom: 4px solid #EEEEEE;
}

#nav-left li:hover::before {
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
	content: "";
	width: 100%;
	height: 100%;
	position: absolute;
	border-bottom: 4px solid orangered;
}
/* left nav properties end*/

/* right nav properties start*/
.header-pic {
	margin: 0;
	padding: 0;
	width: 20px;
	height: 20px
}
/* right nav properties end*/
/* collapse part properties start*/
#collapse-search {
	position: fixed;
	background-color: #EEEEEE;
	width: inherit;
	z-index: 9999;
	margin: auto;
}

#collapse-login {
	position: fixed;
	background-color: #EEEEEE;
	z-index: 9999;
	margin: auto;
}

.collapse-login {
	width: inherit;
}

.collapse-login-scroll {
	width: 100%
}
/* collapse part properties end*/

/*nav responsive settings start*/
@media{
#myNavbar li a{text-align: center;}
}
@media( min-width : 768px){
#nav-left li::before {
	content: "";
	width: 30%;
	height: 100%;
	position: absolute;
	border-bottom: 4px solid #EEEEEE;
}
/*nav responsive settings end*/

.bottom-shadow{box-shadow: 0px 1px 3px 1px rgba(200,200,200,0.9)}
</style>

<div id="top-anchor" style="top: 0; position: absolute;"></div>

<div id="header-holder" style="display: none;"></div> 

<div id="header-wrapper">

	<div id="header-container" class="container bottom-shadow">
		<nav id="nav-header"
			class="navbar navbar-default navbar-header-custom">
			<div class="container-fluid">

				<!-- 視窗縮小時變按鈕開始 -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a id="brand" class="brand" href="<c:url value='/index.jsp'/>">TheGivers</a>
				</div>
				<!-- 視窗縮小時變按鈕結束 -->

				<div class="collapse navbar-collapse" id="myNavbar">
					<ul id="nav-left" class="nav navbar-nav">
						<li><a href="<c:url value='/campaign/campaignShow'/>">募款活動</a></li>
						<li><a href="<c:url value='/raiser/raiserCheck'/>">參與團體</a></li>
						<li><a href="<c:url value='/util/statChart_map'/>">統計資訊</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a data-toggle="collapse" data-target="#collapse-search"
							aria-expanded="false" aria-controls="collapse-search"><img
								class="header-pic"
								src="/softleader-iii-eeit78/pictures/search-icon-hi.png" /></a></li>

						<c:if test="${raiser ==null && giver ==null && admin ==null}">
							<li><a data-toggle="collapse" data-target="#collapse-login"
								aria-expanded="false" aria-controls="collapse-login"> <img
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
											href="<c:url value='/raiser/raiserUpdate?raiserTabs=1'/>">修改團體資訊</a></li>
										<li><a role="menuitem"
											href="<c:url value='/raiser/raiserUpdate?raiserTabs=2'/>">查看活動紀錄</a></li>
										<li><a role="menuitem"
											href="<c:url value='/raiser/raiserUpdate?raiserTabs=3'/>">發起活動</a></li>
									</c:if>
									<c:if test="${giver != null}">
										<li><a role="menuitem"
											href="<c:url value='/giver/giverInfo?giverTabs=1'/>">會員資料修改</a></li>
										<li><a role="menuitem"
											href="<c:url value='/giver/giverInfo?giverTabs=2'/>">捐款紀錄</a></li>
									</c:if>
									<c:if test="${admin != null}">
										<li><a href="<c:url value='/giver/AllGiverInfo?adminTabs=1'/>">顯示所有捐款人資訊</a></li>
										<li><a href="<c:url value='/giver/AllGiverInfo?adminTabs=2'/>">管理團體資訊</a></li>
										<li><a href="<c:url value='/giver/AllGiverInfo?adminTabs=3'/>">管理活動</a></li>
										<li><a href="<c:url value='/giver/AllGiverInfo?adminTabs=4'/>">顯示所有交易紀錄</a></li>
									</c:if>
									<li class="divider"></li>
									<li><a role="menuitem"
										href="/softleader-iii-eeit78/logout/logoutAction!logout.action">登出</a></li>
								</ul></li>
						</c:if>
						<li id="to-top" style="display: none;"><a name="smooth" href="#top-anchor"><i class="fa fa-arrow-up" style="color: silver; font-size: 20px"></i></a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div id="collapse-part" class="container" style="height: 1px">
		<div class="collapse" id="collapse-search">
			<div id="custom-search-input">
				<div class="input-group col-md-8"
					style="padding: 30px; margin: auto">
					<input type="text" class="form-control input-lg"
						placeholder="活動快搜" id="header-name-search" /> <span
						class="input-group-btn">
						<button class="btn btn-info btn-lg" type="button"
							id="header-search-btn">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</span>
				</div>
			</div>
		</div>

		<div class="collapse collapse-login" id="collapse-login">
			<div class="row" style="margin-bottom: 30px">
				<div class="container">
					<h2
						style="padding-left: 20px; margin-bottom: 20px; margin-top: 30px">登入您的帳號</h2>
					<div class="col-md-6 col-sm-6"
						style="padding-left: 20px; padding-right: 20px">
						<p>
							<a href="<c:url value='/login/login'/>" class="btn btn-primary">登入</a>
						</p>
						<p>立即登入，您將可以使用TheGivers給您的各項服務。</p>
					</div>
					<div class="col-md-6 col-sm-6"
						style="border-left: 1px silver solid; padding-left: 20px; padding-right: 20px">
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


</div>


<script>
var headerHeight = $('#header-wrapper').height();

	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(window).scrollTop() > 100) {
				$('#header-wrapper').stop().addClass(
					'scroll-header');
				$('#to-top').stop().show(500);
				$('#nav-header').stop().addClass(
					'navbar-header-custom-scroll');
				$('#brand').stop().addClass(
					'brand-scroll');
				$('#collapse-part').removeClass(
					'container');
				$('#collapse-login').addClass('collapse-login-scroll');
				$('#header-holder').stop().show().height(headerHeight);
				$('#header-container').removeClass(
					'bottom-shadow');
				} else {
				$('#header-wrapper').stop()
					.removeClass('scroll-header');
				$('#to-top').stop().hide(500);
				$('#nav-header').stop().removeClass(
					'navbar-header-custom-scroll');
				$('#brand').stop().removeClass(
					'brand-scroll');
				$('#collapse-part').addClass(
					'container');
				$('#collapse-login')
					.removeClass('collapse-login-scroll');
				$('#header-holder').stop().hide().height(0);
				$('#header-container').addClass(
					'bottom-shadow');
					}
			});

						// function for moving smoothly to anchor
						$('a[name="smooth"]').click(function() {
							$('html, body').animate(
								{scrollTop : $($.attr(this, 'href')).offset().top}, 600, 'easeInOutExpo');
									return false;
								});

						$('#header-search-btn').on('click',function() {
							location.href = '/softleader-iii-eeit78/campaign/campaignShow?nameSearch='
													+ $('#header-name-search').val() + '&page=0';});
						
						$(window).on('resize',function(){
							if($(window).scrollTop() <=100){	
							$('#to-top').css({'display':'none'});
							} else{
							$('#to-top').attr('style','');
							}
							})

						
					});
</script>

