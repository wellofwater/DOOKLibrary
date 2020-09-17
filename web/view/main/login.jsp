<!DOCTYPE html>
<html lang="zxx" class="no-js">

<!-- 한글 깨질 때 붙여넣기!! -->
<!-- 채희진 -->
<!-- 최종수정일:2020.09.08 -->
<!-- 아이디 / 비밀번호 찾기 버튼 삭제 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<div id="center">
	<!-- Start Banner Area -->
	<section class="banner-area relative">
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">로그인</h1>
				</div>
			</div>
		</div>

	</section>
	<!-- End Banner Area -->


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
					<input type="password" name="pwd" placeholder="비밀번호"
						onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'"
						required class="single-input">
				</div>
				<input type="hidden" id="position" name="position" value="0">

				<div class="button-group-area mt-10">
					<input class="genric-btn info circle arrow" type="submit" value="로그인"> 
					<a href="registeradmin.mc" class="genric-btn primary circle arrow">회원가입<span class="lnr lnr-arrow-right"></span></a> 
				</div>
			</form>
		</div>
	</section>
	<!-- 로그인 영역 끝-->
</div>