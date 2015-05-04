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

	<div class="background-image"></div>

	<jsp:include page="/header.jsp" />



	<div id="campaingDiv" class="container">

		<div class="inner-wrapper">
			<div class="wrapped-container">
				<h2>最新活動</h2>
			</div>
			<div class="vertical-space"></div>
			<div class="vertical-space"></div>

			<div class="wrapped-container">



				<div class="row">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img src="" alt="">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>...</p>
								<p>
									<a href="<c:url value='/donate/donate'/>"
										class="btn btn-primary" role="button">我要捐款</a>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img src="" alt="">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>...</p>
								<p>
									<a href="<c:url value='/donate/donate'/>"
										class="btn btn-primary" role="button">我要捐款</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img src="" alt="">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>...</p>
								<p>
									<a href="<c:url value='/donate/donate'/>"
										class="btn btn-primary" role="button">我要捐款</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<div style="width: 100%; height: 1000px;"></div>
	<div style="width: 100%; height: 1000px;"></div>
	<div style="width: 100%; height: 1000px;"></div>
</body>


<script>

	
</script>

</html>