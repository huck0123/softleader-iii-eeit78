<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊成功</title>

<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/giver.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</head>
<body>
	<div>
		<a href="http://localhost:8080/softleader-iii-eeit78/index.jsp">回首頁</a>
	</div>
	<h2>註冊成功</h2>

	<div class="container">
		<div>
			<img src="" class="img-circle" id="headshot"
				style="width: 80px; height: 80px">
		</div>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td>帳號:</td>
					<td>${sessionScope.giver.account }</td>
				</tr>
				<tr>
					<td>密碼</td>
					<td>${sessionScope.giver.passwd }</td>
				</tr>
				<tr>
					<td>姓名</td>
					<td>${sessionScope.giver.familyName }${sessionScope.giver.name }</td>
				</tr>
				<tr>
					<td>性別</td>
					<td id="gender"></td>
				</tr>
				<tr>
					<td>身分證號碼</td>
					<td>${sessionScope.giver.idNumber }</td>
				</tr>
				<tr>
					<td>手機號碼</td>
					<td>${sessionScope.giver.tel }</td>
				</tr>
				<tr>
					<td>地址</td>
					<td>${sessionScope.giver.address }</td>
				</tr>
				<tr>
					<td>email</td>
					<td>${sessionScope.giver.email }</td>
				</tr>
				<tr>
					<td>獲得資訊</td>
					<td id="getInfo"></td>
				</tr>
				<tr>
					<td>生日</td>
					<td>${sessionScope.giver.birth }</td>
				</tr>
			</tbody>
		</table>
	</div>

	<script>
	
		function getInformation() {
			$('#gender').text(gender(${sessionScope.giver.gender}));
			$('#getInfo').text(getInfo(${sessionScope.giver.getInfo}));

			var url = "http://localhost:8080/softleader-iii-eeit78/giver/giverSelect!select";
			var thisAccount = "${sessionScope.giver.account}";
			
			function getData(data){
				console.log(data);
				var str = arrayBufferToBase64(data.headshot); 
				$('#headshot').attr("src","data:image/png;base64," + str);
			}
			$.getJSON(url, {'thisAccount': thisAccount }, getData);

		}
		getInformation();

		//		function load() {
		// 			var xmlhttp;
		// 			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		// 				xmlhttp = new XMLHttpRequest();
		// 			} else {// code for IE6, IE5
		//				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		// 			}

		// 			var url = "http://localhost:8080/softleader-iii-eeit78/giver/giverSelect!select";

		// 			xmlhttp.open("get", url, true);
		// 			xmlhttp.send();

		// 			xmlhttp.onreadystatechange = function() {

		// 				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		// 					var JsonObject = JSON.parse(xmlhttp.responseText);

		// 					console.log(JsonObject);//console

		// 					var tbdy = document.getElementById("tbdy");
		// 					while (tbdy.hasChildNodes()){
		// 						tbdy.removeChild(tbdy.firstChild);
		// 					}

		// 					var tr1 = document.createElement("tr");
		// 					var td1 = document.createElement("td");
		// 					td1.innerHTML = "帳號:";
		// 					var td2 = document.createElement("td");
		// 					td2.innerHTML = JsonObject.account;
		// 					tr1.appendChild(td1);
		// 					tr1.appendChild(td2);

		// 					var tr2 = document.createElement("tr");
		// 					var td3 = document.createElement("td");
		// 					td3.innerHTML = "密碼:";
		// 					var td4 = document.createElement("td");
		// 					td4.innerHTML = JsonObject.passwd;
		// 					tr2.appendChild(td3);
		// 					tr2.appendChild(td4);

		// 					var tr3 = document.createElement("tr");
		// 					var td5 = document.createElement("td");
		// 					td5.innerHTML = "姓:";
		// 					var td6 = document.createElement("td");
		// 					td6.innerHTML = JsonObject.familyName;
		// 					tr3.appendChild(td5);
		// 					tr3.appendChild(td6);

		// 					var tr4 = document.createElement("tr");
		// 					var td7 = document.createElement("td");
		// 					td7.innerHTML = "名字:";
		// 					var td8 = document.createElement("td");
		// 					td8.innerHTML = JsonObject.name;
		// 					tr4.appendChild(td7);
		// 					tr4.appendChild(td8);

		// 					var tr5 = document.createElement("tr");
		// 					var td9 = document.createElement("td");
		// 					td9.innerHTML = "性別:";
		// 					var td10 = document.createElement("td");
		// 					td10.innerHTML = JsonObject.gender;
		// 					tr5.appendChild(td9);
		// 					tr5.appendChild(td10);

		// 					var tr6 = document.createElement("tr");
		// 					var td11 = document.createElement("td");
		// 					td11.innerHTML = "身分證字號:";
		// 					var td12 = document.createElement("td");
		// 					td12.innerHTML = JsonObject.id_number;
		// 					tr6.appendChild(td11);
		// 					tr6.appendChild(td12);

		// 					var tr7 = document.createElement("tr");
		// 					var td13 = document.createElement("td");
		// 					td13.innerHTML = "手機:";
		// 					var td14 = document.createElement("td");
		// 					td14.innerHTML = JsonObject.tel;
		// 					tr7.appendChild(td13);
		// 					tr7.appendChild(td14);

		// 					var tr8 = document.createElement("tr");
		// 					var td15 = document.createElement("td");
		// 					td15.innerHTML = "住址:";
		// 					var td16 = document.createElement("td");
		// 					td16.innerHTML = JsonObject.address;
		// 					tr8.appendChild(td15);
		// 					tr8.appendChild(td16);

		// 					var tr9 = document.createElement("tr");
		// 					var td17 = document.createElement("td");
		// 					td17.innerHTML = "Email:";
		// 					var td18 = document.createElement("td");
		// 					td18.innerHTML = JsonObject.email;
		// 					tr9.appendChild(td17);
		// 					tr9.appendChild(td18);

		// 					var tr10 = document.createElement("tr");
		// 					var td19 = document.createElement("td");
		// 					td19.innerHTML = "是否獲得資訊:";
		// 					var td20 = document.createElement("td");
		// 					td20.innerHTML = JsonObject.get_info;
		// 					tr10.appendChild(td19);
		// 					tr10.appendChild(td20);

		// 					var tr11 = document.createElement("tr");
		// 					var td21 = document.createElement("td");
		// 					td21.innerHTML = "生日:";
		// 					var td22 = document.createElement("td");
		// 					td22.innerHTML = JsonObject.birth;
		// 					tr11.appendChild(td21);
		// 					tr11.appendChild(td22);

		// 					tbdy.appendChild(tr1);
		// 					tbdy.appendChild(tr2);
		// 					tbdy.appendChild(tr3);
		// 					tbdy.appendChild(tr4);
		// 					tbdy.appendChild(tr5);
		// 					tbdy.appendChild(tr6);
		// 					tbdy.appendChild(tr7);
		// 					tbdy.appendChild(tr8);
		// 					tbdy.appendChild(tr9);
		// 					tbdy.appendChild(tr10);
		// 					tbdy.appendChild(tr11);

		// 				}
		// 			}
		// 		}
	</script>

</body>
</html>