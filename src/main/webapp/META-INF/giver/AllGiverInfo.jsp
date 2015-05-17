<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理員專區</title>

<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/giver.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>

<style>
tr th {
	text-align: center;
}
</style>

</head>
<body id="body">

	<jsp:include page="../../header.jsp" />
	<div class="container">
		<ul class="nav nav-tabs" role="tablist">
			<li class="active"><a href="#AllgiverInfo">所有捐款人資訊</a></li>
			<li><a href="#raiserShow">管理團體資訊</a></li>
			<li><a href="#campaignAdmin">管理活動</a></li>
			<li><a href="#transactionDetail">顯示所有交易紀錄</a></li>
		</ul>
		<div class="tab-content">
		
			<div class="panel alert tab-pane fade in active" id="AllgiverInfo">
				<div class="row">
					<div class="col-md-3">
						<select id="pageAmount"></select>顯示筆數(預設5筆)
					</div>
					<div class="col-md-6">
						<button class="btn btn-primary" id="before" onclick="before()">上一頁</button>
						<select id="page"></select>
						<!-- 		<button onclick="nowPage()" value="1" id="page">本頁</button> -->
						<button class="btn btn-primary" id="after" onclick="after()">下一頁</button>
					</div>
					<div class="col-md-3">
						<input type="text" class="form-control" id="condition"
							placeholder="請輸入搜尋條件">
						<!-- 				<button onclick="search()">查詢</button> -->
					</div>
				</div>


				<table class="table table-bordered">
					<tr>
						<th>大頭貼</th>
						<th>帳號</th>
						<!-- 				<th>密碼</th> -->
						<th>姓</th>
						<th>名字</th>
						<th>性別</th>
						<!-- 				<th>身分證號碼</th> -->
						<th>手機號碼</th>
						<th>地址</th>
						<th>email</th>
						<th>獲得資訊</th>
						<th>validate</th>
						<!-- 				<th>生日</th> -->
					</tr>
					<tbody id="tbdy">


					</tbody>
				</table>
			</div>
			
			<jsp:include page="/META-INF/raiser/raiserShow.jsp" />
			<jsp:include page="/META-INF/campaign/campaignAdmin.jsp" />
			<jsp:include page="/META-INF/donate/transactionDetail.jsp" />
			
		</div>
	</div>

	<script>
		//tab
		$('.nav-tabs a').click(function(){
		    $(this).tab('show');
		});
	</script>

	<script>
		
		var giverCount = ${applicationScope.giverCount};
// 		console.log(${applicationScope.giverCount});
	
		var url = "${pageContext.request.contextPath}/giver/giverSelect!giverDetail";
		var urlc = "${pageContext.request.contextPath}/giver/giverSelect!conditionCount";
		var urlv = "${pageContext.request.contextPath}/giver/giverAction!valid";
// 		console.log(${pageContext.request.contextPath})
		var pageAmount;
		var pageCount;
		var condition = null;
						
		load();
		
		
		//初始載入
		function load(){
			$('#page').empty();
			$('#pageAmount').empty();
			
			//建立一頁顯示幾筆選單
			for(var i=1; i<=giverCount; i*=5){
				$('#pageAmount').append("<option value='"+ i +"'>"+ i +"</option>");
			}
			
			if(giverCount >= 5){
				//預設一頁五筆
				$('#pageAmount').val(5);
			}else{
				$('#pageAmount').val(giverCount);
			}
			
			pageAmount = $('#pageAmount').val();
			pageCount = giverCount/pageAmount;

			//建立page選單
			for(var i=1; i<pageCount+1; i++){
				$('#page').append("<option value='"+ i +"'>"+ i +"</option>");	
			}
			
			//載入第一頁
			$.post(url,{'thisPage':1, 'pageAmount':pageAmount, 'condition':condition},getData);
		}
		
		//條件收尋
		$('#condition').keyup(function(){
			condition = $('#condition').val();	
			//抓取條件收尋總筆數
			$.post(urlc,{'condition':condition}, function(data){
				data = JSON.parse(data);
				giverCount = data.condition;
				load();
			});
		});

		
// 		//條件收尋     ------deprecated--------
// 		function search(){
// 			condition = $('#condition').val();	
			
// 			//抓取條件收尋總筆數
// 			$.post(urlc,{'condition':condition}, function(data){
// 				data = JSON.parse(data);
// 				giverCount = data.condition;
// 				console.log("search"+giverCount);
// 				load();
// 			});
// 		}
		
		//一頁顯示筆數
		$('#pageAmount').on("change", function(){
			pageAmount = $(this).val();
			onload();
		});
			
		function onload(){
			$('#page').empty();
			
			pageCount = giverCount/pageAmount;
			
			//建立page選單
			for(var i=1; i<pageCount+1; i++){
				$('#page').append("<option value='"+ i +"'>"+ i +"</option>");	
			}
			thisPage = $('#page').val();
			$.post(url, {'thisPage':thisPage, 'pageAmount':pageAmount, 'condition':condition},getData);
		}
		
		
		function getData(data){
			$('#tbdy').empty();
			data = JSON.parse(data);
// 			console.log(data)
			$.each(data,function(index,obj){
				$(tbdy).append("<tr>"
						+ "<td><img src='' class='img-circle' id='"+ obj.id +"'	style='width: 80px; height: 80px'></td>"
						+ "<td>"+ obj.account +"</td>"
// 						+ "<td>" +obj.passwd +"</td>"
						+ "<td>"+ obj.familyName +"</td>" 
						+ "<td>"+ obj.name +"</td>" 
						+ "<td>"+ gender(obj.gender) +"</td>" 
// 						+ "<td>"+ obj.idNumber +"</td>" 
						+ "<td>"+ obj.tel +"</td>" 
						+ "<td>"+ obj.address +"</td>" 
						+ "<td>"+ obj.email +"</td>" 
						+ "<td>"+ getInfo(obj.getInfo) +"</td>" 
// 						+ "<td>"+ obj.birth +"</td>" 
						+ "<td>"+ "<input type='checkbox' id='"+ obj.account +"' value='"+ obj.valid +"'>" +"<span class='"+ obj.account +"'></span>" +"</td>"
						+ "</tr>");	
				valid(obj.account, obj.valid);
				
				if(obj.headshot != null){
				var str = arrayBufferToBase64(obj.headshot); 
				$('#'+obj.id).attr("src","data:image/png;base64," + str);
				}
			});
			
// 			$('#before').prop("disabled", false);
// 			$('#after').prop("disabled", false);
// 			$('#page').prop("disabled", false);
		};
		
		// 系統管理員管理giver驗證
		function valid(account, valid){
			if(valid == true){
				$('#'+account).prop("checked", true);
				$('.'+account).text("true");
			}else{
				$('#'+account).prop("checked", false);
				$('.'+account).text("false");
			}
			
			$('#'+account).on('change', function(){
				var temp = $(this).val();
				if(temp == "true"){
					$.post(urlv, { 'thisAccount':account, 'valid':false});
					$(this).val("false").val();
					$('.'+account).text("false");
				}else{
					$.post(urlv, { 'thisAccount':account, 'valid':true});
					$(this).val("true").val();
					$('.'+account).text("true");
				}
			})
		}
		
		//選擇第幾頁
		$('#page').on("change", function(){
// 			$(this).prop("disabled",true);
			
			var temp = $(this).val();
			$.post(url,{'thisPage':temp, 'pageAmount':pageAmount, 'condition':condition},getData);
			console.log(temp);
		});
		
		//上一頁
		function before(){
// 			$('#before').prop("disabled", true);
			
			var thisPage = $('#page').val();
			if(thisPage > 1){
				thisPage--;
				
				$('#page').val(thisPage);
				$.post(url,{'thisPage':thisPage, 'pageAmount':pageAmount, 'condition':condition},getData);
			}
		};
		
		//下一頁
		function after() {
// 			$('#after').prop("disabled", true);
			
			var thisPage = $('#page').val();
			if(thisPage < pageCount ){
				thisPage++;
				
				$('#page').val(thisPage);
				$.post(url,{'thisPage':thisPage, 'pageAmount':pageAmount, 'condition':condition},getData);
			}
		};
		
		
		
		
		
		
		
		
// 		function nowPage(){
// 			var thisPage = $('#page').val();
// 			$('#tbdy').children().remove();
			
// 			$.post(url,{'thisPage':thisPage},getData);
// 		};
		
// 		nowPage();
		
// 		function before(){
// 			var thisPage = $('#page').val();
// 			if(thisPage > 1){
// 				thisPage--;
				
// 				$('#page').val(thisPage);
// 				$('#tbdy').children().remove();
// 				$.post(url,{'thisPage':thisPage},getData);
// 			}
// 		};
		

// 		function after() {
// 			var thisPage = $('#page').val();
// 			if(thisPage < giverCount ){
// 				thisPage++;
				
// 				$('#page').val(thisPage);
// 				$('#tbdy').children().remove();
// 				$.post(url,{'thisPage':thisPage},getData);
// 			}
// 		};
		
		
		
		 				                 <!--Ajax方法-->
		// 		function load() {
		// 			var xmlhttp;
		// 			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		// 				xmlhttp = new XMLHttpRequest();
		// 			} else {// code for IE6, IE5
		// 				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		// 			}

		// 			var url = "http://localhost:8080/softleader-iii-eeit78/giver/giverSelect!selectAll";

		// 			xmlhttp.open("get", url, true);
		// 			xmlhttp.send();

		// 			xmlhttp.onreadystatechange = function() {
		// 				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		// 					console.log($.getJSON())
		// 					var JsonObject = JSON.parse(xmlhttp.responseText);
		// 					console.log(JsonObject);//console
		// 				}
		// 			}
		// 		}
	</script>



</body>
</html>