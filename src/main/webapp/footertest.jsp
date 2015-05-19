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
<title>The Givers</title>
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">

<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css"> -->
<style type="text/css">
.footer-wrapper {
	width: 100%;
	text-align: center;
	display: table;
	background-color: rgb(23, 23, 23);
	font-size: 16px;
	padding-top: 0px;
}

.footer-brand {
	display: inline-block;
	color: orangered;
	border-radius: 10px;
	width: 60%;
	padding: 10px 0px;
	font-stretch: extra-expanded;
	border-radius: 10px;
}

.footer-content {
	color: white;
}

.footer-wrapper ul {
	padding-left: 0px
}

.footer-wrapper li {
	list-style: none;
}

.footer-wrapper li a {
	text-decoration: none;
}
/* footer social icons starts*/
ul.social-network {
	list-style: none;
	display: inline;
	margin-left: 0 !important;
	padding: 0;
}

ul.social-network li {
	display: inline;
	margin: 0 5px;
}

.social-network a.icoRss:hover {
	background-color: #F56505;
}

.social-network a.icoFacebook:hover {
	background-color: #3B5998;
}

.social-network a.icoTwitter:hover {
	background-color: #33ccff;
}

.social-network a.icoGoogle:hover {
	background-color: #BD3518;
}

.social-network a.icoVimeo:hover {
	background-color: #0590B8;
}

.social-network a.icoLinkedin:hover {
	background-color: #007bb7;
}

.social-circle li a {
	background-color: rgba(255, 255, 255, 0.1);
	display: inline-block;
	position: relative;
	margin: 0 auto 0 auto;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	text-align: center;
	width: 50px;
	height: 50px;
	font-size: 20px;
	display: inline-block;
}

.social-circle li i {
	margin: 0;
	line-height: 50px;
	text-align: center;
	color: #fff;
}
/* footer social icons ends*/
</style>
</head>

<body id="body">

	<div class="background-div"></div>

	<jsp:include page="/header.jsp" />

	<div style="width: 100%; height: 1000px;"></div>
	<div style="width: 100%; height: 1000px;"></div>
	<div style="width: 100%; height: 1000px;"></div>


	<div class="footer-wrapper">

		<div class="footer-content">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-1">
						<h1 class="footer-brand">TheGivers</h1>
						<p class="ul-header">分享我們</p>
						<ul class="social-network social-circle">
							<li><a href="#" class="icoFacebook" title="Facebook"><i
									class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="icoTwitter" title="Twitter"><i
									class="fa fa-twitter"></i></a></li>
							<li><a href="#" class="icoGoogle" title="Google +"><i
									class="fa fa-google-plus"></i></a></li>
							<li><a href="#" class="icoLinkedin" title="Linkedin"><i
									class="fa fa-linkedin"></i></a></li>
						</ul>
					</div>
					<div class="col-md-2" style="margin-top: 30px; text-align: left;">
						<p>快速連結</p>
						<ul>
							<li>加入會員</li>
							<li>團體申請</li>
							<li>募款活動</li>
							<li>參與團體</li>
						</ul>
					</div>
					<div class="col-md-3" style="margin-top: 30px; text-align: left;">
						<p class="ul-header">聯絡我們</p>
						<ul>
							<li>關於我們</li>
							<li>Email:TheGivers@gmail.com</li>
							<li>地址:台北市大安區復興南路一段390號2樓</li>
							<li><a style="color: orangered;" target="_blank"
								href="https://www.google.com.tw/maps/preview#!q=%E5%8F%B0%E5%8C%97%E5%B8%82%E5%A4%A7%E5%AE%89%E5%8D%80%E5%BE%A9%E8%88%88%E5%8D%97%E8%B7%AF%E4%B8%80%E6%AE%B5%E8%B3%87%E7%AD%96%E6%9C%83-%E6%95%B8%E4%BD%8D%E6%95%99%E8%82%B2%E7%A0%94%E7%A9%B6%E6%89%80-%E8%B3%87%E8%A8%8A%E6%8A%80%E8%A1%93%E8%A8%93%E7%B7%B4%E4%B8%AD%E5%BF%83&amp;data=!4m15!2m14!1m13!1s0x3442abd379a5ec97%3A0xedc006d25a9e35df!3m8!1m3!1d4142!2d121.5449575!3d25.0427395!3m2!1i1270!2i880!4f13.1!4m2!3d25.033769!4d121.543398">
									<i class="fa fa-map-marker"></i> 地圖
							</a></li>
						</ul>
					</div>


				</div>
			</div>
			<div class="row">
				<p style="font-size: 14px; margin-top: 15px">
					Copyright 2015 <i class="fa fa-copyright"></i>&nbsp;&nbsp;
					|&nbsp;&nbsp; TheGivers
				</p>
			</div>

		</div>
	</div>

</body>


<script>
	
</script>

</html>