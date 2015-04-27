<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>捐贈者資訊修改</title>

<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/giver.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<!-- <script type="text/javascript" src="/softleader-iii-eeit78/js/giver.js " charset="UTF-8"></script> -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
</head>
<body>
	<div>
		<a href="http://localhost:8080/softleader-iii-eeit78/index.jsp">回首頁</a>
	</div>

	<div class="row">
		<div class="col-md-2"></div>
		<div class="container col-md-8">
			<h2>${sessionScope.giver.familyName }${sessionScope.giver.name }您好</h2>
			<div><img src="" class="img-circle" id="headshot" style="width:80px; height:80px"></div>
			
			<form action='/softleader-iii-eeit78/giver/giverAction!insert.action'
				method="post" enctype="multipart/form-data">
				<table class="table table-condensed">
					<tr>
						<td><label for="">帳號:</label></td>
						<td><input type="text" name="form.account"
							value="${sessionScope.giver.account }" required="required"></td>
					</tr>
					<tr>
						<td><label for="">密碼:</label></td>
						<td><input type="password" name="form.passwd"
							value="${sessionScope.giver.passwd }" required="required"></td>
					</tr>
					<tr>
						<td><label for="">姓:</label></td>
						<td><input type="text" name="form.familyName"
							value="${sessionScope.giver.familyName }"></td>
					</tr>
					<tr>
						<td><label for="">名字:</label></td>
						<td><input type="text" name="form.name"
							value="${sessionScope.giver.name }"></td>
					</tr>
					<tr>
						<td><label for="">性別:</label></td>
						<td id="gender"></td>
					</tr>
					<tr>
						<td><label for="">身分證字號:</label></td>
						<td>${sessionScope.giver.idNumber }</td>
					</tr>
					<tr>
						<td><label for="">手機:</label></td>
						<td><input type="text" name="form.tel"
							value="${sessionScope.giver.tel }"></td>
					</tr>
					<tr>
						<td><label for="">住址:</label></td>
						<td><input type="text" name="form.address"
							value="${sessionScope.giver.address }"></td>
					</tr>
					<tr>
						<td><label for="">Email:</label></td>
						<td><input type="email" name="form.email"
							value="${sessionScope.giver.email }"></td>
					</tr>
					<tr>
						<td><label for="">是否獲得資訊:</label></td>
						<td><input type="radio" name="form.get_info" value="true"
							id="getInfo1">是 <input type="radio" name="form.get_info"
							value="false" id="getInfo2">否</td>
					</tr>
					<tr>
						<td><label for="">生日:</label></td>
						<td>${sessionScope.giver.birth }</td>
					</tr>
					<tr>
						<td><label for="">照片:</label></td>
						<td><input type="file" name="form.headshot" value=""></td>
					</tr>
					<tr>
						<td><input type="submit" value="送出"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
	
	<script>
		
		function getInformation(){
			$('#gender').text(gender(${sessionScope.giver.gender}));
			
			var getInfo = ${sessionScope.giver.getInfo};
			if(getInfo){
				$('#getInfo1').prop("checked", true);
			}else{
				$('#getInfo2').prop("checked", true);
			}
			
			var url = "http://localhost:8080/softleader-iii-eeit78/giver/giverSelect!select";
			function getData(data){
				var str = arrayBufferToBase64(data.headshot); 
				$('#headshot').attr("src","data:image/png;base64," + str);
			}
			$.getJSON(url, {'thisAccount': '${sessionScope.giver.account}' }, getData);
		}
		getInformation();
				
		
	</script>
</body>
</html>