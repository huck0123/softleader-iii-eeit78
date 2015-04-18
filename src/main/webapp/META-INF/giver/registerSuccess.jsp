<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html >
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<title>註冊成功</title>
</head>
<body>
	<h2>註冊成功</h2>
	<!-- 	<div id="myDiv"> -->
	<h2>Let AJAX change this text</h2>

	<button type="button" onclick="load()">Change Content</button>
	<table id="myTable" class="table">
		
	</table>
	<!-- 	</div> -->

	<script>
		function load() {
			var xmlhttp;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			var url = "http://localhost:8080/softleader-iii-eeit78/giver/giverSelect!select";

			xmlhttp.open("get", url, true);
			xmlhttp.send();

			xmlhttp.onreadystatechange = function() {

				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var JsonObject = JSON.parse(xmlhttp.responseText);
					
					var myTable = document.getElementById("myTable");
					while (myTable.hasChildNodes()){
						myTable.removeChild(myTable.firstChild);
					}
					
					var tr1 = document.createElement("tr");
					var td1 = document.createElement("td");
					td1.innerHTML = "帳號";
					var td2 = document.createElement("td");
					td2.innerHTML = JsonObject.account;
					tr1.appendChild(td1);
					tr1.appendChild(td2);

					var tr2 = document.createElement("tr");
					var td3 = document.createElement("td");
					td3.innerHTML = "密碼:";
					var td4 = document.createElement("td");
					td4.innerHTML = JsonObject.passwd;
					tr2.appendChild(td3);
					tr2.appendChild(td4);

					var tr3 = document.createElement("tr");
					var td5 = document.createElement("td");
					td5.innerHTML = "姓:";
					var td6 = document.createElement("td");
					td6.innerHTML = JsonObject.familyName;
					tr3.appendChild(td5);
					tr3.appendChild(td6);

					var tr4 = document.createElement("tr");
					var td7 = document.createElement("td");
					td7.innerHTML = "名字:";
					var td8 = document.createElement("td");
					td8.innerHTML = JsonObject.name;
					tr4.appendChild(td7);
					tr4.appendChild(td8);

					var tr5 = document.createElement("tr");
					var td9 = document.createElement("td");
					td9.innerHTML = "性別:";
					var td10 = document.createElement("td");
					td10.innerHTML = JsonObject.gender;
					tr5.appendChild(td9);
					tr5.appendChild(td10);

					var tr6 = document.createElement("tr");
					var td11 = document.createElement("td");
					td11.innerHTML = "身分證字號:";
					var td12 = document.createElement("td");
					td12.innerHTML = JsonObject.id_number;
					tr6.appendChild(td11);
					tr6.appendChild(td12);

					var tr7 = document.createElement("tr");
					var td13 = document.createElement("td");
					td13.innerHTML = "手機:";
					var td14 = document.createElement("td");
					td14.innerHTML = JsonObject.tel;
					tr7.appendChild(td13);
					tr7.appendChild(td14);

					var tr8 = document.createElement("tr");
					var td15 = document.createElement("td");
					td15.innerHTML = "住址:";
					var td16 = document.createElement("td");
					td16.innerHTML = JsonObject.address;
					tr8.appendChild(td15);
					tr8.appendChild(td16);

					var tr9 = document.createElement("tr");
					var td17 = document.createElement("td");
					td17.innerHTML = "Email:";
					var td18 = document.createElement("td");
					td18.innerHTML = JsonObject.email;
					tr9.appendChild(td17);
					tr9.appendChild(td18);

					var tr10 = document.createElement("tr");
					var td19 = document.createElement("td");
					td19.innerHTML = "是否獲得資訊:";
					var td20 = document.createElement("td");
					td20.innerHTML = JsonObject.get_info;
					tr10.appendChild(td19);
					tr10.appendChild(td20);

					var tr11 = document.createElement("tr");
					var td21 = document.createElement("td");
					td21.innerHTML = "生日:";
					var td22 = document.createElement("td");
					td22.innerHTML = JsonObject.birth;
					tr11.appendChild(td21);
					tr11.appendChild(td22);

					
					myTable.className = "table";

					myTable.appendChild(tr1);
					myTable.appendChild(tr2);
					myTable.appendChild(tr3);
					myTable.appendChild(tr4);
					myTable.appendChild(tr5);
					myTable.appendChild(tr6);
					myTable.appendChild(tr7);
					myTable.appendChild(tr8);
					myTable.appendChild(tr9);
					myTable.appendChild(tr10);
					myTable.appendChild(tr11);
				}
			}
		}
	</script>

</body>
</html>