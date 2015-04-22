<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>所有捐款人資訊</title>


<style>
.draggable {
	width: 350px;
	height: 350px;
	padding: 0.5em;
}
</style>

<script>
	$(function() {
		$(".draggable").draggable();
	});
</script>

</head>
<body>
	<button onclick="before()">上一頁</button>
	<button onclick="nowPage()" value="1" id="page">本頁</button>
	<button onclick="after()">下一頁</button>
	
	<!--無聊一下 -->

	<div class="draggable" style="border: 1px solid gray;">
		<table class="table">
			<tr>
				<th>帳號</th>
				<th>密碼</th>
				<th>姓</th>
				<th>名字</th>
			</tr>
			<tbody id="tbdy">
			
			</tbody>
		</table>
	</div>


	<script>
		var giverCount = ${application.giverCount}/5;
		
		function before(){
			var thisPage = $('#page').val();
			if(thisPage > 1){
				thisPage--;
			}
			$('#page').val(thisPage);
			
			var tbdy = document.getElementById("tbdy");
			while (tbdy.hasChildNodes()){
				tbdy.removeChild(tbdy.firstChild);
			}
			
			var url = "http://localhost:8080/softleader-iii-eeit78/giver/giverSelect!getPerPage";
			
			$.getJSON(url,{'giverCount':thisPage},function(data){
				$.each(data,function(index,obj){
					$(tbdy).append("<tr>"+ "<td>"+obj.account+"</td>"+ "<td>"+obj.passwd+"</td>"+ "<td>"+obj.familyName+"</td>" + "<td>"+obj.name+"</td>" +"</hr>");	
				});
			});
			
		};
		
		function nowPage(){
			var thisPage = $('#page').val();
			
			var tbdy = document.getElementById("tbdy");
			while (tbdy.hasChildNodes()){
				tbdy.removeChild(tbdy.firstChild);
			}
			
			var url = "http://localhost:8080/softleader-iii-eeit78/giver/giverSelect!getPerPage";
			
			$.getJSON(url,{'giverCount':thisPage},function(data){
				$.each(data,function(index,obj){
					$(tbdy).append("<tr>"+ "<td>"+obj.account+"</td>"+ "<td>"+obj.passwd+"</td>"+ "<td>"+obj.familyName+"</td>" + "<td>"+obj.name+"</td>" +"</hr>");	
				});
			});
		};
		

		function after() {
			var thisPage = $('#page').val();
			if(thisPage < giverCount ){
				thisPage++;
			}
			$('#page').val(thisPage);
			
			var tbdy = document.getElementById("tbdy");
			while (tbdy.hasChildNodes()) {
				tbdy.removeChild(tbdy.firstChild);
			}

			var url = "http://localhost:8080/softleader-iii-eeit78/giver/giverSelect!getPerPage";

			$.getJSON(url,{'giverCount':thisPage},function(data){
				$.each(data,function(index,obj){
					$(tbdy).append("<tr>"+ "<td>"+obj.account+"</td>"+ "<td>"+obj.passwd+"</td>"+ "<td>"+obj.familyName+"</td>" + "<td>"+obj.name+"</td>" +"</hr>");	
				});
			});
			
		};
		
		nowPage();
		
		// 				                 <!--Ajax方法-->
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