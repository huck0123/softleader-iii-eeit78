<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">

<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<title>���ڤH�M��</title>
</head>
<body>
	<div>
		<a href="http://localhost:8080/softleader-iii-eeit78/index.jsp">�^����</a>
	</div>

	<div class="row container">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h2>${sessionScope.giver.familyName }${sessionScope.giver.name }�z�n</h2>
			<a href="#">���ڤH���v�T��</a> 
			<p />
			<a href="/softleader-iii-eeit78/giver/giverInfo">�ק�|�����</a>
		</div>
		<div class="col-md-2"></div>

	</div>

</body>
</html>