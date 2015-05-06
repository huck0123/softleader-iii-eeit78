<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/giver.css">
<style>
th {
	width: 200px;
}

#btnn {
	text-align: center;
	vertical-align: bottom;
}
</style>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>管理者-所有團體資訊</title>


</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<br>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2">
			<input type="checkbox" class="searchcheck" value="name">團體名稱 : 
			<input type="text" class="searchtext" size="10" placeholder="依名稱搜尋">
		</div>
		<div class="col-md-2">
			<input type="checkbox" class="search" value="account">團體帳號 : 
			<input type="text" class="searchtext" size="10" placeholder="依帳號搜尋">
		</div>
		<div class="col-md-3">
			<input type="checkbox" class="search" value="email">電子信箱 : 
			<input type="text" class="searchtext" size="20" placeholder="依信箱搜尋">
		</div>
		<div class="col-md-2">
			<input type="button" name="searchbtn" value="查詢" id="btnsch"> 
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table table-condensed table-bordered">
				<tr>
					<th style="width: 10px"></th>
					<th style="width: 100px">團體名稱</th>
					<th>帳號</th>
					<th style="width: 100px">電話</th>
					<th>信箱</th>
					<th>黑名單</th>
				</tr>
				<tbody id="tbody">
				</tbody>
			</table>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div id= "detail"></div>
	<div id= "btnn">
		<input type="button" name="forward" value="上一頁" id="btnf"> 
		<input type="tel" name="now" size="1" value="1" id="btnw"> 
		<input type="button" name="next" value="下一頁" id="btnx"> 
		<a href="<c:url value='/index.jsp' />">回首頁</a>
	</div>
	<script>
	
	
		var url = "/softleader-iii-eeit78/raiser/raiserSelectAll!getPerPage";
		$.post(url, getData);
		
		

		var page = $("#btnw").val();
		var Max = Math.ceil("${raiserCount}" / 3);
		$("#btnx").before("/" + Max + "\t");
		var test = true ;
		
		//以下分頁用
		//用數字輸入可搜尋頁數
		$("#btnw").change(function() {
			if ($("#btnw").val() <= Max && $("#btnw").val()>0) {
				page = $("#btnw").val();
			} else {
				$("#btnw").val("1");
				page=1;
			}
			$('#detail').children().remove();
			test = true;
			$('#tbody').children().remove();
			$.post(url, {
				'page' : page
			}, getData);
		});

		//點上一頁
		$("#btnf").click(function() {
			if ($("#btnw").val() > 1) {
				page--;
				$("#btnw").val(page);
				$('#detail').children().remove();
				test = true;
				$('#tbody').children().remove();
				$.post(url, {
					'page' : page
				}, getData);
			}
		});

		//點下一頁
		$("#btnx").click(function() {
			if ($("#btnw").val() < Max) {
				page++;
				$("#btnw").val(page);
				$('#detail').children().remove();
				test = true;
				$('#tbody').children().remove();
				$.post(url, {
					'page' : page
				}, getData);
			}
		});
		
		
		//顯示部分內容點選圖式顯示全部內容
		function getData(data) {
			
			
 			data = JSON.parse(data);
 			
 			
 			$(data).each(
					function(index, raiser) {
						
						
						var srclogo = arrayBufferToBase64(raiser.logo); 
						
						
						var stAll = "<tr><td id='test'><span id='spanpic"+raiser.id+"' class='glyphicon glyphicon-folder-close spanpic' ></span></td>"
						+ "<td>" + raiser.name + "</td>"
						+ "<td>" + raiser.account + "</td>"
						+ "<td>" + raiser.tel + "</td>"
						+ "<td>" + raiser.email + "</td>";
 						var lock = raiser.valid;
						
						if(lock){
							var st1 = "<button id='btnStop"+raiser.id+"' class='btn btn-warning'><span class='glyphicon glyphicon-ban-circle' id='spanCk"+raiser.id+"'></span>　封鎖</button><button id='btnCk"+raiser.id+"' class='btn btn-danger' style='display:none'>確定封鎖他?</button>";
							stAll += "<td id='tdCk"+raiser.id+"'>" + st1 + "</td></tr>";
						}else {
							var st2 = "<button id='btnStop"+raiser.id+"' class='btn btn-danger'>解除封鎖</button><button id='btnCk"+raiser.id+"' class='btn btn-danger' style='display:none'>是否解除封鎖</button>";
							stAll += "<td id='tdCk"+raiser.id+"'>" + st2 + "</td></tr>";
						}
						
						$(tbody).prepend(stAll);
						$("#test").click(function(){
							if(test){
								test = false; 
								
								
								var str = "<img src='' class='img-thumbnail' id='logo' style='width:80px; height:80px'>";
								
								
								
								$("#spanpic"+raiser.id).removeClass("glyphicon glyphicon-folder-close").addClass("glyphicon glyphicon-folder-open");
								$("#detail").children().remove();
								$("#detail").append(
									"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>" +str+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  帳 號:　"+raiser.account+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  名 稱:　"+raiser.name+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  電 話:　"+raiser.tel+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>聯絡人姓名:　"+raiser.contactPerson+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>聯絡人電話:　"+raiser.contactTel+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>電 子  信 箱:　"+raiser.email+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  地 址:　"+raiser.address+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  短 片:　"+raiser.videoUrl+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-8'>團 體  資 訊:</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-5'>　　"+raiser.detail+ "</div></div>"
								);
								
								
								$("#logo").attr("src","data:image/png;base64," + srclogo);	


							}else{
								$("#detail").children().remove();	
								$(".spanpic").removeClass("glyphicon glyphicon-folder-open").addClass("glyphicon glyphicon-folder-close");
								test = true;
								}
						});
						var url2 = "/softleader-iii-eeit78/raiser/raiserSelectAll!checkInformation";
						
						$("#btnStop"+raiser.id).click(function(){
							console.log(0)
							$( "#btnCk"+raiser.id ).show(70);
							console.log(1)
							$( "#btnCk"+raiser.id ).click(function(){
								console.log(2)
								if(lock){
									console.log(3)
									lock=false;
// 									$.post(url2, {
// 										'account' : raiser.account,
// 										'lock' : lock
// 									}, getData,"json");
									$("#btnStop"+raiser.id).removeClass("btn btn-warning").addClass('btn btn-danger').text("解除封鎖");
									$( "#btnCk"+raiser.id ).text("是否解除封鎖");
									console.log(4)
									return;
								}else {
									console.log(5)
									lock=true;
// 									$.post(url2, {
// 										'account' : raiser.account,
// 										'lock' : lock
// 									}, getData ,"json");
									$("#btnStop"+raiser.id).removeClass("btn btn-danger").addClass('btn btn-warning').html("<span class='glyphicon glyphicon-ban-circle' id='spanCk"+raiser.id+"'></span>　封鎖");
									$( "#btnCk"+raiser.id ).text("確定封鎖他?");
									console.log(6)
									return;
									}
							});
						});
					});
		};
		
		
		//以下搜尋相關
// 		$("#btnsch").click(function(){
// 			var urlCount = "/softleader-iii-eeit78/raiser/raiserSelectAll!getByConditionCount";
// 			console.log()
// 			Max = Math.ceil("${resultCount}" / 3);
// 		});
	</script>

</body>