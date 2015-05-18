<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
th, td{
	text-align:center;
}
form{
	text-align:left;
}
</style>

<div class="tab-pane fade" id="giverHistory">
<!-- 	<div class="col-md-8 col-md-offset-2"> -->
		<h3>複合查詢系統</h3><br />
		<div>
			<form class="form-horizontal">		
				<div class="form-group">
    				<label for="keyword" class="col-sm-3 control-label">關鍵字搜尋</label>
    				<div class="col-sm-9">
      					<input type="text" class="form-control" id="keyword" placeholder="輸入活動名稱或發起團體">
    				</div>
  				</div>
				<div class="form-group">
    				<label for="minAmount" class="col-sm-3 control-label">依金額範圍</label>
    				<div class="col-sm-4">
      					<input type="text" class="form-control" id="minAmount" placeholder="輸入較小金額">
    				</div>
    				<label for="maxAmount" class="col-sm-1 control-label">到</label>
       				<div class="col-sm-4">
      					<input type="text" class="form-control" id="maxAmount" placeholder="輸入較大金額">
    				</div>
  				</div>  				
				<div class="form-group">
    				<label for="afterDate" class="col-sm-3 control-label">依日期範圍</label>
    				<div class="col-sm-4">
      					<input type="datetime-local" class="form-control" id="afterDate" placeholder="選擇較小日期">
    				</div>
    				<label for="beforeDate" class="col-sm-1 control-label">到</label>
       				<div class="col-sm-4">
      					<input type="datetime-local" class="form-control" id="beforeDate" placeholder="選擇較大日期">
    				</div>
  				</div>
			</form>
		</div>
		<br />
		<button type="button" class="btn btn-primary" onclick="loadByForm();">送出篩選</button>
		<button type="button" class="btn btn-warning" onclick="cleanForm();">清除條件</button>
<!-- 	</div> -->

<!-- 	<div class="col-md-8 col-md-offset-2"> -->
		<br /><hr /><br />
		<h3 style="display:inline-block;">${sessionScope.giver.name}您好，您的捐款紀錄如下</h3>
		<button type="button" class="btn btn-success btn-xs" onclick="showAll();">顯示所有紀錄</button><br /><br />
		<table id="resultTable" class="table table-hover">
			<thead>
				<tr>
					<th>活動ID</th>
					<th>活動名稱</th>
					<th>發起團體</th>
					<th>捐款金額</th>
					<th>捐款日期</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div id="noData"></div>
<!-- 	</div> -->
</div>
<script>
	var url1 = '${pageContext.request.contextPath}/donate/giverDetailAllHistory!giverDetail';
	var url2 = '${pageContext.request.contextPath}/donate/giverDetailAllHistoryByCondition!giverDetailByCondition';
 	$.getJSON(url1, {'thisId':"${giver.id}"}, loadAll);
 
 	function loadAll(data){
		console.log(111);
		$.each(data, function(name, value){
			$('#resultTable tbody').append("<tr>"	
										+ "<td>"+ value.campaignModel.id +"</td>"
										+ "<td><a href='<c:url value='/campaign/campaignDetail?id="+ value.campaignModel.id +"'/>'>"+ value.campaignModel.name +"</td>"
										+ "<td><a href='<c:url value='/raiser/raiserAction!select?account="+ value.campaignModel.raiserModel.account +"'/>'>"+ value.campaignModel.raiserModel.name +"</td>"
										+ "<td>"+ value.amount +"</td>"
										+ "<td>"+ value.date +"</td>"
									+"</tr>");
		})
		console.log(data);
		if(data == null){
			$('#noData').html("<h4>查無紀錄</h4>");
		}
	}
 	function loadByForm(){
 		$('#resultTable tbody tr').remove();
 		$('#noData h4').remove();
 		$.getJSON(url2, {
 			'allCondition.giver_id':"${giver.id}",
 			'allCondition.keyword':$('#keyword').val(),
 			'allCondition.minAmount':$('#minAmount').val(),
 			'allCondition.maxAmount':$('#maxAmount').val(),
 			'allCondition.beforeDate':$('#beforeDate').val(),
 			'allCondition.afterDate':$('#afterDate').val()
 			},loadAll);
 	}
	function cleanForm(){
		$("input[type='text']").val("");
		$("input[type='date']").val("");
	}
	function showAll(){
		cleanForm();
		loadByForm();
	}
</script>
