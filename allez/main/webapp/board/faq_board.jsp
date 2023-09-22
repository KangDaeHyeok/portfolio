<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
 <!-- bootstrap css -->
  <link rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
  integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
  crossorigin="anonymous">

  <!-- bootstrap icon -->
  <link rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

  <style>
  	body{
  		overflow-x: hidden;
  	}
    ul li, ol li{
      list-style: none;
    }
    .jumbotron{
    	background-color : #fff;
    }
    .btn-link{
    	color:white !important;
    	
    }
    .btn-link:hover{
    	color:gold !important;
    	text-decoration : none;
    }
    .card-header{
    	background-color : #323232;
    }  	
    #accordionExample ul{
    	padding: 0;
    }
  </style>
</head>

<!-- 검색 jQuery-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
  <!-- nav추가 -->
  <jsp:include page="../menu.jsp" />
		
  <div class="jumbotron text-center">
    <h1 class="display-4">자주하는 질문</h1>
    <hr class="mt-5">
    <p class=""><small>자주하는 질문을 확인해보세요.</small></p>
  </div>


  

  <div class="container mb-5 pb-5">
  	<div class="row search_box">
	    <div class="input-group col-md-4 offset-md-4 blink">
	      <input id="search" type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="" aria-describedby="basic-addon1">
	      <div class="input-group-append">
	        <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
	      </div>
	    </div>
	</div>
  
    <div class="accordion mt-5" id="accordionExample">
      <ul>
        <li><div class="card">
        <div class="card-header" id="headingOne">
          <h2 class="mb-0">
            <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
              [차량정비] (상용) 주행 중 갑자기 엔진 출력이 떨어지면서 노킹 현상이 나타납니다. 왜 그런가요?
            </button>
          </h2>
        </div>

        <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
          <div class="card-body p-5">
            엔진 출력이 급격히 떨어지고 노킹 현상 Knocking, 엔진의 연료실 벽을 작은 망치로 두드리는 듯한 소리가 나는 현상이 지속적으로 발생하면 엔진의 오버히트를 의심해 봐야 합니다. <br>
            오버히트는 냉각수가 부족하거나 샐 경우, 워터펌프 구동벨트가 끊어진 경우, 냉각팬이 돌지 않을 경우 등 여러 가지 원인으로 인해 엔진이 과열돼 증기가 끓어오르는 현상입니다. <br>
            이때는 계기판에 있는 냉각수 온도 게이지가 적색 눈금 H을 가리키게 됩니다. <br>
            겨울철에는 냉각수에 부동액이 들어있지 않거나 엔진 내부가 동결되어 냉각수가 순환하지 못할 때에도 동일한 현상이 발생합니다. <br>
            주행 중 엔진이 과열돼 오버히트 현상이 발생했을 때는 당황하지 말고 비상경고등을 켠 채 가능한 빨리 도로 옆 안전한 곳에 차를 세웁니다. <br>
            이때 시동을 바로 끄면 엔진이 고착되기 때문에 변속 레버를 중립에 놓고 약 2 ~ 3분간 시동을 그대로 켜놓은 상태에서 엔진 실내에 통풍이 잘 되도록 후드를 열어 놓고, 냉각수 온도 게이지가 정상 C에 가까워질 때까지 엔진을 냉각시킵니다. <br>
            후드를 열 때는 뜨거운 수증기나 물이 뿜어져 나오거나 후드 자체가 뜨거울 수 있으므로 주의해야 합니다. <br>
            공회전 상태에서도 냉각수 온도 게이지가 떨어지지 않으면 시동을 끄고 자연적으로 엔진을 냉각시킵니다. <br>
            만약 냉각수가 차 밑으로 흘러넘치거나 수증기가 후드 위로 새 나올 경우에는 엔진을 정지시키고 차량을 견인해 <code>정비</code>공장에 입고 후 누수 부위를 점검하고 <code>정비</code>를 받아야 합니다. 
          </div>
        </div>
      </div></li>

        <li><div class="card">
        <div class="card-header" id="headingTwo">
          <h2 class="mb-0">
            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
              [차량정비] (상용) 주행 중 갑자기 시동이 꺼지는 현상이 발생합니다. 어디에 문제가 있는 것일까요?
            </button>
          </h2>
        </div>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
          <div class="card-body">
            주행 중 시동이 꺼져 당황하신 적이 있을 것입니다.<br>
            시동 꺼짐 현상은 보통 연료계통과 점화계통, 엔진 전자제어계통 등에 이상이 있을 경우 발생합니다.<br>
            전자제어 가솔린 엔진의 경우 연료 펌프와 연료 필터 막힘, 인젝터·점화 코일·컴퓨터 ECU 고장, 엔진 관련 센서 이상, 엔진 관련 휴즈 단선, 엔진 배선 합선 등이 원인이 될 수 있습니다.<br>
            LPG를 사용하는 엔진의 경우에는 연료계통 부품 종류가 다를 뿐 가솔린 엔진과 큰 차이는 없으나 베이퍼라이져, 믹서 등의 고장으로 인해서도 시동 꺼짐 현상이 발생할 수 있습니다.<br>
            디젤 연료를 사용하는 엔진은 기계식과 전자제어식 커먼레일 엔진으로 구분할 수 있는데, 기계식인 경우는 연료 필터 막힘, 연료계통 공기 유입, 인젝션 펌프 고장으로 인해 시동 꺼짐이 발생할 수 있고, 전자제어식인 경우 엔진 관련 센서, 연료 필터 막힘, 연료에 이물질 유입, 커먼레일시스템고압 펌프·레일 압력 센서·인젝터 등, 엔진 관련 휴즈 단선, 배선합선, ECU 고장 등으로 인해서도시동 꺼짐이 발생할 수 있습니다.<br>
            시동 꺼짐 현상은 운전자의 안전과 직결되는 것이므로 고장 발생 시 <code>정비</code>업체를 필히 방문하여 점검 및 <code>정비</code>를 받아야 합니다.<br>
            또한 정기적으로 차량 점검을 받아 이상이 없는지 체크를 해주는 것도 시동 꺼짐 현상을 예방할 수 있는 방법입니다.<br>
          </div>
        </div>
      </div></li>

        <li><div class="card">
        <div class="card-header" id="headingThree">
          <h2 class="mb-0">
            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
              [홈페이지] 실 운행자 등록 시 사용 가능한 기능은 무엇인가요?
            </button>
          </h2>
        </div>
        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
          <div class="card-body">
            실 운행자로 등록되신 경우에 <code>정비</code>예약, 수리 이력 확인 등 차량운행 시 필요한 기능 활용이 가능합니다.
          </div>
        </div>
      </div></li>

        <li> <div class="card">
        <div class="card-header" id="headingFour">
          <h2 class="mb-0">
            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
              [모젠서비스] 원격진단 서비스는 어떻게 제공되나요?
            </button>
          </h2>
        </div>
        <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
          <div class="card-body">
            단말기 INFO 버튼을 누르시고, `차량관리 > 차량진단` 버튼을 눌러 이용이 가능합니다. 원격진단은 파워트레인 및 ABS/ESP 시스템을 진단하여 고장 발생시 후속 조치 사항을 상담원을 통해 안내받는 서비스입니다. 모젠 상담원을 통해 진단 내용을 설명 받고 긴급출동, <code>정비</code>소까지 길안내 혹은 <code>정비</code>예약 등의 후속 조치를 안내 받으실 수 있습니다. 원격 진단 서비스는 모젠 서비스 가입 고객님만 이용할 수 있으며 일부 차량에서는 제공이 어려운 점 양해 부탁드립니다. ( 제외 단말기 - MTS-200,300)
          </div>
        </div>
      </div></li>

        <li><div class="card">
        <div class="card-header" id="headingFive">
          <h2 class="mb-0">
            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
              [차량정비] 차량의 연비가 안 좋은데 어떻게 해야 하지요?
            </button>
          </h2>
        </div>
        <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
          <div class="card-body">
            많은 분들이 연비에 대해 질문을 하십니다.<br><br>

            질문의 유형은 대략 두 가지 정도로 요약할 수 있습니다.<br>
            첫 번째는 차량에 부착되어 있는 연비 표시 스티커상의 연비와 실주행시의 연비가 틀린 경우,<br>
            두 번째는 종전보다 연료가 짧은 시간에 과다 소비될 때입니다.<br><br>

            첫 번째 질문에 대한 답변은 연비의 정의나 측정방법에 대해 정확히 알지 못해 제기될 수 있는
            질문입니다.<br>
            현재 국내에서 실시되고 있는 연비 측정방법은 0K모드(주행거리 160km이내의 차량을 가지고 테스트)로
            사용할 운전자가 체감하는 성능과 제원표상 제원과 오차를 최대한 줄이기 위해 정밀 측정되고 있습니다.
            하지만 운전자가 운행하는 구간의 교통흐름과 도로 상태, 운전 방법, 차량 적재물의 무게, 차량 상태 등
            연비에 영향을 끼칠 수 있는 요인에 따라 실제 표시연비와는 차이가 날 수 있습니다.<br><br>

            두 번째는 차량의 상태와 밀접한 연관이 있습니다.<br>
            현재의 운행되는 대부분의 차량들은 연료 분사량을 일정하게 유지시켜주기 위해 전자제어를 사용하고
            있는데, 이 연료 분사량을 결정하는 센서의 고장, 또는 엔진내부의 청결함이 떨어질 때,
            소모품(엔진오일 · 점화플러그 · 점화케이블 · 배전기캡 · 로터 등)을 제때 교환하자 않았을 경우에도
            연비가 나빠질 수 있습니다. 즉, 연료가 비정상적으로 과다 소모되는 것이지요.<br><br>

            이런 경우 정비업체를 방문해 전문 진단장비를 사용, 엔진 상태를 점검 받아 보는 것이 좋습니다.
          </div>
        </div>
      </div></li>
      </ul> 
    </div>
  </div>
  <jsp:include page="../footer.jsp" />


  <!-- bootstrap js cdn -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
  crossorigin="anonymous"></script>
  <script
  src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
  crossorigin="anonymous"></script>
  <script>
    $(document).ready(function(){

      // F&Q 게시판 js
      $("#search").on("keyup", function() {

        var value = $(this).val().toLowerCase();

        $("#accordionExample li").filter(function() {

          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)

        });
      });
    });
  </script>
</body>
</html>