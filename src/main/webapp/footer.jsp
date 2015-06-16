<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<style type="text/css">
.footer-wrapper {
	width: 100%;
	text-align: center;
	display: table;
	background-color: rgb(23, 23, 23);
	font-size: 16px;
	padding-top: 0px;
}

.footer-wrapper a {
	color: white;
}

.footer-wrapper .row {
	margin-left: 0px;
	margin-right: 0px;
}

.footer-brand {
	display: inline-block;
	color: orangered;
	border-radius: 10px;
	width: 60%;
	padding: 10px 0px 5px 0px;
	margin-bottom: 0px;
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
<div class="footer-wrapper">
	<div class="footer-content">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-1">
					<h1 class="footer-brand">TheGivers</h1>
					<p class="ul-header">分享我們</p>
					<ul class="social-network social-circle">
						<li><a target="_blank"
							href="http://www.facebook.com/share.php?u=http://thegivers.cloudapp.net/softleader-iii-eeit78/index.jsp"
							class="icoFacebook" title="Facebook"><i
								class="fa fa-facebook"></i></a></li>
						<li><a target="_blank"
							href="http://twitter.com/home/?status=http://thegivers.cloudapp.net/softleader-iii-eeit78/index.jsp"
							class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
						<li><a target="_blank"
							href="https://plus.google.com/share?url=http://thegivers.cloudapp.net/softleader-iii-eeit78/index.jsp"
							class="icoGoogle" title="Google +"><i
								class="fa fa-google-plus"></i></a></li>
						<li><a target="_blank"
							href="https://www.linkedin.com/shareArticle?mini=true&url=http://thegivers.cloudapp.net/softleader-iii-eeit78/index.jsp&title=The%20Givers&summary=The%20Givers.%0AMake%20every%20penny%20meaningful.&source="
							class="icoLinkedin" title="Linkedin"><i
								class="fa fa-linkedin"></i></a></li>
					</ul>
				</div>
				<div class="col-md-2 visible-md-block visible-lg-block"
					style="margin-top: 30px; text-align: left;">
					<p>快速連結</p>
					<ul>
						<li><a href="<c:url value='/giver/giverRegister'/>">加入會員</a></li>
						<li><a href="<c:url value='/raiser/raiserRegister'/>">團體申請</a></li>
						<li><a href="<c:url value='/campaign/campaignShow'/>">募款活動</a></li>
						<li><a href="<c:url value='/raiser/raiserCheck'/>">參與團體</a></li>
					</ul>
				</div>
				<div class="col-md-3 visible-md-block visible-lg-block"
					style="margin-top: 30px; text-align: left;">
					<p class="ul-header">聯絡我們</p>
					<ul>
						<li><a href="#">關於我們</a></li>
						<li>Email:TheGivers@gmail.com</li>
						<li>地址:台北市大安區<br />復興南路一段390號2樓
						</li>
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

<script>
var footerHeight = $('.footer-wrapper').height();
</script>