<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<%-- <script src="/softleader-iii-eeit78/js/giver.js"></script> --%>

<style>
tr th {
	text-align: center;
}
</style>

<title>交易明細</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />

	<div class="container">
		<div class="col-md-2">
			<select id="pageAmount"></select>顯示筆數(預設5筆)
		</div>
		<div class="col-md-8">
			<button id="before" onclick="before()">上一頁</button>
			<select id="page"></select>
			<button id="after" onclick="after()">下一頁</button>
		</div>
		<div class="col-md-2"></div>
		<table class="table table-bordered">
			<tr>
				<th>捐款人ID</th>
				<th>活動名稱</th>
				<th>捐款金額</th>
				<th>捐款日期</th>
				<th>信用卡種類</th>
				<th>卡號</th>
				<th>卡片持有人</th>
				<th>卡片持有人Email</th>
				<th>是否收到帳款</th>
			</tr>

			<tbody id="tbdy">

			</tbody>
		</table>

	</div>

	<script>
		
		var transactionCount = ${applicationScope.transactionCount}; //交易總筆數
		var url = "${pageContext.request.contextPath}/donate/transactionDetailAction!transactionDetail";
		var urlv = "${pageContext.request.contextPath}/donate/transactionDetailAction!credit";
		var pageAmount;
		var pageCount;
		
		load();
		//初始載入頁面
		function load(){
			//建立每頁幾筆選單
			for(var i=1; i<=transactionCount; i++){
				$('#pageAmount').append("<option value='"+ i +"'>"+ i +"</option>");
			}

			$('#pageAmount').val(5);  //預設一頁五筆
			pageAmount = $('#pageAmount').val();
			pageCount = transactionCount/pageAmount;
	
			//建立select選單
			for(var i=1; i<pageCount+1; i++){
				$('#page').append("<option value='"+ i +"'>"+ i +"</option>");	
			}
		
			//載入第一頁
			$.post(url,{'thisPage':1,'pageAmount':pageAmount}, getData);
		}
		
		function onload(){
	
			pageAmount = $('#pageAmount').val();
			pageCount = transactionCount/pageAmount;
			
			//清除page select選單
			$('#page').empty();
			
			//建立page select選單
			for(var i=1; i<pageCount+1; i++){
				$('#page').append("<option value='"+ i +"'>"+ i +"</option>");	
			}
		
		}
		
		$('#pageAmount').on("change", function(){
			$(this).prop("disabled",true);
			$('#tbdy').empty();
			pageAmount = $(this).val();
			onload();
			var thisPage = $('#page').val();			
			$.post(url,{'thisPage':thisPage,'pageAmount':pageAmount}, getData);
		});
		
		
		function getData(data){
			data = JSON.parse(data);
			$.each(data, function(index,obj){
				$(tbdy).append("<tr>"
						+"<td>"+ obj.giverId +"</td>"
						+"<td>"+ obj.campaignModel.name +"</td>"
						+"<td>"+ obj.amount +"</td>"
						+"<td>"+ obj.date +"</td>"
						+"<td>"+ obj.cardType +"</td>"
						+"<td>"+ obj.cardNo +"</td>"
						+"<td>"+ obj.cardHolder +"</td>"
						+"<td>"+ obj.cardHolderEmail +"</td>"
						+"<td>"+ "<input type='checkbox' id='"+ obj.id +"' value='"+ obj.credit +"'>" +"<span class='"+ obj.id +"'></span>" +"</td>"
						+"</tr>");	
				valid(obj.id, obj.credit);
				
				$('#before').prop("disabled", false);
				$('#after').prop("disabled", false);
				$('#page').prop("disabled", false);
				$('#pageAmount').prop("disabled", false);
			})
			
		};
		
		
		// 系統管理員管理是否收到帳款
		function valid(id, credit){
			if(credit == true){
				$('#'+id).prop("checked", true);
				$('.'+id).text("true");
			}else{
				$('#'+id).prop("checked", false);
				$('.'+id).text("false");
			}
			
			$('#'+id).on('change', function(){
				var temp = $(this).val();
				if(temp == "true"){
					$.post(urlv, { 'thisId':id, 'credit':false});
					$(this).val("false");
					$('.'+id).text("false");
				}else{
					$.post(urlv, { 'thisId':id, 'credit':true});
					$(this).val("true");
					$('.'+id).text("true");
				}
			})
		};
		

		//選擇第幾頁
		$('#page').on("change", function(){
			$(this).prop("disabled",true);
			$('#tbdy').empty();
			var temp = $(this).val();
			$.post(url,{'thisPage':temp,'pageAmount':pageAmount},getData);
		});

		//上一頁
		function before(){
			$('#before').prop("disabled", true);
			var thisPage = $('#page').val();
			if(thisPage > 1){
				thisPage--;
				
				$('#page').val(thisPage);
				$('#tbdy').empty();
				$.post(url,{'thisPage':thisPage,'pageAmount':pageAmount},getData);
			}
		};

		//下一頁
		function after() {
			$('#after').prop("disabled", true);
			var thisPage = $('#page').val();
			if(thisPage < pageCount ){
				thisPage++;
				
				$('#page').val(thisPage);
				$('#tbdy').empty();
				$.post(url,{'thisPage':thisPage,'pageAmount':pageAmount},getData);
			}
		};
		
		
	</script>


</body>
</html>