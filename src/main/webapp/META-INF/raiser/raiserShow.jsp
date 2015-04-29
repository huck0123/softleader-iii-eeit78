<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>�޲z��-�Ҧ������T</title>


</head>
<body>
	<table class="table table-striped table-condensed">
		<tr>
			<th>#</th>
			<th>����W��</th>
			<th>�b��</th>
			<th>�K�X</th>
			<th>�H�c</th>
		</tr>
		<tbody id="tbody">

		</tbody>
	</table>
	<input type="button" name="forward" value="�W�@��" id="btnf">
	<input type="text" name="now" size="1" value="1" id="btnw">
	<input type="button" name="next" value="�U�@��" id="btnx">
	<a href="<c:url value='/index.jsp' />">�^����</a>
	<script>
	var url = "/softleader-iii-eeit78/raiser/raiserSelectAll!getPerPage";
	$.getJSON(url,getData);
		
		var page = $("#btnw").val();
		var Max =  Math.ceil("${raiserCount}"/3);
		$("#btnx").before("/"+Max+"\t");
		
 		
 		//�μƦr��J�i�j�M����
 		$("#btnw").change(function(){
 			if($("#btnw").val()<=Max){
 				page = $("#btnw").val();
 				}else{
 					page = $("#btnw").val("1");
 					}
 			$('#tbody').children().remove();
     		$.getJSON(url,{'page':page},getData);
 		});
 		
 		//�I�W�@��
 		$("#btnf").click(function(){
			if($("#btnw").val()>1){
				page--;
				$("#btnw").val(page);
				$('#tbody').children().remove();
				$.getJSON(url,{'page':page},getData);
			}
		});
		
 		//�I�U�@��
		$("#btnx").click(function(){
			if($("#btnw").val()<Max){
				page++;
				$("#btnw").val(page);
				$('#tbody').children().remove();
				$.getJSON(url,{'page':page},getData);
			}
		});
 		
		function getData(data){
			$(data).each(function(index,raiser){
				$(tbody).append("<tr>"
						+ "<td><button id='btnAll'>��ܥ���</button></td>"
						+ "<td><a>" + raiser.name +"</a></td>" 
						+ "<td>"+ raiser.account +"</td>"
						+ "<td>"+ raiser.passwd +"</td>"
						+ "<td>"+ raiser.email +"</td>" 
						)
			});
		};
	</script>

</body>