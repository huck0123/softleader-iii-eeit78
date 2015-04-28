<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>管理者-所有團體資訊</title>


</head>
<body>
		<table class="table">
			<tr>
				<th>帳號</th>
				<th>密碼</th>
				<th>團體名稱</th>
				<th>電話</th>
				<th>連絡人姓名</th>
				<th>連絡人電話</th>
				<th>信箱</th>
				<th>圖標</th>
				<th>團體介紹</th>
				<th>團體短片</th>
			</tr>
			<tbody id="tbody">

			</tbody>
		</table>
	<script>
		
	var url = "http://localhost:8080/softleader-iii-eeit78/raiser/raiserSelectAll!selectAll";
	$.getJSON(url,getData);
	
		function getData(data){
			$(data).each(function(index,raiser){
				$(tbody).append("<tr>"
						+ "<td>"+ raiser.account +"</td>"
						+ "<td>"+ raiser.passwd +"</td>"
						+ "<td>"+ raiser.name +"</td>" 
						+ "<td>"+ raiser.tel +"</td>" 
						+ "<td>"+ raiser.contactPerson +"</td>" 
						+ "<td>"+ raiser.contactTel +"</td>" 
						+ "<td>"+ raiser.email +"</td>" 
						+ "<td>"+ raiser.address +"</td>" 
// 						+ "<td>"+ obj.logo +"</td>" 
						+ "<td>"+ raiser.detail +"</td>" 
						+ "<td>"+ raiser.videoUrl +"</td>"
						)
			});
		};
	</script>

</body>
