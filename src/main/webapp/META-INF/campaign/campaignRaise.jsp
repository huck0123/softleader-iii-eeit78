<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
@media ( min-width : 992px) {
	#campaignRaiseModal .modal-width {
		width: 100%;
	}
}

@media ( min-width : 1200px) {
	#campaignRaiseModal .modal-width {
		width: 1200px
	}
}

#sideDiv {
	text-align: left;
	vertical-align: top;
}

#campaignRaiseModal.row-table {
	display: table;
}

#campaignRaiseModal.row {
	margin: 0px;
}

#campaignRaiseModal.row-table {
	display: table;
	width: 100%;
}

#sideDiv strong {
	font-size: 46px;
}

.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover
	{
	color: darkslategrey;
	background-color: #f2f2f2;
}

.nav-pills>li>a {
	border-radius: 0;
}
</style>
<div class="tab-pane fade" id="campaignRaise"
	style="padding-top: 20px; padding-bottom: 20px;">
	<div class="row">
		<div class="col-md-1"><button class="btn btn-default" id="fillCampaignRaise">DEMO</button></div>
		<div class="col-md-10">
			<form id="campaignRaiseForm"
				action="/softleader-iii-eeit78/campaign/campaignAction!insert"
				method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="campaign-name-input">活動名稱：</label><b style="color: red">*</b>
					<input type="text" class="form-control" name="campaignForm.name"
						id="campaign-name-input" placeholder="請輸入活動名稱"
						value="${param['campaignForm.name']}">
					<p style="color: red; display: none">none</p>
				</div>

				<div class="form-group">
					<label for="campaign-image-input">活動圖片：</label><b
						style="color: red">*</b> <input type="file"
						name="campaignForm.image" id="campaign-image-input"
						placeholder="請上傳圖片">
					<p style="color: red; display: none">none</p>
				</div>
				<div class="form-group">
					<label for="campaign-goal-input">目標金額：</label><b style="color: red">*</b>
					<input type="text" class="form-control" name="campaignForm.goal"
						id="campaign-goal-input" placeholder="請輸入目標金額">
					<p style="color: red; display: none">none</p>
				</div>
				<div class="form-group">
					<label for="campaign-duration-input">活動天數：</label><b
						style="color: red">*</b> <input type="text" class="form-control"
						name="campaignForm.duration" id="campaign-duration-input"
						placeholder="請輸入活動天數">
					<p style="color: red; display: none">none</p>
				</div>
				<div class="form-group">
					<label for="campaign-type-input">類型：</label><b style="color: red">*</b>
					<select id="campaign-type-input" class="form-control"
						name="campaignForm.type">
						<p style="color: red; display: none">none</p>

					</select>
					<!-- 				 <input type="text" -->
					<!-- 					class="form-control" name="campaignForm.type" -->
					<!-- 					id="campaign-type-input" placeholder="請輸入活動類型"> -->
					<p style="color: red; display: none"></p>
				</div>
				<div class="form-group">
					<label for="campaign-location-input">地區 :</label><b
						style="color: red">*</b> <input type="text" class="form-control"
						name="campaignForm.location" id="campaign-location-input"
						placeholder="請輸入活動地點">
					<p style="color: red; display: none">none</p>
				</div>

				<div class="form-group">
					<label for="campaign-vedioUrl-input">影片連結:</label><b
						style="color: red">*</b> <input type="text" class="form-control"
						name="campaignForm.vedioUrl" id="campaign-vedioUrl-input"
						placeholder="請輸入影片連結">
					<p style="color: red; display: none">none</p>
				</div>
				<div class="form-group">
					<label for="campaign-detail-input">活動詳情:</label><b
						style="color: red">*</b>
					<textarea id="campaign-detail-input" name="campaignForm.detail"
						class="form-control">${param.detail}</textarea>
					<p id="detail-error" style="color: red; display: none">none</p>
				</div>

				<div class="form-group">
					<button id="raiseSubmit" type="button" class="btn btn-info"
						data-toggle="modal" data-target="#campaignRaiseModal"
						onclick="appendCampaign()" style="float: left;" disabled>預覽</button>
				</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="campaignRaiseModal" role="dialog"
	style="top: 100px">
	<div class="modal-dialog modal-width">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="text-align: center;">活動預覽</h4>
			</div>
			<div class="modal-body" style="text-align: center;">
				<div id="showColumn"></div>

				<div class="container" style="margin-top: 5%;">
					<ul class="nav nav-pills"
						style="border-top: 1px grey solid; border-bottom: 1px grey solid; height: 60px; margin-bottom: 20px">
						<li class="active"><a data-toggle="pill" href="#detail-tab"
							style="width: 120px; height: 58px; line-height: 36px">詳細資訊</a></li>
						<li><a data-toggle="pill" href="#message-tab"
							style="width: 120px; height: 58px; line-height: 36px">留言</a></li>
					</ul>

					<div class="tab-content" style="border: none;">
						<div id="detail-tab" class="tab-pane fade in active">
							<div class=row id="detailRowDiv">
								<div class="col-md-8 col-md-offset-2"
									id="campaignRaiseDetailDiv" style="text-align: justify;"></div>
							</div>
						</div>
						<div id="message-tab" class="tab-pane fade">
							<div style="text-align: left">
								<h3 class="col-md-6 col-md-offset-3">我要留言</h3>
								<div class="col-xs-12 col-md-6 col-md-offset-3"
									id="No_mainPlace">
									<div class="col-xs-2">
										<img id="img_user" src="../pictures/noPicture.jpg"
											style="width: 100%">
									</div>
									<div class="col-xs-10">
										<textarea id="mainCommentPlace" class="form-control" rows="4"
											style="margin-bottom: 4px"></textarea>
										<button type="button" class="btn btn-success btn-xs"
											onclick="startNewComment();" style="width: 50px" disabled>送出
										</button>
										<button type="button" class="btn btn-warning btn-xs"
											onclick="confirmCleanNewComment();" style="width: 50px"
											disabled>清除</button>
									</div>
								</div>
							</div>
							<div>
								<div class="col-xs-12 col-md-6 col-md-offset-3"
									id="No_mainShownCommentPlace"></div>
							</div>
						</div>
					</div>
				</div>




			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">送出</button>
				<button type="button" class="btn btn-warning" data-dismiss="modal">返回</button>
			</div>
		</div>
		</form>


		<script src="/softleader-iii-eeit78/ckeditor/ckeditor.js"
			type="text/javascript"></script>

		<script>

// 若之前送出過表單，則送出按鈕可以按
// if("${param['campaignForm.name']}"){
// 	$('#raiseSubmit').prop('disabled', false);
// }

//前端驗證不可為空白
$('[id^=campaign-]').on('blur',checkContent);
$('[id^=campaign-]').on('change',checkContent);
function checkContent(){
	if($(this).val().trim().length < 1){
		$(this).siblings(":last").text('本欄位請勿留白').show();
	} else if($(this).val().trim().length > 1){
		$(this).siblings(":last").empty();
	}
	if($('#campaignRaiseForm p').text().length <1){
		$('#raiseSubmit').prop('disabled', false);
	}else{$('#raiseSubmit').prop('disabled', true);}
}

//前端驗證數字須正確
$('#campaign-duration-input').on('blur',checkNumberContent);
$('#campaign-duration-input').on('change',checkNumberContent);
$('#campaign-goal-input').on('blur',checkNumberContent);
$('#campaign-goal-input').on('change',checkNumberContent);
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
	} else{$('#raiseSubmit').prop('disabled', true);}
}

// CKEDITOR設置
CKEDITOR.replace( 'campaign-detail-input', {
    language: 'zh',
    height: '350px',
    removeButtons: 'Source,Maximize,Anchor',
});

//詳情不可空白
CKEDITOR.instances['campaign-detail-input'].on('blur', detailValidation);
function detailValidation(){
	if(CKEDITOR.instances['campaign-detail-input'].getData().length<1){
		$('#detail-error').text('本欄位請勿留白').show();
	} else if(CKEDITOR.instances['campaign-detail-input'].getData().length > 1){
		$('#detail-error').empty();
	}
	if($('#campaignRaiseForm p').text().length <1){
		$('#raiseSubmit').prop('disabled', false);
	}
}

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
	
	
// 將資料放入modal準備預覽	
	function appendCampaign(){
		
		$('#showColumn').empty();
		var rowDiv1 = $('<div  class="row"></div>');
		var titleP = $('<h3>' + $('#campaign-name-input').val() + '</h3>');
		var raiserP = $('<p><span class="glyphicon glyphicon-pencil"></span> '
					+ "${raiser.name}" + '</p>');
		titleP.appendTo(rowDiv1);
		raiserP.appendTo(rowDiv1);
		rowDiv1.appendTo($('#showColumn'));

		var rowDiv2 = $('<div id="rowDiv2" class="row row-table"></div>');
		var vedioDiv = $('<div class="col-sm-8 col-md-8 left-side"></div>');
		var iframeDiv = $('<div class="embed-responsive embed-responsive-16by9"></div>');
		var iframe = $('<iframe src="' + $('#campaign-vedioUrl-input').val()
					+ '?showinfo=0' + '"></iframe>');
		iframeDiv.appendTo(vedioDiv);
		iframe.appendTo(iframeDiv);
				
		var sideDiv = $('<div id="sideDiv" class="col-sm-4 col-md-4 right-side"></div>');
		var giverP = $('<p>已有<strong id="giverStrong">0</strong>人支持</p>');
		var moneyP = $('<p>已募得<strong>'
					+ '0</strong>元/' + commafy($('#campaign-goal-input').val())
					+ '元</p>');
				
		var today = new Date();
		var d = new Date(today.getTime()+$('#campaign-duration-input').val()*24*3600000);
		var dateP = $('<p>於<strong>' + d.getFullYear()
							+ '/' + (d.getMonth()+1) + '/' + d.getDate()
							+ '</strong>結束</p>');
		var donateBtn = $('<a class="btn btn-primary" role="button" disabled><strong>立即捐款</strong></a>');
				
				
		var percent = 0;
		var progressDiv = $('<div class="progress"></div>');
		var progressBarDiv = $('<div id="aa" class="progress-bar progress-bar-success" role="progressbar" style="width:'
							+ percent + '%"></div>');

		progressBarDiv.appendTo(progressDiv);

		var otherInfo = $('<p><span class="glyphicon glyphicon-map-marker"></span> '
							+ $('#campaign-location-input').val()
							+ ' <span class="glyphicon glyphicon-tag"></span> '
							+ $('#campaign-type-input').val()
							+ ' <span class="glyphicon glyphicon-stats"></span> '
							+ percent + '%已完成</p>');

		giverP.appendTo(sideDiv);
		moneyP.appendTo(sideDiv);
		dateP.appendTo(sideDiv);
		otherInfo.appendTo(sideDiv);
		progressDiv.appendTo(sideDiv);
		donateBtn.appendTo(sideDiv);
		vedioDiv.appendTo(rowDiv2);
		sideDiv.appendTo(rowDiv2);
		rowDiv2.appendTo($('#showColumn'));

   		$('#campaignRaiseDetailDiv').append(CKEDITOR.instances['campaign-detail-input'].getData());
	}
	
	$('#fillCampaignRaise').on('click',function(){
		$('#campaign-name-input').val('勵馨-希望之門');
		$('#campaign-goal-input').val('1000000');
		$('#campaign-duration-input').val('60');
		$('#campaign-type-input').val('婦幼關懷');
		$('#campaign-location-input').val('南投縣');
		$('#campaign-vedioUrl-input').val('http://www.youtube.com/embed/yZDMvUkdVi8');
		CKEDITOR.instances['campaign-detail-input'].setData('<p>兩個命運相同的女人，一位長期受虐的女孩，她們為了逃命先後來到勵馨安置家園，交織出一段以愛相伴的重生之旅。</p>'

				+'<p>長年處於家暴環境的莉莉，身心嚴重受創幾近崩潰，所幸勵馨姊姊及時趕到，帶著她離開暴力環境，輾轉住進安置受暴婦女的家園，在社工的悉心關照之下，逐漸恢復正常生活。莉莉下定決心成為社工，協助更多婦女走出受暴陰霾。有一天，莉莉突然接到緊急通知，冒著生命危險救出一位被打得半死的婦女，一路陪伴她來到自己熟悉的安置家園。</p>'

				+'<p>在此同時，一位住在偏遠山區的小女孩，因為受不了爸爸對她身體長期施虐，趁著上學途中離家，徒步8小時才被發現。被社工安置到勵馨家園時，小女孩始終沉默不語，不吃飯也不洗澡，一心只想找媽媽。莉莉知道後十分不捨，主動說故事給女孩聽，還陪她一起玩遊戲，才漸漸打開女孩封閉的心房。</p>'

				+'<p>小女孩認真地告訴莉莉，媽媽以前曾帶她去市區的一家診所看病，這是記憶中與母親連結的唯一線索，女孩寫了一張卡片放在診所，希望媽媽來看病時就會發現，期盼早日與母重逢。</p>'

				+'<p>每逢歲末年終，勵馨基金會執行長紀惠容都會和安置家園的「家人」們一起吃年夜飯，大家圍爐而坐，由紀姊帶頭禱告：「感謝上帝賜下豐盛佳餚，希望勵馨成為受暴婦女和兒少的後盾，更期盼南投『女兒館』能盡快動工，讓神的孩子都有一個溫暖的家。」</p>'

				+'<p>莉莉得知勵馨要在南投興建「女兒館」的消息，心中非常掛念，曾經住過安置家園的她深知受暴婦女和孩子們的需求，特地商請一位房仲好友幫忙看了30多個地方，終於找到一塊靠近學校的理想農地。</p>'

				+'<p>光有土地還不夠，要順利動工還欠缺一筆龐大經費，此時莉莉主動捐出積攢已久的10萬元，這是母親生前借給她的急難救助金，而親愛的媽媽已返回天家，無法償還，如今勵馨就像她唯一的「娘家」，莉莉希望把母親對她的愛延續下去，用這筆錢來支持勵馨建設南投女兒館。</p>');
		$('#raiseSubmit').prop('disabled', false);
	})
</script>