<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
tr th {
	text-align: center;
}
</style>

<div class="tab-pane fade" id="transactionDetail">

<!-- 	<div class="panel alert"> -->
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-md-3">
				<select id="transactionDetailPageAmount"></select>顯示筆數(預設5筆)
			</div>
			<div class="col-md-6">
				<button class="btn btn-primary" id="transactionBefore" onclick="transactionBefore()">上一頁</button>
				<select id="transactionDetailPage"></select>
				<button class="btn btn-primary" id="transactionAfter" onclick="transactionAfter()">下一頁</button>
			</div>
			<div class="col-md-3">
				<input type="text" class="form-control" id="transactionCondition" placeholder="請輸入搜尋條件"> 
<!-- 				<button onclick="search()">查詢</button> -->
			</div>
		</div>
		
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

			<tbody id="transactionDetail_tbdy">

			</tbody>
		</table>
<!-- 	</div> -->
</div>

	<script>
		
		var transactionCount = ${applicationScope.transactionCount}; //交易總筆數
		var transactionDetail_url = "${pageContext.request.contextPath}/donate/transactionDetailAction!transactionDetail";
		var transactionDetail_urlc = "${pageContext.request.contextPath}/donate/transactionDetailAction!conditionCount";
		var transactionDetail_urlv = "${pageContext.request.contextPath}/donate/transactionDetailAction!credit";
		var transactionDetailPageAmount;
		var transactionDetailPageCount;
		var transactionCondition;
		
		$('#transactionCondition').keyup(function(){
			transactionCondition = $('#transactionCondition').val();
			$.post(transactionDetail_urlc,{'condition':transactionCondition},function(data){
				
				data = JSON.parse(data);
				transactionCount = data.conditionCount;
				transactionLoad();
			});
		});
		
		
		
		//收尋      ---------deprecated---------
// 		function search(){
// 			transactionCondition = $('#condition').val();
// 			$.post(transactionDetail_urlc,{'condition':transactionCondition},function(data){
				
// 				data = JSON.parse(data);
// 				transactionCount = data.conditionCount;
// 				transactionLoad();
// 			});
// 		}
		
		transactionLoad();
		
		//初始載入頁面
		function transactionLoad(){
			$('#transactionDetailPageAmount').empty();
			$('#transactionDetailPage').empty();
			
			//建立每頁幾筆資料選單
			for(var i=1; i<=transactionCount; i++){
				$('#transactionDetailPageAmount').append("<option value='"+ i +"'>"+ i +"</option>");
			}
			
			//預設一頁五筆
			if(transactionCount>=5){
				$('#transactionDetailPageAmount').val(5);  
			}else{
				$('#transactionDetailPageAmount').val(transactionCount);
			}
			transactionDetailPageAmount = $('#transactionDetailPageAmount').val();
			transactionDetailPageCount = transactionCount/transactionDetailPageAmount;
			
			//建立select選單
			for(var i=1; i<transactionDetailPageCount+1; i++){
				$('#transactionDetailPage').append("<option value='"+ i +"'>"+ i +"</option>");	
			}

			//載入第一頁
			$.post(transactionDetail_url,{'thisPage':1,'pageAmount':transactionDetailPageAmount,'condition':transactionCondition}, transactionGetData);
		}
		
		function transactionOnload(){

			transactionDetailPageAmount = $('#transactionDetailPageAmount').val();
			transactionDetailPageCount = transactionCount/transactionDetailPageAmount;
			
			//清除page select選單
			$('#transactionDetailPage').empty();
			
			//建立page select選單
			for(var i=1; i<transactionDetailPageCount+1; i++){				$('#transactionDetailPage').append("<option value='"+ i +"'>"+ i +"</option>");	
			}
		
		}
		
		//讀取使用者每頁顯示幾筆資料之值
		$('#transactionDetailPageAmount').on("change", function(){
			$(this).prop("disabled",true);
// 			transactionDetailPageAmount = $(this).val();
			transactionOnload();
			var thisPage = $('#transactionDetailPage').val();			
			$.post(transactionDetail_url,{'thisPage':thisPage,'pageAmount':transactionDetailPageAmount,'condition':transactionCondition}, transactionGetData);
		});

		//判斷是否為null
		function undefinedCheck(data){
			if(data == undefined){
				data = "";
				return data;
			}else{
				return data;
			}
		};
		
		function transactionGetData(data){
			$('#transactionDetail_tbdy').empty();
			data = JSON.parse(data);
			$.each(data, function(index,obj){				
				$(transactionDetail_tbdy).append("<tr>"
						+"<td>"+ undefinedCheck(obj.giverId) +"</td>"
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

// 				$('#transactionBefore').prop("disabled", false);
// 				$('#transactionAfter').prop("disabled", false);
// 				$('#page').prop("disabled", false);
				$('#transactionDetailPageAmount').prop("disabled", false);
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
					$.post(transactionDetail_urlv, { 'thisId':id, 'credit':false});
					$(this).val("false");
					$('.'+id).text("false");
				}else{
					$.post(transactionDetail_urlv, { 'thisId':id, 'credit':true});
					$(this).val("true");
					$('.'+id).text("true");
				}
			})
		};
		

		//選擇第幾頁
		$('#transactionDetailPage').on("change", function(){
// 			$(this).prop("disabled",true);
			$('#transactionDetail_tbdy').empty();
			var temp = $(this).val();
			$.post(transactionDetail_url,{'thisPage':temp,'pageAmount':transactionDetailPageAmount,'condition':transactionCondition},transactionGetData);
		});

		//上一頁
		function transactionBefore(){
// 			$('#transactionBefore').prop("disabled", true);
			var thisPage = $('#transactionDetailPage').val();
			if(thisPage > 1){
				thisPage--;
				
				$('#transactionDetailPage').val(thisPage);
				$.post(transactionDetail_url,{'thisPage':thisPage,'pageAmount':transactionDetailPageAmount,'condition':transactionCondition},transactionGetData);
			}
		};

		//下一頁
		function transactionAfter() {
// 			$('#transactionAfter').prop("disabled", true);
			var thisPage = $('#transactionDetailPage').val();
			if(thisPage < transactionDetailPageCount ){
				thisPage++;
				
				$('#transactionDetailPage').val(thisPage);
				$.post(transactionDetail_url,{'thisPage':thisPage,'pageAmount':transactionDetailPageAmount,'condition':transactionCondition},transactionGetData);
			}
		};
		
		
	</script>


</body>
</html>