<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>所有捐款人資訊</title>

</head>
<body>
	<button onclick="load()">Surprise</button>



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