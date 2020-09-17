<!DOCTYPE html>

<html lang="zxx" class="no-js">

<!-- 한글 깨질 때 붙여넣기!! -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<head>

	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="view/main/img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="codepixer">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	
	<!-- <meta pageEncoding="UTF-8"> -->
	
	<!-- Site Title -->
	<title>DDOK Library</title>

	<!--
			Google Font
			============================================= -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,500,600" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500i" rel="stylesheet">

	<!--
			CSS
			============================================= -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/themify-icons/0.1.2/css/themify-icons.css">
	<link rel="stylesheet" href="view/main/css/linearicons.css">
	<link rel="stylesheet" href="view/main/css/font-awesome.min.css">
	<link rel="stylesheet" href="view/main/css/bootstrap.css">
	<link rel="stylesheet" href="view/main/css/magnific-popup.css">
	<link rel="stylesheet" href="view/main/css/nice-select.css">
	<link rel="stylesheet" href="view/main/css/animate.min.css">
	<link rel="stylesheet" href="view/main/css/owl.carousel.css">
	<link rel="stylesheet" href="view/main/css/main.css">
	
	   <!-- 수정 날짜: 2020.09.08 -->
   <style>
      #weatherdiv{
         float: right;
         color: white;
         text-align: right;
         font-size: 0.9em;
      }
      .weatherimg{
         width: 2em;
         margin-right: 5px;
      }
      
      .selectmenu2{
         display: none;
      }
   @media (min-width: 1024px) {
      #weatherdiv{
         padding-right: 60px;
      }}
   @media (max-width: 800px) {
      .selectmenu {
          display: none; }
       .selectmenu2 {
          display: inline;
       }
    }
   </style>
   
   <!-- JavaScript -->
   <script type="text/javascript">
   // 날씨를 보여준다
	function displayWeather(data) {
	      var items = $(data).find('item');
	      var t1h = '';
	      var weatherimage = '';
	
	      $(items).each(function(index, d) {
	         var category = $(d).find('category').text();
	         var value = $(d).find('obsrValue').text();
	         
	         if (category == 'T1H') {
	            t1h = '기온: ' + value + '℃';
	         }
	         if(category == 'WSD'){
	            if(value >= 9 && weatherimage == 'sun')
	               weatherimage = 'wind';
	         }
	         if (category == 'PTY'){
	            //없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4), 빗방울 (5), 빗방울/눈날림(6), 눈날림(7)
	            if(value == 0){
	               weatherimage = 'sun';
	            }else if(value == 1 || value == 4 || value == 5){
	               weatherimage = 'rainy';
	            }else  {
	               weatherimage = 'snow';
	            }
	         }
	         //result += '<h3>' + category + ' ' + value + ' ' + '</h3>';
	         
	      });
	      
	      var result = '<img src="view/main/img/weather/'+ weatherimage +'.png" alt="weather" title="" class="weatherimg" />' + t1h;
	      $('#weatherdiv').append(result);
	   };

   //Servlet에서 날씨 정보를 가져온다
   function getWeather() {
      $.ajax({
         url : 'weather.mc',
         dataType : 'xml',
         async : false,
         success : function(data) {
            displayWeather(data);
         },
         error : function() {
            alert('error');
         }
      });
   };
   
   $(window).load(function(){
      getWeather();
      
      setInterval(function(){
         $('#weatherdiv').empty();
         getWeather();
      },10000);
   });
   </script>
<!-- ==================================== -->

		<!-- Start Header Area -->
	<div id="header">
		<c:choose>
			<c:when test="${loginuser != null  && loginuser.position != '1'}">
				<div class="container">
		            <div class="row align-items-center justify-content-between d-flex">
		               <div id="logo">
		                  <a href="main.mc"><img src="view/main/img/logo11.png" alt=""
		                     title="" /></a>
		               </div>
		               <nav id="nav-menu-container">
		                  <ul class="nav-menu">
		                     <li><a href="main.mc">Home</a></li>
							 <li><a href="#">${loginuser.name } 님 환영합니다</a>
                     		 <ul>
								 <li><a href="mybook.mc?id=${loginuser.id} ">My book</a></li>
								 <li><a href="userdetail.mc?id=${loginuser.id}">정보변경</a></li>
							 </ul>
		                     <li><a href="logout.mc">logout</a></li>
		                     <!-- 수정 날짜: 2020.09.08
		                              li class에 selectmenu2 추가 -->
		                     <li class="selectmenu2"><a href="seat.mc" >좌석</a></li>
		                     <li class="selectmenu2"><a href="book.mc">도서</a></li>
		                     <li class="selectmenu2"><a href="mybook.mc?id=${loginuser.id} ">My book</a></li>
		                  </ul>
		               </nav>
		            </div>
		               <!-- 수정 날짜: 2020.09.08 -->
		               <div id="weatherdiv"></div>
		         </div>
				 <div class="container">
		            <!-- 수정 날짜: 2020.09.08
		                  ul class에 selectmenu 추가 -->
		            <ul class="nav-menu selectmenu">
		               <li><a class="wow fadeInLeft" href="seat.mc"
		                  data-wow-duration="1s" data-wow-delay=".1s"
		                  style="font-size: 20px; margin-top: 40px; margin-right: 10px">
		                     <i class="fa fa-book"></i> 좌석
		               </a></li>
		               <li><a class="wow fadeInLeft" href="book.mc"
		                  data-wow-duration="1s" data-wow-delay=".3s"
		                  style="font-size: 20px; margin-top: 40px; margin-right: 10px">
		                     <i class="fa fa-book"></i> 도서
		               </a></li>
		               <li><a class="wow fadeInLeft" href="mybook.mc?id=${loginuser.id}"
		                  data-wow-duration="1s" data-wow-delay=".5s"
		                  style="font-size: 20px; margin-top: 40px; margin-right: 10px">
		                     <i class="fa fa-book"></i> MyBook
		               </a></li>
		            </ul>
		         </div>
			</c:when>
			
								<%-- 관리자로 로그인된 경우 --%>
			<c:when test="${loginuser != null && loginuser.position == '1'}">
				<div class="container">
					<div class="row align-items-center justify-content-between d-flex">
						<div id="logo">
							<a href="main.mc"><img src="view/main/img/logo11.png" alt="" title="" /></a>
						</div>
						<nav id="nav-menu-container">
							<ul class="nav-menu">
								<li><a href="main.mc">Home</a></li>
								<li><a href="#">${loginuser.name }(${loginuser.id} )</a>
									<ul>
										<li><a href="mybook.mc?id=${loginuser.id} ">My book</a></li>
										<li><a href="userdetailadminimpl.mc?id=${loginuser.id}">정보변경</a></li>
										<li><a href="manager.mc?id=${loginuser.id}">관리자 페이지</a></li>
										
									</ul>
								</li>
								<li><a href="">사용자 관리</a>
									<ul>	
										<li><a href="useraddadmin.mc">등록</a></li>
										<li><a href="userupdateadmin.mc">변경</a></li>
										<li><a href="userdeleteadmin.mc">삭제</a></li>
										<li><a href="userselectall.mc">조회</a></li>
									</ul>
								</li>
								<li><a href="">책 관리</a>
									<ul>	
										<li><a href="bookadd.mc">등록</a></li>
										<li><a href="bookupdate.mc">변경</a></li>
										<li><a href="bookdelete.mc">삭제</a></li>
										<li><a href="bookselectall.mc">보유 장서 조회</a></li>
									</ul>
								</li>
								<li>
									<a href="logout.mc">로그아웃</a>
								</li>
			                     <!-- 수정 날짜: 2020.09.08
			                              li class에 selectmenu2 추가 -->
			                     <li class="selectmenu2"><a href="seat.mc" >좌석</a></li>
			                     <li class="selectmenu2"><a href="book.mc">도서</a></li>
			                     <li class="selectmenu2"><a href="mybook.mc?id=${loginuser.id}">MyBook</a></li>
							</ul>
						</nav>
					</div>
					<div id="weatherdiv"></div>
				</div>
				
				 <div class="container">
		            <!-- 수정 날짜: 2020.09.08
		                  ul class에 selectmenu 추가 -->
		            <ul class="nav-menu selectmenu">
		               <li><a class="wow fadeInLeft" href="seat.mc"
		                  data-wow-duration="1s" data-wow-delay=".1s"
		                  style="font-size: 20px; margin-top: 40px; margin-right: 10px">
		                     <i class="fa fa-book"></i> 좌석
		               </a></li>
		               <li><a class="wow fadeInLeft" href="book.mc"
		                  data-wow-duration="1s" data-wow-delay=".3s"
		                  style="font-size: 20px; margin-top: 40px; margin-right: 10px">
		                     <i class="fa fa-book"></i> 도서
		               </a></li>
		               <li><a class="wow fadeInLeft" href="mybook.mc?id=${loginuser.id}"
		                  data-wow-duration="1s" data-wow-delay=".5s"
		                  style="font-size: 20px; margin-top: 40px; margin-right: 10px">
		                     <i class="fa fa-book"></i> MyBook
		               </a></li>
		            </ul>
		         </div>
			</c:when>
					
			<c:otherwise>
				<div class="container">
		            <div class="row align-items-center justify-content-between d-flex">
		               <div id="logo">
		                  <a href="main.mc"><img src="view/main/img/logo11.png" alt=""
		                     title="" /></a>
		               </div>
		               <nav id="nav-menu-container">
		                  <ul class="nav-menu">
		                     <li><a href="main.mc">Home</a></li>
		                     <li><a href="login.mc">로그인</a></li>
		                     <li><a href="registeradmin.mc">회원가입</a></li>
		                     <!-- 수정 날짜: 2020.09.08
		                              li class에 selectmenu2 추가 -->
		                     <li class="selectmenu2"><a href="seat.mc" >좌석</a></li>
		                     <li class="selectmenu2"><a href="book.mc">도서</a></li>
		                  </ul>
		               </nav>
		            </div>
		               <!-- 수정 날짜: 2020.09.08 -->
		               <div id="weatherdiv"></div>
		         </div>
		
		         <div class="container">
		            <!-- 수정 날짜: 2020.09.08
		                  ul class에 selectmenu 추가 -->
		            <ul class="nav-menu selectmenu ">
		               <li><a class="wow fadeInLeft" href="seat.mc"
		                  data-wow-duration="1s" data-wow-delay=".1s"
		                  style="font-size: 25px; margin-top: 40px; margin-right: 15px">
		                     <i class="fa fa-book"></i> 좌석
		               </a></li>
		               <li><a class="wow fadeInLeft" href="book.mc"
		                  data-wow-duration="1s" data-wow-delay=".3s"
		                  style="font-size: 25px; margin-top: 40px; margin-right: 15px">
		                     <i class="fa fa-book"></i> 도서
		               </a></li>
		            </ul>
		         </div>				
			</c:otherwise>
		</c:choose>
	</div>
	<!-- End Header Area -->
	
</head>

<body>

	<section>
		<c:choose>
			<c:when test="${centerpage == null }">
			   <jsp:include page="mainpage.jsp"></jsp:include>
			</c:when>
			<c:otherwise>
			   <jsp:include page="${centerpage}.jsp"></jsp:include>
			</c:otherwise>
		</c:choose>
	</section>
	


	<!-- Start Courses Area -->
	

	<!--Start Feature Area -->
	
	
	<!-- End Feature Area -->


	<!-- Start Testimonials Area -->
	
	
	<!-- End Testimonials Area -->
	
</body>


<!-- Start Footer Area -->
<footer class="footer-area section-gap">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-md-10 single-footer-widget">
				<h4>Contact Us</h4>
			</div>
		</div>
		<div class="footer-bottom row align-items-center">
			<p class="footer-text m-0 col-lg-8 col-md-12">
				<i class="fa fa-home"></i>&nbsp&nbsp 06166 서울 강남구 삼성로 534 (삼성동)<br>
				<i class="fa fa-phone"></i>&nbsp&nbsp&nbsp 010-8603-5354<br>
				<i class="fa fa-envelope"></i>&nbsp&nbsp xodud9630@google.com
			</p>
			<div class="col-lg-4 col-md-12 footer-social">
			
				<p class="footer-text">
				<!-- 
				<a href="https://www.facebook.com/taeyoung.yang.33"><i class="fa fa-facebook"></i></a>
				<a href="https://www.instagram.com/t2yyyy/"><i class="fa fa-instagram"></i></a>
				 -->
				
				<a href="mailto:dfso2222@gmail.com"><i class="fa fa-envelope"></i></a> 채희진&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				
				<a href="mailto:xodud9630@gmail.com"><i class="fa fa-envelope"></i></a> 양태영<br><br>
				
				<a href="mailto:ps4417@naver.com"><i class="fa fa-envelope"></i></a> 박혜성&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				
				<a href="mailto:cumulonimbus96@gmail.com"><i class="fa fa-envelope"></i></a> 이새롬
				</p>
			</div>
		</div>
	</div>
	
	
	
</footer>

	
<!-- ####################### Start Scroll to Top Area ####################### -->
<div id="back-top">
	<a title="Go to Top" href="#"></a>
</div>
<!-- ####################### End Scroll to Top Area ####################### -->

<script src="view/main/js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
 crossorigin="anonymous"></script>
<script src="view/main/js/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
<script src="view/main/js/easing.min.js"></script>
<script src="view/main/js/hoverIntent.js"></script>
<script src="view/main/js/superfish.min.js"></script>
<script src="view/main/js/jquery.ajaxchimp.min.js"></script>
<script src="view/main/js/jquery.magnific-popup.min.js"></script>
<script src="view/main/js/owl.carousel.min.js"></script>
<script src="view/main/js/owl-carousel-thumb.min.js"></script>
<script src="view/main/js/jquery.sticky.js"></script>
<script src="view/main/js/jquery.nice-select.min.js"></script>
<script src="view/main/js/parallax.min.js"></script>
<script src="view/main/js/waypoints.min.js"></script>
<script src="view/main/js/wow.min.js"></script>
<script src="view/main/js/jquery.counterup.min.js"></script>
<script src="view/main/js/mail-script.js"></script>
<script src="view/main/js/main.js"></script>

<!-- End Footer Area -->


</html>