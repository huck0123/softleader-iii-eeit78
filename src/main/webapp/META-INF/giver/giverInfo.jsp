<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>���ت̸�T�ק�</title>

<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/giver.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<!-- <script type="text/javascript" src="/softleader-iii-eeit78/js/giver.js " charset="UTF-8"></script> -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
</head>
<body>
	<div>
		<a href="http://localhost:8080/softleader-iii-eeit78/index.jsp">�^����</a>
	</div>

	<div class="row">
		<div class="col-md-2"></div>
		<div class="container col-md-8">
			<h2>${sessionScope.giver.familyName }${sessionScope.giver.name }�z�n</h2>
			<div><img src="" class="img-circle" id="headshot" style="width:80px; height:80px"></div>
			
			<form action='/softleader-iii-eeit78/giver/giverAction!update.action'
				method="post" enctype="multipart/form-data">
				<table class="table table-condensed">
					<tr>
						<td><label for="">�b��:</label></td>
						<td><input type="text" name="form.account"
							value="${sessionScope.giver.account }" required="required"></td>
					</tr>
					<tr>
						<td><label for="">�K�X:</label></td>
						<td><input type="password" name="form.passwd"
							value="${sessionScope.giver.passwd }" required="required"></td>
					</tr>
					<tr>
						<td><label for="">�m:</label></td>
						<td><input type="text" name="form.familyName"
							value="${sessionScope.giver.familyName }"></td>
					</tr>
					<tr>
						<td><label for="">�W�r:</label></td>
						<td><input type="text" name="form.name"
							value="${sessionScope.giver.name }"></td>
					</tr>
					<tr>
						<td><label for="">�ʧO:</label></td>
						<td id="gender"></td>
					</tr>
					<tr>
						<td><label for="">�����Ҧr��:</label></td>
						<td>${sessionScope.giver.idNumber }</td>
					</tr>
					<tr>
						<td><label for="">���:</label></td>
						<td><input type="text" name="form.tel"
							value="${sessionScope.giver.tel }"></td>
					</tr>
					<tr>
						<td><label for="">��}:</label></td>
						<td><input type="text" name="form.address"
							value="${sessionScope.giver.address }"></td>
					</tr>
					<tr>
						<td><label for="">Email:</label></td>
						<td><input type="email" name="form.email"
							value="${sessionScope.giver.email }"></td>
					</tr>
					<tr>
						<td><label for="">�O�_��o��T:</label></td>
						<td><input type="radio" name="form.get_info" value="true"
							id="getInfo1">�O <input type="radio" name="form.get_info"
							value="false" id="getInfo2">�_</td>
					</tr>
					<tr>
						<td><label for="">�ͤ�:</label></td>
						<td>${sessionScope.giver.birth }</td>
					</tr>
					<tr>
						<td><label for="">�Ӥ�:</label></td>
						<td><input type="file" name="form.headshot" value=""></td>
					</tr>
					<tr>
						<td><input type="submit" value="�e�X"></td>
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