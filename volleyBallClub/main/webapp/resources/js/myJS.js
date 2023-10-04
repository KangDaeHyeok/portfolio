$(function(){
	
	// 공통으로 사용하는 함수
	var mobMenuR = $(".mobile_menu_right");
	var mobhamBtnR = $(".mobile_right_hambergerBtn");

	var mobMenuL = $(".mobile_menu_left");
	var mobhamBtnL = $(".mobile_left_hambergerBtn");

	var carousel_img = $(".carousel_center li");
	var carouselBtn_L = $(".carousel_left a");
	var carouselBtn_R = $(".carousel_right a");
	var carouselBtn_C = $(".carousel_btn .btn li"); 

	var current = 0;
	var count=0;

	

	// 모바일 네비게이션 보이고 숨기기
	mobMenuR.hide();
	mobhamBtnR.click(function(){
		
		mobMenuL.hide();
		mobMenuR.show();	
	})

	mobMenuL.hide();

	mobhamBtnL.click(function(){
		count++;
		mobMenuR.hide();
		mobMenuL.show();
		

		if(count>1){
			mobMenuL.hide();
			count=0;
		}
	})

	// 모바일 네비게이션 x버튼 창닫기 구현
	$(".close").click(function(){
		$(".mobile_menu_right").hide();
	})	



	// 캐로셀 버튼 클릭시 동작 구문
	carouselBtn_L.click(function(){
		
		var currentImg = carousel_img.eq(current);
		var nextImg = carousel_img.eq(current-=1);

		carouselBtn_C.removeClass("active");
		carouselBtn_C.eq(current).addClass("active");

		currentImg.stop().css("left",0).animate({"left":"100%"});
		nextImg.stop().css("left","-100%").animate({"left":0});

		if(current==-1){
			current=6;
		}
	})

	carouselBtn_R.click(function(){
		var currentImg = carousel_img.eq(current);
		var nextImg = carousel_img.eq(current+=1);

		carouselBtn_C.removeClass("active");
		carouselBtn_C.eq(current).addClass("active");

		currentImg.stop().css("left",0).animate({"left":"100%"});
		nextImg.stop().css("left","-100%").animate({"left":0});

		if(current==6){
			current=-1;

			var currentImg = carousel_img.eq(current);
			var nextImg = carousel_img.eq(current+=1);
			currentImg.stop().css("left",0).animate({"left":"100%"});
			nextImg.stop().css("left","-100%").animate({"left":0});
		}
	})
	
	
	
	// 메뉴 호버 적용하기
	var menu = $("#gnb li");
	var mobile_menu = $("#mobile_gnb li");
	var pageUrl = window.location.href; //창의 url을 가져온다.
	
	$(window).on('load', function(){ //load가 되었을때 실행
	    menu.children("a").removeClass('active'); //다른 active가 있으면 지워준다.
	    mobile_menu.children("a").removeClass('active');
	    
	    if (pageUrl.indexOf('index') > -1) { //url에 about이라는 글자가 있으면 실행
	        menu.eq(0).children("a").addClass('nav_active');
	        mobile_menu.eq(0).children("a").addClass('nav_active');
	    } else if (pageUrl.indexOf('club') > -1) { //url에 contact라는 글자가 있으면 실행
	        menu.eq(2).children("a").addClass('nav_active');
	        mobile_menu.eq(2).children("a").addClass('nav_active');
	    } else if (pageUrl.indexOf('player') > -1) {
	        menu.eq(3).children("a").addClass('nav_active');
	        mobile_menu.eq(3).children("a").addClass('nav_active');
	    } else if (pageUrl.indexOf('fanzone') > -1) {
	        menu.eq(6).children("a").addClass('nav_active');
	        mobile_menu.eq(6).children("a").addClass('nav_active');
	    }
	});
	
	
	// club에서 사용하는 함수
	var uni_btn = $(".uni1723 li");
	var uni_img = $(".img_uni1723 div");
	var uni_mImg =  $(".mImg_uni1723 div");
	
	uni_btn.click(function(){
		var num = $(this).index();

		uni_btn.removeClass("li_active");
		$(this).addClass("li_active");

		uni_img.hide();
		uni_img.eq(num).show();
		
		uni_mImg.hide();
		uni_mImg.eq(num).show();
	})


	var uni_btn2 = $(".uni1117 li");
	var uni_img2 = $(".img_uni1117 div");
	var uni_mImg2 =  $(".mImg_uni1117 div");

	uni_btn2.click(function(){
		// alert("test");
		var num = $(this).index();

		uni_btn2.removeClass("li_active");
		$(this).addClass("li_active");

		uni_img2.hide();
		uni_img2.eq(num).show();
		
		uni_mImg2.hide();
		uni_mImg2.eq(num).show();
	})

})




// 로그인
function login(){
	var frm = document.login_form;
	if(frm.id.value == null || frm.id.value == ""){
		alert("아이디를 입력해주세요");
		frm.id.focus();
		return false;
	} else if(frm.password.value == null || frm.password.value == ""){
		alert("비밀번호를 입력해주세요");	
		frm.password.focus();
		return false;
	}
	frm.submit();
}

// 로그인 안한 상태로 마이페이지 눌렀을 때
function loginpage(){
	alert("로그인해주세요");
	location.href="/profile/login";
}


// 회원가입
function join(){
	var frm = document.join_form;
	if(frm.id.value == null || frm.id.value == ""){
		alert("아이디를 입력해주세요");
		frm.id.focus();
		return false;
	} else if(frm.name.value == null || frm.name.value == ""){
		alert("이름을 입력해주세요");	
		frm.name.focus();
		return false;
	} else if(frm.email.value == null || frm.email.value == ""){
		alert("이메일을 입력해주세요");	
		frm.email.focus();
		return false;
	} else if(!frm.email.value.includes("@")){
		alert("이메일 주소에 @를 포함해주세요");	
		frm.email.focus();
		return false;
	} else if(frm.phone.value == null || frm.phone.value == ""){
		alert("연락처를 입력해주세요");	
		frm.phone.focus();
		return false;
	} else if(frm.zip_code.value == null || frm.zip_code.value == ""){
		alert("우편번호를 입력해주세요");	
		frm.zip_code.focus();
		return false;
	} else if(frm.address.value == null || frm.address.value == ""){
		alert("기본주소를 입력해주세요");	
		frm.address.focus();
		return false;
	} else if(frm.password.value == null || frm.password.value == ""){
		alert("비밀번호를 입력해주세요");	
		frm.password.focus();
		return false;
	} else if(frm.password.value != frm.password_ck.value){
		alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요");	
		frm.password_ck.focus();
		return false;
	}
	
	// 아이디 중복확인
	var check = true;
	
	$.ajax({
	type: "get",
	async: false,
	url: "http://localhost:8090/idCheck",
	data: {id: frm.id.value},
	success: function (data) {
			if(data == 1) {
				check = false;
			} 
		}
	})
	
	if(!check){
		alert("이미 사용중인 ID 입니다.");
		frm.id.focus();
		return false;
	}
	
	frm.submit();
	alert("회원가입을 축하드립니다. 로그인해주세요.");
}


// 카카오 주소 API 함수
function post() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("address").value = extraAddr;
            
            } else {
                document.getElementById("address").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("zip_code").value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailed_address").focus();
        }
    }).open();
}


// 회원정보수정
function updateMember(){
	var frm = document.mypage_form;
	if(frm.name.value == null || frm.name.value == ""){
		alert("이름을 입력해주세요");	
		frm.name.focus();
		return false;
	} else if(frm.email.value == null || frm.email.value == ""){
		alert("이메일을 입력해주세요");	
		frm.email.focus();
		return false;
	} else if(!frm.email.value.includes("@")){
		alert("이메일 주소에 @를 포함해주세요");	
		frm.email.focus();
		return false;
	} else if(frm.phone.value == null || frm.phone.value == ""){
		alert("연락처를 입력해주세요");	
		frm.phone.focus();
		return false;
	} else if(frm.zip_code.value == null || frm.zip_code.value == ""){
		alert("우편번호를 입력해주세요");	
		frm.zip_code.focus();
		return false;
	} else if(frm.address.value == null || frm.address.value == ""){
		alert("기본주소를 입력해주세요");	
		frm.address.focus();
		return false;
	} else if(frm.password.value == null || frm.password.value == ""){
		alert("비밀번호를 입력해주세요");	
		frm.password.focus();
		return false;
	} else if(frm.password.value != frm.password_ck.value){
		alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요");	
		frm.password_ck.focus();
		return false;
	}
	
	frm.submit();
	alert("회원정보가 수정되었습니다.");
}


//회원탈퇴
function deleteMember(){
	var id = document.mypage_form.id.value;
	var result = confirm("회원탈퇴를 진행하시겠습니까?");
	
	if(result){
		alert("회원탈퇴 처리되었습니다.");
		
		$.ajax({
			type: "get",
			async: false,
			url: "http://localhost:8090/deleteProfile",
			data: {id: id}
		})
	} else {
		return false;
	}
	
	location.href="/logout";
}


//게시글 작성
function writeBoard(){
	var frm = document.write_form;
	
	if(frm.title.value == null || frm.title.value == ""){
		alert("제목을 입력해주세요");
		frm.title.focus();
		return false;
	} else if(frm.content.value == null || frm.content.value == ""){
		alert("내용을 입력해주세요");
		frm.content.focus();
		return false;
	} else if(frm.secret.value == 1 && (frm.secret_num.value == null || frm.secret_num.value == "" || frm.secret_num.value.trim() == "") ){
		alert("비밀글의 비밀번호를 설정하세요.");
		frm.secret_num.focus();
		return false;
	} else if(frm.secret.value == 0){
		frm.secret_num.value = "null";
	}
	
	frm.submit();
}


//게시글 삭제
function deleteCheck(){
	var result = confirm("게시물을 삭제하시겠습니까?");
	if(result) return true;
	else return false;
}


//게시글 수정
function updateCheck(){
	var frm =  document.update_form;
	
	if(frm.title.value == null || frm.title.value == ""){
		alert("제목을 입력해주세요");
		frm.title.focus();
		return false;
	} else if(frm.content.value == null || frm.content.value == ""){
		alert("내용을 입력해주세요");
		frm.content.focus();
		return false;
	} else if(frm.secret.value == 1 && (frm.secret_num.value == null || frm.secret_num.value == "" || frm.secret_num.value.trim() == "") ){
		alert("비밀글의 비밀번호를 설정하세요.");
		frm.secret_num.focus();
		return false;
	} else if(frm.secret.value == 0){
		frm.secret_num.value = "null";
	}
	
	var result = confirm("게시물을 수정하시겠습니까?");
	
	
	if(result) frm.submit();
	else return false;
}

//이전 페이지 이동
function pageBack(){
	history.back();
}


//댓글 등록
function addReply(){
	var frm = document.add_form;
	
	if(frm.title.value  == null || frm.title.value  == ""){
		alert("제목을 입력해주세요");
		frm.title.focus();
		return false;
	} else if(frm.content.value == null || frm.content.value == ""){
		alert("내용을 입력해주세요");
		frm.content.focus();
		return false;
	}
	
		
	$.ajax({
		type: "get",
		async: false,
		url: "http://localhost:8090/insertReply",
		data: {
				writer: frm.writer.value,
				title : frm.title.value,
				content : frm.content.value,
				b_idx : frm.b_idx.value,
				id : frm.id.value
			},
		success: function (reply) {
				alert("댓글이 등록되었습니다");
				location.reload();
		}
		
	})
}

//댓글 수정
function modifyReply(){
	var result = confirm("댓글을 수정하시겠습니까?");
	
	if(result){
		return true;
	} else{
		return false;
	}
}

//댓글 삭제
function deleteComment(){
	var result = confirm("댓글을 삭제하시겠습니까?");
	
	if(result){
		return true;
	} else{
		return false;
	}
}
