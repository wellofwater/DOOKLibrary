<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
	
	.search-book {
  margin-top: 200px;
  margin-bottom: 112px;
  text-align: center;
  color: #fff;
  position: relative; }

  .search-book h4 {
    font-size: 35px;
    font-weight: 700;
    margin-bottom: 20px; }

  .search-book p {
    color: #fff;
    max-width: 615px;
    margin: 0 auto;
    margin-bottom: 40px; }

</style>

<div id='center'>
	<!-- Start Banner Area -->
	<section class="banner-area relative">
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="search-book col-lg-12">
					<h1 class="text-white">유저목록 페이지</h1>
					<p>전체 유저 목록을 불러옴</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	
	<!-- 회원 정보 얻어오기 -->
	
	<section class="sample-text-area">
		<div class="container border-top-generic">
			<h3 class="text-heading">회원 정보 조회</h3>
			<div class="mt-10">
				<a href="userselectalladminimpl.mc" class="genric-btn info-border circle arrow">회원정보 가져오기<span class="lnr lnr-arrow-right"></span></a>
			</div>
			<div class="progress-table">
				<div class="table-head">
					<div class="serial">ID</div>
					<div class="country">비밀번호</div>
					<div class="visit">이름</div>
					<div class="percentage">직위</div>
				</div>
				<c:forEach var="u" items="${userlist }">
					<div class="table-row">
						<div class="serial"><a href="userdetail.mc?id=${u.id }">${u.id } </a></div>
						<div class="country"> ${u.pwd } </div>
						<div class="visit">	  ${u.name }</div>
						<div class="percentage"> ${u.position }</div>  
					</div>				
				</c:forEach>
			</div>
		</div>
	</section>
</div>