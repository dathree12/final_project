		$(document).ready(() => {
		var csrfToken = $("meta[name='csrf-token']").attr('content');
	    var csrfHeader = $("meta[name='csrf-headerName']").attr('content');
	    $(document).ajaxSend(function (e, xhr, options) {
	        xhr.setRequestHeader(csrfHeader, csrfToken);
			
	    });
		  
		  
		  /*이메일 핸드폰 박스 선택*/
		 $('#phone_check').on('click',() => {
			 
			 if ($('#phone_check').is(":checked") == true) {
				 	$('#phoneSearch').css('display','');
					$('#emailSearch').css('display','none');
			}
		});
		 $('#email_check').on('click',() => {
			 
			 if ($('#email_check').is(":checked") == true) {
				 	$('#emailSerch').css('display','');
					$('#phoneSerch').css('display','none');
			}
		});
		 
		 /*핸드폰 번호로 id 찾기*/
		 $('#search_btn').on('click',() => {
		 		var name = $("#search_name").val().trim();
		 		var email = $("#search_email").val().trim();
		 		var phone1 = $("#phone1").val();
			    var phone2 = $("#phone2").val();
			    var phone3 = $("#phone3").val();
				$("#search_phone").val(phone1 + '-' +  phone2 + '-' + phone3);
		 		var phone = $("#search_phone").val().trim();
	
		 		if ($('#email_check').is(":checked") == true) {
					$.ajax({
						type: "post",
						url: "searchIdEmail",
						dataType: "json",
						data: {
						 name, 
						 email
						},
						success: function(data) {
							if (data.result != null) {
								$("#idresult1").html(name + '님의 아이디는 ' + data.result +'입니다.')
								$("#idresult2").html(' ')
							}else{
								fail = '가입된 아이디가 없습니다. 다시 입력해주세요'
								$("#idresult1").html(' ')
								$("#idresult2").html(fail)								
							}	
						},
						error: function(e) {
							console.log(e);
						}				
					});
				}else if ($('#phone_check').is(":checked") == true){
					$.ajax({
						type: "post",
						url: "searchIdPhone",
						dataType: "json",
						data: {
						 name, 
						 phone
						},
						success: function(data) {
							if (data.result != null) {
								$("#idresult1").html(name + '님의 아이디는 ' + data.result +'입니다.')
								$("#idresult2").html(' ')
							}else{
								fail = '가입된 아이디가 없습니다. 다시 입력해주세요'
								$("#idresult1").html(' ')
								$("#idresult2").html(fail)								
							}	
						},
						error: function(e) {
							console.log(e);
						}				
					});
				}else{
					alert('이메일, 핸드폰번호 찾기 중 선택해주세요.')
				}
		
		 });
		 
		 
		  /*비밀번호찾기*/
		     $('#ck_btn').on('click',() => {
 		var name = $("#pwdName").val().trim();
 		var id = $("#pwdId").val().trim();
 		var email = $("#pwdemail").val().trim();
		var sus = "이메일로 임시 비밀번호를 발송했습니다.";
			$.ajax({
				type: "post",
				url: "findpw",
				dataType: "json",
				data: {
				 name,
				 id,
				 email
				},
				success: function(data) {
					if (data.result === sus) {
						$("#pwdsuccess").html(data.result)
						$("#pwdfail").html(' ')
					}else{
						$("#pwdsuccess").html(' ')
						$("#pwdfail").html(data.result)								
					}		 
				},
				error: function(e) {
					console.log(e);
				}				
			});
    }); 

});
	
	
	
