// 게시판 비밀번호 팝업창에서 확인하기 
function passButton() {
	var childPwd = document.querySelector('#childPwd').value;
	var parentPwd = document.querySelector('#parentPwd').value;
	var proposeNo = document.querySelector('#proposeNo').value;
	
	if (childPwd != null && childPwd != "" && childPwd.trim() != "") {
		if (childPwd == parentPwd) {
			alert("비밀번호가 일치합니다");
			window.opener.location.href="bcBoardRead?proposeNo=" + proposeNo + "";
			self.close();
		} else {
			var a = document.getElementById('childPwd');
			alert("다시 입력해주세요");
			a.value = null;
			a.focus();
		}
	} else {
		// 비밀번호 null
		alert("비밀번호를 입력해주세요")
	} 
}