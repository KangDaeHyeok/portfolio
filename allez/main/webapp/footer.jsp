<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- core태그를 쓰기 위한 taglib 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://kit.fontawesome.com/1b3d304ab8.js" crossorigin="anonymous"></script>

<style>
	/* @font-face {
	    font-family: 'Eoe_Zno_EB';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_EB.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	*{
		 font-family: 'Eoe_Zno_EB';
	} */

  .footer-distributed{
  	position: relative;
      background: #666;
      box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
      box-sizing: border-box;
      width: 100%;
      text-align: left;
      font: bold 16px sans-serif;
      padding: 55px 50px;
  }

  .footer-distributed .footer-left,
  .footer-distributed .footer-center,
  .footer-distributed .footer-right{
      display: inline-block;
      vertical-align: top;
  }

  /* Footer left */

  .footer-distributed .footer-left{
      width: 40%;
  }

  /* The company logo */

  .footer-distributed h3{
      color:  #ffffff;
      font: normal 36px 'Open Sans', cursive;
      margin: 0;
  }


  /* Footer links */

  .footer-distributed .footer-links{
      color:  #ffffff;
      margin: 20px 0 12px;
      padding: 0;
  }

  .footer-distributed .footer-links a{
      display:inline-block;
      line-height: 1.8;
      font-weight:400;
      text-decoration: none;
      color:  inherit;
  }

  .footer-distributed .footer-company-name{
      color:  white;
      font-size: 14px;
      font-weight: normal;
      margin: 0;
  }

  /* Footer Center */

  .footer-distributed .footer-center{
      width: 35%;
  }

  .footer-distributed .footer-center i{
      background-color:  #33383b;
      color: #ffffff;
      font-size: 25px;
      width: 38px;
      height: 38px;
      border-radius: 50%;
      text-align: center;
      line-height: 42px;
      margin: 10px 15px;
      vertical-align: middle;
  }

  .footer-distributed .footer-center i.fa-envelope{
      font-size: 17px;
      line-height: 38px;
  }

  .footer-distributed .footer-center p{
      display: inline-block;
      color: #ffffff;
      font-weight:400;
      vertical-align: middle;
      margin:0;
  }

  .footer-distributed .footer-center p span{
      display:block;
      font-weight: normal;
      font-size:14px;
      line-height:2;
  }

  .footer-distributed .footer-center p a{
      color:  #6BB3EB;
      text-decoration: none;;
  }

  .footer-distributed .footer-links a:before {
      content: "|";
      font-weight:300;
      font-size: 20px;
      left: 0;
      color: #fff;
      display: inline-block;
      padding-right: 5px;
  }

  .footer-distributed .footer-links .link-1:before {
      content: none;
  }

  /* Footer Right */

  .footer-distributed .footer-right{
      width: 20%;
  }

  .footer-distributed .footer-company-about{
      line-height: 20px;
      color:  #92999f;
      font-size: 13px;
      font-weight: normal;
      margin: 0;
  }

  .footer-distributed .footer-company-about span{
      display: block;
      color:  #ffffff;
      font-size: 14px;
      font-weight: bold;
      margin-bottom: 20px;
  }

  .footer-distributed .footer-icons{
      margin-top: 25px;
  }

  .footer-distributed .footer-icons a{
      display: inline-block;
      width: 35px;
      height: 35px;
      cursor: pointer;
      background-color:  #33383b;
      border-radius: 2px;
      font-size: 20px;
      color: #ffffff;
      text-align: center;
      line-height: 35px;
      margin-right: 3px;
      margin-bottom: 5px;
  }

  /* If you don't want the footer to be responsive, remove these media queries */

  @media (max-width: 880px) {

      .footer-distributed{
        font: bold 14px sans-serif;
    }

    .footer-distributed .footer-left,
    .footer-distributed .footer-center,
    .footer-distributed .footer-right{
        display: block;
        width: 100%;
        margin-bottom: 40px;
        text-align: center;
    }

    .footer-distributed .footer-center i{
        margin-left: 0;
    }

}
</style>

<!-- ------- footer ------- -->
<footer class="footer-distributed cs_bot">
	<div class="footer-left">
		<img src='<c:url value="/resources/images/index/logo_footer.png"/>'>
		<p class="footer-links">
			<a href='<c:url value="/index.jsp"/>' class="link-1 blink">Home</a>
			<a href='<c:url value="/car/models.jsp?model=ev"/>' class="blink">Model</a> 
			<a href='<c:url value="/board/AboutUs.jsp"/>' class="blink">About</a>
			<a href='<c:url value="/board/faq_board.jsp"/>' class="blink">FAQ</a>
			<a href='<c:url value="/board/Members.jsp"/>' class="blink">Members</a>
		</p>
		<p class="footer-company-name">COPYRIGHT ⓒ HYUNDAI MOTOR COMPANY.
			ALL RIGHTS RESERVED.
		</p>
	</div>
	<div class="footer-center">
		<div>
			<i class="fa fa-map-marker"></i>
			<p>
				현대자동차 드라이빙라운지 용산<br>
			</p>
		</div>

		<div>
			<i class="fa fa-phone"></i>
			<p>02-712-7365</p>
		</div>

		<div>
			<i class="fa fa-envelope"></i>
			<p>
				<a href="#">ioniq.crservice@hmil.net</a>
			</p>
		</div>
	</div>

	<div class="footer-right">
		<p class="footer-company-about">
			<span>About the company</span> 현대는 지속가능한(Sustainable) 모빌리티 솔루션을 제공하는
			비전을 가지고, 일상의 움직임 속에서 의미를 발견하고 이동하는 모든 순간 영감을 느낄 수 있도록, 혁신적인 제품을 만들고
			편리한 서비스를 제공하기 위하여 존재합니다.
		</p>

		<div class="footer-icons">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i
				class="fa-brands fa-instagram"></i></a> <a href="#"><i
				class="fa fa-github"></i></a>
		</div>
	</div>

</footer>

