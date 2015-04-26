<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有捐款人資訊</title>

<!-- <script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script> -->
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="/softleader-iii-eeit78/js/giver.js " charset="UTF-8"></script>


</head>
<body>
	<div><a href="http://localhost:8080/softleader-iii-eeit78/index.jsp">回首頁</a></div>
	
	<div class="container">
		<button onclick="before()">上一頁</button>
		<button onclick="nowPage()" value="1" id="page">本頁</button>
		<button onclick="after()">下一頁</button>
	
		<table class="table table-condensed">
			<tr>
				<th>帳號</th>
				<th>密碼</th>
				<th>姓</th>
				<th>名字</th>
				<th>性別</th>
				<th>身分證號碼</th>
				<th>手機號碼</th>
				<th>地址</th>
				<th>email</th>
				<th>獲得資訊</th>
				<th>生日</th>
			</tr>
			<tbody id="tbdy">
				

			</tbody>
		</table>
	</div>


	<script>
		
		var giverCount = ${application.giverCount}/5;
		var url = "http://localhost:8080/softleader-iii-eeit78/giver/giverSelect!getPerPage";
		
		
		function getData(data){
			$.each(data,function(index,obj){
				$(tbdy).append("<tr>"
						+ "<td>"+ obj.account +"</td>"
						+ "<td>" +obj.passwd +"</td>"
						+ "<td>"+ obj.familyName +"</td>" 
						+ "<td>"+ obj.name +"</td>" 
						+ "<td>"+ gender(obj.gender) +"</td>" 
						+ "<td>"+ obj.idNumber +"</td>" 
						+ "<td>"+ obj.tel +"</td>" 
						+ "<td>"+ obj.address +"</td>" 
						+ "<td>"+ obj.email +"</td>" 
						+ "<td>"+ getInfo(obj.getInfo) +"</td>" 
						+ "<td>"+ obj.birth +"</td>" 
						+"</tr>");	
			});
		};
		
		function nowPage(){
			var thisPage = $('#page').val();
			
			$('#tbdy').children().remove();
			
			$.getJSON(url,{'thisPage':thisPage},getData);
		};
		
		nowPage();
		
		function before(){
			var thisPage = $('#page').val();
			if(thisPage > 1){
				thisPage--;
				
				$('#page').val(thisPage);
				$('#tbdy').children().remove();
				$.getJSON(url,{'thisPage':thisPage},getData);
			}
		};
		

		function after() {
			var thisPage = $('#page').val();
			if(thisPage < giverCount ){
				thisPage++;
				
				$('#page').val(thisPage);
				$('#tbdy').children().remove();
				$.getJSON(url,{'thisPage':thisPage},getData);
			}
		};
		
		
		
		 				                 <!--Ajax方法-->
		// 		function load() {
		// 			var xmlhttp;
		// 			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		// 				xmlhttp = new XMLHttpRequest();
		// 			} else {// code for IE6, IE5
		// 				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		// 			}

		// 			var url = "http://localhost:8080/softleader-iii-eeit78/giver/giverSelect!selectAll";

		// 			xmlhttp.open("get", url, true);
		// 			xmlhttp.send();

		// 			xmlhttp.onreadystatechange = function() {
		// 				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		// 					console.log($.getJSON())
		// 					var JsonObject = JSON.parse(xmlhttp.responseText);
		// 					console.log(JsonObject);//console
		// 				}
		// 			}
		// 		}
	</script>



</body>
</html>