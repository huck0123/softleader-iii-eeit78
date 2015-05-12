<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活動列表</title>
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/giver.css">
	<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<style>
.thumbnail {text-align: justify;}

</style>
</head>
<body id="body">

	<jsp:include page="../../header.jsp" />
	<form action="/softleader-iii-eeit78/campaign/campaignAction" method="post">
		<div class="container panel alert">

			<select id="selectPageSize">
				<option value="5" selected>5</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="all">全部</option>
			</select>
			
			<button type="button" id="before">上一頁</button>
			<span id="pageShow"></span>
			<button type="button" id="after">下一頁</button>
			<input type="submit" value="加入黑名單" name="method:ban">

			<input type="submit" value="解除黑名單" name="method:unban">


			<table class="table table-bordered">
				<tr>
					<th>活動圖片</th>
					<th>活動名稱</th>
					<th>發起團體</th>
					<th>目前金額</th>
					<th>結束日期</th>
					<th>地點</th>
					<th>類型</th>
					<th>validate</th>
					<th></th>
				</tr>
				<tbody id="tbdy">


				</tbody>
			</table>
	</form>
	</div>



</body>


<script>

var totalCount = 0;
var pageSize = 0;
var totalPage = 0;
//0是第一頁
var currentPage =0;
load();

function load(){
	$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllConditionCount',
			{'campaignForm.page':currentPage},function(data){
		totalCount = data;
		setPageSize();
		totalPage = Math.ceil(totalCount / pageSize);
		pageShowAppend();
		tbdyAppend();
	})}

function tbdyAppend(){
	$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
			{'campaignForm.pageNum':currentPage,'campaignForm.name':$('#nameSearch').val(), 'campaignForm.pageSize':pageSize},function(data){
		data = JSON.parse(data);
					$('#tbdy').empty();
		$(data).each(function(index,value){
			$(tbdy).append("<tr>"
					+ "<td><img src='' id='"+value.id+"' class='thumbnail' style='width: 80px; height: 80px'></td>"
					+ "<td>"+ value.name +"</td>"
					+ "<td>"+ value.raiserId +"</td>" 
					+ "<td>"+ value.currentFund +"</td>" 
					+ "<td>"+ value.endDate +"</td>" 
					+ "<td>"+ value.location +"</td>" 
					+ "<td>"+ value.type +"</td>" 
					+ "<td>"+ value.valid +"</td>" 
					+ "<td><input type='checkbox' name='campaignForm.checkbox' value='"+value.id+"'></td>" 
					+"</tr>");
					
			var str = arrayBufferToBase64(value.image); 
			$('#'+value.id).attr("src","data:image/png;base64," + str);
					
		})
	})	
}

function pageShowAppend(){
	$('#pageShow').empty();
	$('#pageShow').append('<input type="text" id="nowPage" style="width:20px;" value="'+(currentPage+1)+'"/>').append(' / '+totalPage);
}

function after(){
	if(currentPage+1 < totalPage){
		currentPage++;
	}
	pageShowAppend();
	tbdyAppend();
}
$('#after').on('click', after);

function before(){
	if(currentPage > 0){
		currentPage--;
	}
	pageShowAppend();
	tbdyAppend();
}
$('#before').on('click', before);

$('#selectPageSize').on('change',load);

function setPageSize(){
	if($('#selectPageSize').val()==="all"){
		pageSize = totalCount;
	} else{
	pageSize = $('#selectPageSize').val();
	}
}

</script>
</html>