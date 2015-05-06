<%@ page language="java" contentType="text/html; charset=UTF-8"
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
body {
	text-align: left;
	}
</style>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�޲z��-�Ҧ������T</title>


</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<br>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-5">
			����W�� : 
			<input type="text" class="searchtext" size="20" placeholder="�̦W�ٷj�M">
			<input type="button" name="searchbtn" value="�d��" id="btnSch" class="btn btn-default"> 
		</div>
		<div class="col-md-4">
			<input type="button" name="clearbtn" value="�M���d�ߵ��G" id="btnClr" class="btn btn-default">
			<input type="button" name="btnValidSch" value="�̶¦W��d��" id="btnValidSch" class="btn btn-default"> 
		</div>
		<div class="col-md-1"></div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table table-condensed table-bordered">
				<tr>
					<th style="width: 10px"></th>
					<th>�b��</th>
					<th style="width: 150px">����W��</th>
					<th style="width: 100px">�q��</th>
					<th>�H�c</th>
					<th>�¦W��</th>
				</tr>
				<tbody id="tbody">
				</tbody>
			</table>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div id= "detail"></div>
	<div id= "btnn">
		<input type="button" name="forward" value="�W�@��" id="btnf"> 
		<input type="tel" name="now" size="1" value="1" id="btnw"> 
		<input type="button" name="next" value="�U�@��" id="btnx"> 
		<a href="<c:url value='/index.jsp' />">�^����</a>
	</div>
	<script>
	
	
		var url = "/softleader-iii-eeit78/raiser/raiserSelectAll!getPerPage";
		$.post(url, getData);
		
		

		var page = $("#btnw").val();
		var Max = Math.ceil("${raiserCount}" / 3);
		$("#btnx").before("/" + Max + "\t");
		var test = true ;
		
		//�H�U������
		//�μƦr��J�i�j�M����
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

		//�I�W�@��
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

		//�I�U�@��
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
		
		
		//��ܳ������e�I��Ϧ���ܥ������e
		function getData(data) {
			
			
 			data = JSON.parse(data);
 			
 			
 			$(data).each(
					function(index, raiser) {
						
						
						var srclogo = arrayBufferToBase64(raiser.logo); 
						
						
						var stAll = "<tr><td id='test'><span id='spanpic"+raiser.id+"' class='glyphicon glyphicon-folder-close spanpic' ></span></td>"
						+ "<td>" + raiser.account + "</td>"
						+ "<td>" + raiser.name + "</td>"
						+ "<td>" + raiser.tel + "</td>"
						+ "<td>" + raiser.email + "</td>";
 						var lock = raiser.valid;
						
						if(lock){
							var st1 = "<button id='btnStop"+raiser.id+"' class='btn btn-warning'><span class='glyphicon glyphicon-ban-circle' id='spanCk"+raiser.id+"'></span>�@����</button>";
							stAll += "<td id='tdCk"+raiser.id+"'>" + st1 + "</td></tr>";
						}else {
							var st2 = "<button id='btnStop"+raiser.id+"' class='btn btn-danger'>�Ѱ�����</button>";
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
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �b ��:�@"+raiser.account+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �W ��:�@"+raiser.name+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �q ��:�@"+raiser.tel+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�p���H�m�W:�@"+raiser.contactPerson+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�p���H�q��:�@"+raiser.contactTel+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�q �l  �H �c:�@"+raiser.email+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �a �}:�@"+raiser.address+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �u ��:�@"+raiser.videoUrl+ "</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-8'>�� ��  �� �T:</div><div class='col-md-3'></div></div>"
									+"<div class='row'><div class='col-md-3'></div><div class='col-md-5'>�@�@"+raiser.detail+ "</div></div>"
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
							if(lock){
								lock=false;
								$.post(url2, {
									'account' : raiser.account,
									'lock' : lock
								}, getData,"json");
								$("#btnStop"+raiser.id).removeClass("btn btn-warning").addClass('btn btn-danger').text("�Ѱ�����");
							}else {
								lock=true;
								$.post(url2, {
									'account' : raiser.account,
									'lock' : lock
								}, getData ,"json");
								$("#btnStop"+raiser.id).removeClass("btn btn-danger").addClass('btn btn-warning').html("<span class='glyphicon glyphicon-ban-circle' id='spanCk"+raiser.id+"'></span>�@����");
							}
							
						});
					});
		};
		
		
		//�H�U�j�M����
// 		$("#btnsch").click(function(){
// 			var urlCount = "/softleader-iii-eeit78/raiser/raiserSelectAll!getByConditionCount";
// 			console.log()
// 			Max = Math.ceil("${resultCount}" / 3);
// 		});
	</script>

</body>