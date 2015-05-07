function gender(sex) {
	if (sex == true) {
		return "male";
	} else {
		return "female";
	}
}

function getInfo(info) {
	if (info == true) {
		return "yes";
	} else {
		return "no";
	}
}

//選擇第幾頁
$('#page').on("change", function(){
	$(this).prop("disabled",true);
	$('#tbdy').empty();
	var temp = $(this).val();
	$.post(url,{'thisPage':temp,'pageAmount':pageAmount},getData);
});

//上一頁
function before(){
	$('#before').prop("disabled", true);
	var thisPage = $('#page').val();
	if(thisPage > 1){
		thisPage--;
		
		$('#page').val(thisPage);
		$('#tbdy').empty();
		$.post(url,{'thisPage':thisPage,'pageAmount':pageAmount},getData);
	}
};

//下一頁
function after() {
	$('#after').prop("disabled", true);
	var thisPage = $('#page').val();
	if(thisPage < transactionCount ){
		thisPage++;
		
		$('#page').val(thisPage);
		$('#tbdy').empty();
		$.post(url,{'thisPage':thisPage,'pageAmount':pageAmount},getData);
	}
};