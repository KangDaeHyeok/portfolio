<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>
 <!-- bootstrap css -->
  <link rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
  integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
  crossorigin="anonymous">

  <!-- bootstrap icon -->
  <link rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

  <style>
    ul li, ol li{
      list-style: none;
    }
    .jumbotron{
      background-color: #fff;
    }
  </style>
</head>


<body>
  <!-- nav추가 -->
  <jsp:include page="../menu.jsp" />
  <div class="jumbotron text-center">
    <h1 class="display-4">이벤트</h1>
    <hr class="mt-5">
    <p class=""><small>allez의 다양한 이벤트를 만나 보세요.</small></p>
  </div>
  
	<%
		String title1 = "Meet The N";
		String user1 = "모든 회원";
		String date1 = "2023-07-26 ~ 2023-08-20";
		
		String title2 = "여름철 차량 점검";
		String user2 = "allez members 회원";
		String date2 = "2023-08-01 ~ 2023-08-31";
	%>
  <div class="container mb-5 pb-5">
    <div class="row">
      <div class="col-md-6">
        <a href="event_page.jsp?title=<%=title1%>&user=<%=user1%>&date=<%=date1%>">
        	<img width="100%" class="img-fluid blink" src="../resources/images/event/meet-the-n-list-thumb-352x233.jpg" alt="">
        </a>
        <h5 class="mt-3 font-weight-bolder"><%=title1 %></h5>
        <hr>
        <p class="float-left"><%=user1 %></p>
        <small class="float-right"><%=date1 %></small>
      </div>
      <div class="col-md-6">
        <a href="event_page.jsp?title=<%=title2%>&user=<%=user2%>&date=<%=date2%>">
        	<img width="100%" class="img-fluid  blink" src="../resources/images/event/event-bluemembers-hyundaishop-summer-carcare-august-list-thumb-352x233.jpg" alt="">
        </a>
        <h5 class="mt-3 font-weight-bolder"><%=title2 %></h5>
        <hr>
        <p class="float-left"><%=user2 %></p>
        <small class="float-right"><%=date2 %></small>
      </div>

    </div> <!-- row -->
  </div> <!-- container -->
  
  <jsp:include page="../footer.jsp" />
  
  <!-- bootstrap js cdn -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
  crossorigin="anonymous"></script>
  <script
  src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
  crossorigin="anonymous"></script>
</body>
</html>