<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>所有捐款人資訊</title>


<style>
.draggable {
	width: 150px;
	height: 150px;
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
	<button onclick="load()">Surprise</button>
	
	<!--無聊一下 -->
	<div class="draggable" style="border: 1px solid blue;">
		<p>Drag me around</p>
	</div>
	<div class="draggable" style="border: 1px solid red;">
		<p>Hello</p>
	</div>


	<script>
		function load() {
			var xmlhttp;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			var url = "http://localhost:8080/softleader-iii-eeit78/giver/giverSelect!selectAll";

			xmlhttp.open("get", url, true);
			xmlhttp.send();

			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					console.log($.getJSON())
					var JsonObject = JSON.parse(xmlhttp.responseText);
					console.log(JsonObject);//console
				}
			}
		}
	</script>





	
	
	
</body>
</html>