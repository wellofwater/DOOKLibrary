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
					<h1 class="text-white">책 상세조회</h1>
					<p>책 내용을 상세조회</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	
	<!-- 책 정보 얻어오기 -->	
	<section class="sample-text-area">
		<div class="container border-top-generic">
		<h3 class="text-heading">책 정보 조회</h3>
			<div class="col-lg-8 col-md-8">
				<h3 class="mb-30">책 조회 및 변경</h3>
				<img src="view/main/img/bookimg/${bookdetail.img}" alt="" class="img-fluid">
				<!-- 채희진, 최종수정: 2020.09.08 -->
				<form enctype="multipart/form-data" action="bookupdateimpl.mc" method ="post">
					<input type="hidden" name="id" value="${bookdetail.id}">
					<input type="hidden" name="img" value="${bookdetail.img}">
					<div class="mt-10">
						커버 이미지: <input type="file" name="mf">
					</div>
					<div class="mt-10">
						<input type="text" name="name" placeholder="책이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '책이름'"
						 required class="single-input" value ="${bookdetail.name}">
					</div>
					<div class="mt-10">
						<input type="text" name="author" placeholder="저자" onfocus="this.placeholder = ''" onblur="this.placeholder = '저자'"
						 required class="single-input" value ="${bookdetail.author}">
					</div>
					<div class="mt-10">
						<input type="text" name="publisher" placeholder="출판사" onfocus="this.placeholder = ''" onblur="this.placeholder = '출판사'"
						 required class="single-input" value ="${bookdetail.publisher}">
					</div>
					<div class="mt-10">
						<input type="number" name="qt" placeholder="권 수" onfocus="this.placeholder = ''" onblur="this.placeholder = '권 수'"
						 required class="single-input" value ="${bookdetail.qt}">
					</div>
					<div class="input-group-icon mt-10">
						<div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
						<div class="form-select" id="default-select" >
							<select name = "category" >
								<option value="카테고리">카테고리</option>
								<option value="소설">소설</option>
								<option value="경영 / 경제">경영 / 경제</option>
								<option value="인문 / 사회 /">인문 / 사회</option>
								<option value="자기계발">자기계발</option>
							</select>
						</div>
					</div>
					<div class="mt-10">
						<textarea class="single-textarea" name="contents" placeholder="책소개" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Message'"
						 required>${bookdetail.contents}</textarea>
					</div>
					<div class="button-group-area mt-10">
						<input class="genric-btn info circle arrow" type="submit" value="업데이트"> 
						<a href="bookdeleteimpl.mc?id=${bookdetail.id} " class="genric-btn danger circle">삭제</a>
					</div>	
				</form>
			</div>
		</div>
	</section>
</div>