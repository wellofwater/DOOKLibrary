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
					<h1 class="text-white">책 목록페이지</h1>
					<p>전체 책 목록을 불러옴</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	
	<!-- 책 정보 얻어오기 -->
	
	<section class="sample-text-area">
		<div class="container border-top-generic">
		<h3 class="text-heading">책 정보 조회</h3>
		<div class="progress-table">
			<div class="table-head">
				<div class="serial">도서명</div>
				<div class="country">작가</div>
				<div class="visit">출판사</div>
				<div class="visit">카테고리</div>
				<div class="percentage">소개말</div>
			</div>
			<%--채희진, 최종수정: 2020.09.08 --%>
			<%--bookdetail >bookdetail_search --%>
			<c:forEach var="b" items="${booklist }">
				<div class="table-row">
					<div class="serial"><a href="bookdetail_search.mc?id=${b.id} ">${b.name}</a></div>
					<div class="country">${b.author }</div>
					<div class="visit">${b.publisher }</div>
					<div class="visit">${b.category }</div>
					<div class="percentage">${b.contents }</div> 
				</div>				
			</c:forEach>
		</div>
		</div>
	</section>
</div>