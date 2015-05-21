<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="tab-pane fade" id="campaignRaise">
		<form action="/softleader-iii-eeit78/campaign/campaignAction!insert"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="campaign-name-input">活動名稱：</label> <input type="text"
					class="form-control" name="campaignForm.name"
					id="campaign-name-input" placeholder="請輸入活動名稱">
			</div>

			<div class="form-group">
				<label for="campaign-image-input">活動圖片：</label> <input type="file"
					name="campaignForm.image" id="campaign-image-input" placeholder="請上傳圖片">
			</div>
			<div class="form-group">
				<label for="campaign-goal-input">目標金額：</label> <input type="text"
					class="form-control" name="campaignForm.goal"
					id="campaign-goal-input" placeholder="請輸入目標金額">
			</div>
			<div class="form-group">
				<label for="campaign-duration-input">活動天數：</label> <input
					type="text" class="form-control" name="campaignForm.duration"
					id="campaign-duration-input" placeholder="請輸入活動天數">
			</div>
			<div class="form-group">
				<label for="campaign-type-input">類型：</label>
				<select id="campaign-type-input" class="form-control" name="campaignForm.type">
  <option>環境保育</option>
  <option>2</option>
  <option>3</option>
  <option>4</option>
  <option>5</option>
</select>
<!-- 				 <input type="text" -->
<!-- 					class="form-control" name="campaignForm.type" -->
<!-- 					id="campaign-type-input" placeholder="請輸入活動類型"> -->
			</div>
			<div class="form-group">
				<label for="campaign-location-input">地區 :</label> <input type="text"
					class="form-control" name="campaignForm.location"
					id="campaign-location-input" placeholder="請輸入活動地點">
			</div>

			<div class="form-group">
				<label for="campaign-vedioUrl-input">影片連結:</label> <input
					type="text" class="form-control" name="campaignForm.vedioUrl"
					id="campaign-vedioUrl-input" placeholder="請輸入影片連結">
			</div>
			<div class="form-group">
				<label for="campaign-detail-input">活動詳情:</label>
				<textarea id="campaign-detail-input" name="campaignForm.detail"
					class="form-control" rows="10">${param.detail}</textarea>
			</div>

			<div class="form-group">

					<button type="submit" class="btn btn-default" style="float: right;">送出</button>

			</div>
		</form>
	</div>

<script>
	btn1.addEventListener("click", fill);

	function appendType(){
		$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllConditionCount',
				{},function(data){
		
	}
</script>
