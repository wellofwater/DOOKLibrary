<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<!-- 채희진 -->
<!-- 최종수정:2020.09.09 -->
<!-- 반납후 페이지 이동 -->
<script>
var _num = 3;
var _sec = _num*1000;
var _id = '${loginuser.id}';
function toMybook(userid){
	var id = userid;
	location.href = "mybook.mc?id=" + id;
	console.log("toMybook");
};
$(document).ready(function(){
	setTimeout(function(){
		toMybook(_id);
	},_sec);
	console.log("onload");
	setInterval(function(){
		_num -= 1;
		$("#countMybook").html(_num+" 초 후, 내 페이지로 이동합니다.");
		
		console.log("countMybook");
	},1000);
	
});
</script>




<div id="center">
	<!-- 로그인 된 배너-->
	<section class="banner-area relative">
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">반납되었습니다. </h1>
					<!-- 수정: 2020.09.08 -->
					<p>책  "<${book.name }>"  반납되었습니다.</p>
					<p id="countMybook"></p>
					<div class="link-nav">
						<span class="box"> <a href="main.mc">홈으로 </a> 
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="rocket-img">
			<img src="img/rocket.png" alt="">
		</div>
	</section>
	<!-- End Banner Area -->
</div>