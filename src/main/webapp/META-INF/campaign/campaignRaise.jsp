<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="tab-pane fade" id="campaignRaise" style="padding-top: 20px;padding-bottom: 20px;">
	<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<form id="campaignRaiseForm" action="/softleader-iii-eeit78/campaign/campaignAction!insert"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="campaign-name-input">活動名稱：</label><b style="color:red">*</b> <input type="text"
					class="form-control" name="campaignForm.name"
					id="campaign-name-input" placeholder="請輸入活動名稱" value="${param['campaignForm.name']}">
					<p  style="color:red; display:none">none</p>
			</div>

			<div class="form-group">
				<label for="campaign-image-input">活動圖片：</label><b style="color:red">*</b> <input type="file"
					name="campaignForm.image" id="campaign-image-input" placeholder="請上傳圖片">
					<p  style="color:red; display:none">none</p>
			</div>
			<div class="form-group">
				<label for="campaign-goal-input">目標金額：</label><b style="color:red">*</b> <input type="text"
					class="form-control" name="campaignForm.goal"
					id="campaign-goal-input" placeholder="請輸入目標金額">
					<p  style="color:red; display:none">none</p>
			</div>
			<div class="form-group">
				<label for="campaign-duration-input">活動天數：</label><b style="color:red">*</b> <input
					type="text" class="form-control" name="campaignForm.duration"
					id="campaign-duration-input" placeholder="請輸入活動天數">
					<p  style="color:red; display:none">none</p>
			</div>
			<div class="form-group">
				<label for="campaign-type-input">類型：</label><b style="color:red">*</b>
				<select id="campaign-type-input" class="form-control" name="campaignForm.type">
				<p  style="color:red; display:none">none</p>

</select>
<!-- 				 <input type="text" -->
<!-- 					class="form-control" name="campaignForm.type" -->
<!-- 					id="campaign-type-input" placeholder="請輸入活動類型"> -->
<p  style="color:red; display:none"></p>
			</div>
			<div class="form-group">
				<label for="campaign-location-input">地區 :</label><b style="color:red">*</b> <input type="text"
					class="form-control" name="campaignForm.location"
					id="campaign-location-input" placeholder="請輸入活動地點"><p  style="color:red; display:none">none</p>
			</div>

			<div class="form-group">
				<label for="campaign-vedioUrl-input">影片連結:</label><b style="color:red">*</b> <input
					type="text" class="form-control" name="campaignForm.vedioUrl"
					id="campaign-vedioUrl-input" placeholder="請輸入影片連結"><p  style="color:red; display:none">none</p>
			</div>
			<div class="form-group">
				<label for="campaign-detail-input">活動詳情:</label><b style="color:red">*</b>
				<textarea id="campaign-detail-input" name="campaignForm.detail"
					class="form-control">${param.detail}</textarea>
			</div>

			<div class="form-group">
					<button id="raiseSubmit" type="submit" class="btn btn-default" style="float:left;" disabled>送出</button>
			</div>
			
		</form></div>
		</div>
	</div>
<script src="/softleader-iii-eeit78/ckeditor/ckeditor.js" type="text/javascript"></script>

<script>

// 若之前送出過表單，則送出按鈕可以按
if("${param['campaignForm.name']}"){
	$('#raiseSubmit').prop('disabled', false);
}

//前端驗證不可為空白
$('[id^=campaign-]').on('blur',checkContent);
function checkContent(){
	if($(this).val().trim().length < 1){
		$(this).siblings(":last").text('本欄位請勿留白').show();;
	} else if($(this).val().trim().length > 1){
		$(this).siblings(":last").empty();
	}
	console.log($('#campaignRaiseForm p').text().length)
	if($('#campaignRaiseForm p').text().length <1){
		$('#raiseSubmit').prop('disabled', false);
	}
}

//前端驗證數字須正確
$('#campaign-duration-input').on('blur',checkNumberContent);
$('#campaign-goal-input').on('blur',checkNumberContent);
function checkNumberContent(){
	if($(this).val().trim().length < 1){
		$(this).siblings(":last").text('本欄位請勿留白').show();
	}else if(!$(this).val().trim().match(/^[1-9][0-9]*$/i) ){
		$(this).siblings(":last").text('請輸入正確數字').show();
	}
	else if($(this).val().trim().length > 1){
		$(this).siblings(":last").empty();
	}
	if($('#campaignRaiseForm p').text().length <1){
		$('#raiseSubmit').prop('disabled', false);
	}
}

// CKEDITOR設置
CKEDITOR.replace( 'campaign-detail-input', {
    language: 'zh',
    height: '350px',
    removeButtons: 'Source,Maximize,Anchor',
});

// 類型為動態抓取
	appendType();
	function appendType(){
		$.post('/softleader-iii-eeit78/campaign/campaignTypeAction!selectAll',
				{},function(data){		
					data = JSON.parse(data);
					$(data).each(function(index,value){
						var child = $('<option>'+value.name+'</option>');
						$('#campaign-type-input').append(child);
						}) //each end
					}) //post method end				
	} //appendType end
</script>
