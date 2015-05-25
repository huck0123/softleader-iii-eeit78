//byte array to base64
function arrayBufferToBase64(buffer) {
	var binary = '';
	var bytes = new Uint8Array(buffer);
	var len = bytes.byteLength;
	for (var i = 0; i < len; i++) {
		binary += String.fromCharCode(bytes[i]);
	}
	return window.btoa(binary);
}

// 四捨五入
function formatFloat(num, pos) {
	var size = Math.pow(10, pos);
	return Math.round(num * size) / size;
}

// 加千分位
function commafy(num) {
	num = num + "";
	var re = /(-?\d+)(\d{3})/
	while (re.test(num)) {
		num = num.replace(re, "$1,$2")
	}
	return num;
}

// 月份轉數字
function monthToNum(month) {
	var a = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep",
			"Oct", "Nov", "Dec" ];
	var b = [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11",
			"12" ];
	for (var n = 0; n < 12; n++) {
		if (a[n] == month) {
			month = b[n];
		}
	}
	return month;
}

// 產生一組驗證碼
function createCode() {
	var code = "";
	var codeLength = 6;// 驗證碼的長度
	var selectChar = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E',
			'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
			'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ];
	for (var i = 0; i < codeLength; i++) {
		var charIndex = Math.floor(Math.random() * 36);
		code += selectChar[charIndex];
	}
	return code;
}
