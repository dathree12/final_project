		$(document).ready(() => {
		 var csrfToken = $("meta[name='csrf-token']").attr('content');
	    var csrfHeader = $("meta[name='csrf-headerName']").attr('content');
	    $(document).ajaxSend(function (e, xhr, options) {
	        xhr.setRequestHeader(csrfHeader, csrfToken);
			
	    });
		  $('#allCheck').on('click',() => {
			
		  	if($('#allCheck').is(":checked") == false){
				$('#agree_service_check0').prop("checked", false);
			 	$('#agree_service_check1').prop("checked", false);
		  	}else{
		  		$('#agree_service_check0').prop("checked", true);
				$('#agree_service_check1').prop("checked", true);
				terms_btn.focus();
		  	}
		  });
		  
		  $('#agree_service_check0').on('click',() => {
				
			  	if($('#agree_service_check0').is(":checked") == true){
					if($('#agree_service_check1').is(":checked") == true){
						$('#allCheck').prop("checked", true);
					}
			  	}else{
			  		$('#allCheck').prop("checked", false);
			  	}	
			  
		  });
		  $('#agree_service_check1').on('click',() => {
			  	if($('#agree_service_check1').is(":checked") == true ){
					if($('#agree_service_check0').is(":checked") == true){
						$('#allCheck').prop("checked", true);
					}
			  
			  	}else{
			  		$('#allCheck').prop("checked", false);
			  	}	
		  });
		  
		  $('#terms_btn').on('click',() => {
			  
			  if($('#allCheck').is(":checked") == false){
					
			  	alert('약관을 읽고 모두 동의 해주세요');	
			  }else{
				  
			  }
			  });
	
		 	$("#userId").keyup((e) => {
	 		let id = $(e.target).val().trim();
			var idReg = /^[a-z][a-z\d]{4,11}$/g;
			
			
			if (!idReg.test($("#userId").val() )) {
				lengthCk ="영문자로 시작하여 소문자, 숫자를 포함한 5~12자로 기입해주세요.";
				$("#idck1").html(" ")
				$("#idck2").html(lengthCk)
			}else{
				$.ajax({
					type: "get",
					url: "${path}/member/idCheck",
					dataType: "json",
					data: {
						id
					},
					success: function(data) {
						console.log(data);
						
						if(data.validate !== true) {
						
							result ="사용 가능한 아이디 입니다.";
							$("#idck1").html(result)
							$("#idck2").html(" ")
						} else {
							result ="이미 사용중인 아이디 입니다.";	
							$("#idck2").html(result)
							$("#idck1").html(" ")
						}
					
					},
					error: function(e) {
						console.log(e);
					}				
				});
			}	
	 	});
	 	
	 	
	 	/*닉네임 중복*/
		$("#userNname").keyup((e) => {
			let Nname = $(e.target).val().trim();
		    var nickReg = /^[가-힣a-zA-Z]{2,11}$/;
			
		    if (!nickReg.test($("#userNname").val() )) {
		    	nickCk ="영문대소문자, 한글을 포함한 2~12글자를 입력하세요.";
				$("#nameck1").html(" ")
				$("#nameck2").html(nickCk)

			}else {
			    $.ajax({
					type: "get",
					url: "${path}/member/NnameCheck",
					dataType: "json",
					data: {
						Nname
					},
					success: function(data) {
						console.log(data);
						
						if(data.validate !== true) {
							result ="사용 가능한 닉네임 입니다.";
							$("#nameck1").html(result)
							$("#nameck2").html(" ")
						} else {
							result ="이미 사용중인 닉네임 입니다.";	
							$("#nameck2").html(result)
							$("#nameck1").html(" ")
						}
					
					},
					error: function(e) {
						console.log(e);
					}				
				});
			}
		});
	  
	  
		  /*비밀번호 체크*/
		$("#userPwdCk").blur((e) => {
			let pass1 = $("#userPwd").val();
			let pass2 = $(e.target).val();
			if(pass1.trim() != pass2.trim()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#userPwd").val("");
				$(e.target).val("");
				$("#userPwd").focus();
			}
		});	
		  
		  /*비밀번호 유효성체크*/
		$("#userPwd").keyup((e) => {
			let pwd = $("#userPwd").val();
			var pwdReg = /^[\w\d!@#$%^&*]{8,16}$/;

		    if (!pwdReg.test($("#userPwd").val() )) {
		    	pwdCk ="영문대소문자, 특수문자, 숫자를 포함한 8~16자를 입력하세요.";
				$("#pwdck1").html(" ")
				$("#pwdck2").html(pwdCk)
			}else if(pwd === $("#userId").val()){
				idfail ="아이디를 포함된 비밀번호는 사용하실 수 없습니다.";
				$("#pwdck1").html(" ")
				$("#pwdck2").html(idfail)
			}else{
				pwdOk ="사용가능한 비밀번호 입니다.";
				$("#pwdck1").html(pwdOk)
				$("#pwdck2").html(" ")
				
			}
		});
		  
		/*이름 유효성 검사 */  
		$("#name").keyup((e) => {
			var nameReg =  /^[가-힣]{2,}$/;

			if( !nameReg.test( $("#name").val() ) ) {
				namefail ="한글로 2글자 이상 입력해주세요";
				$("#name1").html(" ")
				$("#name2").html(namefail)
				
			}else{
				nameok ="사용가능한 이름 입니다.";
				$("#name1").html(nameok)
				$("#name2").html(" ")
			}
			
		});
		  
		
		 
		 /*이메일 유효성 검사*/
		 $("#Email1").keyup((e) => {
			var Email1 = $("#Email1").val();
			var Email2 = $("#Email2").val();
			$("#userEmail").val(Email1 + Email2);
			var email  = $("#userEmail").val();
			var emailck = /^[\w\d]{6,16}$/;
			
			
			if( emailck.test( $("#Email1").val() ) ) {
				$.ajax({
					type: "get",
					url: "${path}/member/emailCheck",
					dataType: "json",
					data: {
						email
					},
					success: function(data) {
						console.log(data);
						
						if(data.validate !== true) {
							result ="사용 가능한 이메일 입니다.";
							$("#mail1").html(result)
							$("#mail2").html(" ")
						} else {
							result ="이미 사용중인 이메일 입니다.";	
							$("#mail1").html(" ")
							$("#mail2").html(result)
						}
					},
					error: function(e) {
						console.log(e);
					}				
				});			
			}else{
				emailfail ="영문대소문자 / 숫자를 포함한 6~16자를 입력해주세요.";
				$("#mail1").html(" ")
				$("#mail2").html(emailfail)
			}
	
		 });
		 $("#Email2").change((e) => {
			var Email1 = $("#Email1").val();
			var Email2 = $("#Email2").val();
			$("#userEmail").val(Email1 + Email2);
			var email  = $("#userEmail").val();
			var emailck = /^[\w\d]{6,16}$/;
			
			
			if( emailck.test( $("#Email1").val() ) ) {
				$.ajax({
					type: "get",
					url: "${path}/member/emailCheck",
					dataType: "json",
					data: {
						email
					},
					success: function(data) {
						console.log(data);
						
						if(data.validate !== true) {
							result ="사용 가능한 이메일 입니다.";
							$("#mail1").html(result)
							$("#mail2").html(" ")
						} else {
							result ="이미 사용중인 이메일 입니다.";	
							$("#mail1").html(" ")
							$("#mail2").html(result)
						}
					},
					error: function(e) {
						console.log(e);
					}				
				});			
			}else{
				emailfail ="영문대소문자 / 숫자를 포함한 6~16자를 입력해주세요.";
				$("#mail1").html(" ")
				$("#mail2").html(emailfail)
			}
		 
		 });
		 
		  /*이메일 조합.*/
		 $("#en_btn").on("click", () => {
				var Email1 = $("#Email1").val();
			 	var Email2 = $("#Email2").val();
			 	
			  	$("#userEmail").val(Email1 + Email2);
		 });
		  
		 
	  
	  /*핸드폰 번호 조합*/
		 $("#en_btn").on("click", () => {
			var phone1 = $("#phone1").val();
		    var phone2 = $("#phone2").val();
		    var phone3 = $("#phone3").val();
		    
			$("#userPhone").val(phone1 + '-' +  phone2 + '-' + phone3);
  
	  	});
	  
	  	/*핸드폰 유효성*/
		 $("#phone2").blur((e) => {
			 var phone2Reg = /^[0-9]{4}$/;
			 var phone3Reg = /^[0-9]{4}$/;

			 if (!phone2Reg.test( $("#phone2").val()) || !phone3Reg.test( $("#phone3").val())) {
				 	phonefail =  "번호를 입력하세요.";
					$("#ph1").html(" ")
					$("#ph2").html(phonefail)
			 }else{
				 	phoneok = "사용 가능합니다.";
					$("#ph1").html(phoneok)
					$("#ph2").html(" ")
			 }
			 
		  });
	  	
		 $("#phone3").blur((e) => {
			 var phone2Reg = /^[0-9]{4}$/;
			 var phone3Reg = /^[0-9]{4}$/;
			 var  phone1 = $("#phone1").val();
			 var phone2 = $("#phone2").val();
			 var phone3 = $("#phone3").val();   
			 $("#userPhone").val(phone1 + '-' +  phone2 + '-' + phone3);
			 var phone = $("#userPhone").val();      
			 
		 if (!phone2Reg.test( $("#phone2").val()) || !phone3Reg.test( $("#phone3").val())) {
				 	phonefail =  "번호를 입력하세요.";
					$("#ph1").html(" ")
					$("#ph2").html(phonefail)
			 }else{
				 $.ajax({
						type: "get",
						url: "${path}/member/phoneCheck",
						dataType: "json",
						data: {
							phone
						},
						success: function(data) {
							console.log(data);
							
							if(data.validate !== true) {
								result ="사용 가능한 번호 입니다.";
								$("#ph1").html(result)
								$("#ph2").html(" ")
							} else {
								result ="이미 사용중인 번호 입니다.";	
								$("#ph1").html(" ")
								$("#ph2").html(result)
							}
						},
						error: function(e) {
							console.log(e);
						}				
					});			
			 }
			 
		  });
		 
		 
		 
		 
		 
		 
		 
		 
		 /*회원가입시 공란 체크*/
		 $("#en_btn").on("click", () => {
			 
			 	var userid =$('#userId').val();
			    if(userid == '') {   	
	
			    	 alert('아이디를 입력해주세요.');
				        return false;
			    }
			 	var usernname =$('#userNname').val();
			    if(usernname == '') {   	
	
			    	 alert('닉네임을 입력해주세요.');
				        return false;
			    }
			 	var username =$('#userName').val();
			    if(username == '') {   	
	
			    	 alert('이름을 입력해주세요.');
				        return false;
			    }

			   if ( $('#Genre0').is(":checked") == false && 
					$('#Genre1').is(":checked") == false && 
					$('#Genre2').is(":checked") == false && 
					$('#Genre3').is(":checked") == false && 
					$('#Genre4').is(":checked") == false && 
					$('#Genre5').is(":checked") == false) {
				       	
				       	alert("관심 장르를 선택해주세요");
				    	return false;
			   }
			   
			   var useremail =$('#Email1').val();
			    if(useremail == '') {   	
	
			    	 alert('이메일을 입력해주세요.');
				        return false;
			    }
			
			    var mobile2 =$('#phone2').val();
			    if(mobile2 == '') {   	
	
			    	 alert('번호를 입력해주세요.');
				        return false;
			    }
			    
			    var mobile3 = $('#phone3').val;
			    if(mobile3 == '') {   	
	
			    	 alert('번호를 입력해주세요.');
				        return false;
			    }
			    var address = $('#userAddress').val;
			    if(address == '') {   	
	
			    	 alert('주소를 입력해주세요');
				        return false;
			    }
		 });
	  
		/* 취소하기*/
		$('#en_cancle').on('click',() => {
			 if(confirm("정말로 취소하시겠습니까?")){
				 location.replace("${path}/");
			  }
		});
		  
		 
		});