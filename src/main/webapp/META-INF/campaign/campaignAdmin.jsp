<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.thumbnail {text-align: justify;}

</style>

<div class="tab-pane fade" id="campaignAdmin">
	<div >


			<div class="row" style="margin-bottom: 20px;">
				<div class="col-md-3">
					<select id="selectPageSize">
						<option value="5" selected>5</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="100">100</option>
						<option value="all">全部</option>
					</select>顯示筆數(預設5筆)
				</div>
				<div class="col-md-3">
					<button class="btn btn-primary" id="campaignAdminBefore">上一頁</button>
					<select id="campaignPage"></select>
					<button class="btn btn-primary" id="campaignAdminAfter">下一頁</button>

				</div>
				<div class="col-md-3">
					<button class="btn btn-warning" type="button" id="validate">解除黑名單</button>
					<input class="btn btn-warning" type="button" value="加入黑名單" id="invalidate">
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control" id="campaignCondition"
						placeholder="請輸入搜尋條件">
					<button class="btn btn-info" id="downloadExcel">下載所有活動excel</button>
				</div>
			</div>

			<div style="margin-top: 20px">
				<table class="table table-bordered">
					<tr>
						<th>活動圖片</th>
						<th>活動名稱</th>
						<th>發起團體</th>
						<th>目前金額</th>
						<th>結束日期</th>
						<th>地點</th>
						<th>類型</th>
						<th>是否啟用</th>
						<th></th>
					</tr>
					<tbody id="campaignAdmin_tbdy">


					</tbody>
				</table>
			</div>

	</div>
</div>




<script>

var totalCount = 0;
var pageSize = 0;
var totalPage = 0;
//0是第一頁
var currentPage =0;
var campaignCondition ='';
campaignLoad();

function campaignLoad(){
	//如果不隨便給個參數呼叫Ajax，則campaignForm實體就不會被struts2做出來，搜尋就會失敗。 
	$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllConditionCount',
			{'campaignForm.page':currentPage,'campaignForm.name':campaignCondition,'campaignForm.pageSize':pageSize},function(data){
		totalCount = data;
		setPageSize();
		totalPage = Math.ceil(totalCount / pageSize);
		pageShowAppend();
		tbdyAppend();
	})}
	
//把資料放入tbdy
function tbdyAppend(){
	$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
			{'campaignForm.pageNum':currentPage,'campaignForm.name':campaignCondition,'campaignForm.pageSize':pageSize},function(data){
		data = JSON.parse(data);
					$('#campaignAdmin_tbdy').empty();
		$(data).each(function(index,value){
			$('#campaignAdmin_tbdy').append("<tr >"
					+ "<td style='text-align:center'><img src='' id='campaignImage"+value.id+"' class='thumbnail' style='width: 80px; height: 80px; display:inline-block; margin-bottom:0px;'></td>"
					+ "<td>"+ value.name +"</td>"
					+ "<td>"+ value.raiserModel.name +"</td>" 
					+ "<td>"+ value.currentFund +"</td>" 
					+ "<td>"+ value.endDate +"</td>" 
					+ "<td>"+ value.location +"</td>" 
					+ "<td>"+ value.type +"</td>" 
					+ "<td>"+ value.valid +"</td>" 
					+ "<td><input type='checkbox' style='height:20px;width:20px' name='campaignForm.checkbox' value='"+value.id+"'></td>" 
					+"</tr>");
					
			var str = arrayBufferToBase64(value.image); 
			$('#campaignImage'+value.id).attr("src","data:image/png;base64," + str);
					
		})
	})	
}

//顯示頁碼
function pageShowAppend(){
	$('#campaignPage').empty();
	for(var i = 1; i <= totalPage ;i++){
	$('#campaignPage').append('<option value="'+i+'">'+ i +'</option> ');
}
}

//直接跳頁
$('#campaignPage').on('change',function(){
	console.log($('#campaignPage').val());
	currentPage = $('#campaignPage').val()-1;

	tbdyAppend();
})

//下一頁
function campaignAdminAfter(){
	if(currentPage+1 < totalPage){
		currentPage++;
	}
	$('#campaignPage').val(currentPage+1);
	tbdyAppend();
}
$('#campaignAdminAfter').on('click', campaignAdminAfter);
//上一頁
function campaignAdminBefore(){
	if(currentPage > 0){
		currentPage--;
	}
	$('#campaignPage').val(currentPage+1);
	tbdyAppend();
}
$('#campaignAdminBefore').on('click', campaignAdminBefore);

//設定每頁筆數
$('#selectPageSize').on('change',campaignLoad);
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

//搜尋
function filter(){
	campaignCondition=$('#campaignCondition').val();
	currentPage =0;
	campaignLoad();
}
$('#campaignCondition').on('keyup',filter);

//下載檔案Excel
$('#downloadExcel').on('click',function(){
	
	var url = "/softleader-iii-eeit78/campaign/campaignAction!downloadExcel";
// 	window.open(url);
	
	location.href= url;
	
});
</script>
</html>