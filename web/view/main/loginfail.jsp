<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="center">
	<!-- 로그인 된 배너-->
	<section class="banner-area relative">
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">로그인 실패하였습니다.</h1>
					<p>로그인 합니다.</p>
					<div class="link-nav">
						<span class="box"> <a href="main.mc">홈 </a> <i
							class="lnr lnr-arrow-right"></i> <a href="elements.html">로그인</a>
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
<!-- 

	<!-- 로그인 영역 시작-->
	<div></div>
	<section class="sample-text-area">
		<div class="container border-top-generic">
			<h3 class="text-heading">로그인</h3>
			<form id="loginform" action="loginimpl.mc" method="post">
				<div class="mt-10">
					<input type="text" name="id" placeholder="아이디"
						onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'"
						required class="single-input">
				</div>
				<div class="mt-10">
					<input type="text" name="pwd" placeholder="비밀번호"
						onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'"
						required class="single-input">
				</div>
				<div class="button-group-area mt-10">
					<input class="genric-btn info circle arrow" type="submit"
						value="로그인"> <a href="registerimpl.mc"
						class="genric-btn primary circle arrow">회원가입<span
						class="lnr lnr-arrow-right"></span></a> <a href="findidpwd.mc"
						class="genric-btn danger circle arrow">아이디 / 비밀번호 찾기<span
						class="lnr lnr-arrow-right"></span></a>
				</div>
			</form>
		</div>
	</section>
	<!-- 로그인 영역 끝-->
-->
</div>