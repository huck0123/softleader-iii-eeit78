<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.thumbnail {text-align: justify;}

</style>

<div class="tab-pane fade" id="campaignAdmin">
	<div class="container panel alert">
		<form action="/softleader-iii-eeit78/campaign/campaignAction"
			method="post">

			<select id="selectPageSize">
				<option value="5" selected>5</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="all">全部</option>
			</select>

			<button type="button" id="campaignAdminBefore">上一頁</button>
			<span id="pageShow"></span>
			<button type="button" id="campaignAdminAfter">下一頁</button>
			<button type="button" id="validate">解除黑名單</button>
			<!-- 			<input type="submit" value="加入黑名單" name="method:ban"> -->

			<input type="button" value="加入黑名單" id="invalidate">


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
				<tbody id="campaignAdmin_tbdy">


				</tbody>
			</table>
		</form>
	</div>
</div>




<script>

var totalCount = 0;
var pageSize = 0;
var totalPage = 0;
//0是第一頁
var currentPage =0;
load();

function load(){
	//如果不隨便給個參數呼叫Ajax，則campaignForm實體就不會被struts2做出來，搜尋就會失敗。 
	$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllConditionCount',
			{'campaignForm.page':currentPage},function(data){
		totalCount = data;
		setPageSize();
		totalPage = Math.ceil(totalCount / pageSize);
		pageShowAppend();
		tbdyAppend();
	})}
	
//把資料放入tbdy
function tbdyAppend(){
	$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
			{'campaignForm.pageNum':currentPage,'campaignForm.name':$('#nameSearch').val(), 'campaignForm.pageSize':pageSize},function(data){
		data = JSON.parse(data);
					$('#campaignAdmin_tbdy').empty();
		$(data).each(function(index,value){
			$('#campaignAdmin_tbdy').append("<tr>"
					+ "<td><img src='' id='"+value.id+"' class='thumbnail' style='width: 80px; height: 80px'></td>"
					+ "<td>"+ value.name +"</td>"
					+ "<td>"+ value.raiserModel.name +"</td>" 
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

//顯示頁碼
function pageShowAppend(){
	$('#pageShow').empty();
	$('#pageShow').append('<input type="text" id="nowPage" style="width:20px;" value="'+(currentPage+1)+'"/>').append(' / '+totalPage);
}

//下一頁
function campaignAdminAfter(){
	if(currentPage+1 < totalPage){
		currentPage++;
	}
	pageShowAppend();
	tbdyAppend();
}
$('#campaignAdminAfter').on('click', campaignAdminAfter);
//上一頁
function campaignAdminBefore(){
	if(currentPage > 0){
		currentPage--;
	}
	pageShowAppend();
	tbdyAppend();
}
$('#campaignAdminBefore').on('click', campaignAdminBefore);

//設定每頁筆數
$('#selectPageSize').on('change',load);
function setPageSize(){
	if($('#selectPageSize').val()==="all"){
		pageSize = totalCount;
	} else{
	pageSize = $('#selectPageSize').val();
	}
}

//加入黑名單
$('#invalidate').on('click',ban);
function ban(){
	$.post('/softleader-iii-eeit78/campaign/campaignAction!ban',
			{'campaignForm.ban':$('#campaignAdmin_tbdy input:checkbox:checked').serialize()},function(data){
				tbdyAppend();
})}
//解除黑名單
$('#validate').on('click',unban);
function unban(){
	$.post('/softleader-iii-eeit78/campaign/campaignAction!unban',
			{'campaignForm.ban':$('#campaignAdmin_tbdy input:checkbox:checked').serialize()},function(data){
				tbdyAppend()
})}
</script>
</html>