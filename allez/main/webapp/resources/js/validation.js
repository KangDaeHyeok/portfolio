// form의 유효성 검증을 위한 함수 생성
function checkAddProduct(){
	var productId = document.getElementById("productId"); // 상품코드
	var pname = document.getElementById("pname"); // 상품명 
	var unitPrice = document.getElementById("unitPrice"); // 가격
	var unitsInStock = document.getElementById("unitsInStock"); // 재고
	var image = document.getElementById("image"); // 이미지
	
	// 정규 표현식으로 검증하기 위한 함수
	function check(regExp, e, msg){ // regExpression, element, message
		if(regExp.test(e.value)){
			return true; // submit을 하겠다
		} else {
			alert(msg);
			e.select();
			e.focus();
			return false; // submit을 하지 않겠다. 만약 return만 사용할 시 submit하지 않고 null을 반환
		}
	}
/* 
	<유효성 검증 조건>
	1. 상품 아이디 : 첫번째 문자가 대문자 P이고 숫자를 조합한 5~12자리
	2. 상품명 : 최소 1자리 ~ 최대 50자리
	3. 상품 가격 : 숫자만 입력, 음수는 금지
	4. 재고수 : 숫자만 입력
	5. 이미지 유무 : 제품의 이미지를 삽입
*/	
	// 상품 아이디
	if(!check(/^P[0-9]{4,11}$/, productId, "[상품코드]\n첫번째 문자로 대문자 P, 숫자를 조합한 5~12자리를 입력하세요")) return false;
	// 상품명
	if(pname.value.length<1 || pname.value.length>50){
		alert("[상품명]\n최소 1자리 ~ 최대 50자리를 입력하세요");
		pname.select();
		pname.focus();
		return false;
	}
	// 상품가격 1) 숫자나 문자가 입력되지 않았을 경우
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	// 상품가격 2) 음수가 입력되었을 경우
	if(unitPrice<0){
		alert("[가격]\n음수를 제외한 양수만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	// 재고수
	if(unitsInStock.value.length == 0 || isNaN(unitsInStock.value)){
		alert("[재고수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	// 이미지 유무
	if(!image.value){
		alert("[제품 이미지]\n제품의 이미지를 첨부하세요");
		return false;
	}
	
	document.newProduct.submit(); // form태그의 name속성
}