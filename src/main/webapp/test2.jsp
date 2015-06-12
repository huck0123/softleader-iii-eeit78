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

<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css"> -->
<style type="text/css">

</style>
</head>

<body id="body">

<button id='hihihi' type="button">hihihi</button>

<iframe src="http://localhost:8080/softleader-iii-eeit78/campaign/campaignAction!downloadExcel"></iframe>


<script type="text/javascript">

$('#hihihi').on('click',function(){
	
	var url = "http://localhost:8080/softleader-iii-eeit78/campaign/campaignAction!downloadExcel";

// 	window.open(url);
	
//	location.href= url;
	
});


</script>




</body>



</html>