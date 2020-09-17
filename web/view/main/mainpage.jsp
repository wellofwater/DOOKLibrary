<!DOCTYPE html>
<html lang="zxx" class="no-js">

<!-- 한글 깨질 때 붙여넣기!! -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 


<!-- Search Books 스타일 -->
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

<!-- Search Books 스타일 종료-->

<div id="center">
	<!-- Start Banner Area -->
	<section class="home-banner-area relative">
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="banner-content col-lg-8 col-md-12">
					<div class="search-book col-lg-12">
						<h4 class="text-white">Book Search</h4>
						<div class="input-wrap">
		                  <form action="booklist.mc" method="post" class="form-box d-flex justify-content-between"> <!-- 검색하면 booklist.mc로 -->
		                     <select  name="searchCondition">
		                        <option value="NAME">책이름
		                        <option value="AUTHOR">저자
		                        <option value="PUBLISHER">출판사
		                     </select>
		                     <input type="text" placeholder="검색어를 입력하세요" class="form-control" name="searchKeyword"/>
		                     <input type="submit" value="Search" class="btn search-btn"/>   
	                        </form>
            			</div>
					</div>
				</div>
			</div>
		</div>


	</section>
	<!-- End Banner Area -->
	
	<!-- Start Faculty Area -->
	<section class="faculty-area section-gap">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-5 col-md-6 about-left">
					<img class="img-fluid" src="view/main/img/guideside.png" alt="">
				</div>
				<div class="offset-lg-1 col-lg-6 offset-md-0 col-md-12 about-right">
					<h2>
						이용시간
					</h2><br>
					<div class="wow fadeIn" data-wow-duration="1s">
						<p>
							평일(토요일포함) : 09:00 ~ 22:00<br>
							일요일 및 공휴일 : 09:00 ~ 19:00
						</p><br><br><br>
					</div>
					
					<h2>
						도서관 좌석 이용 방법
					</h2><br>
					<div class="wow fadeIn" data-wow-duration="1s">
						<p>
							입실 : 도서실 앞 무인 키오스크에서 자리 선택 후 이용<br>
							퇴실 : 도서실 체크아웃 시 키오스크에서 퇴실 처리 후 퇴실
						</p><br><br><br>
					</div>
					
					<h2>
						휴관일
					</h2><br>
					<div class="wow fadeIn" data-wow-duration="1s">
						<p>
							정기 휴관일 : 매월 마지막 주 일요일<br>
							임시 휴관일 : 입학식, 학위수여식, 시설점검 등 휴관 시 공지
						</p>
					</div>
				</div>
			</div>
		</div>
	
	</section>
	<!-- End Faculty Area -->
	
	<!-- Start About Area -->
	<section class="about-area section-gap">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-5 col-md-6 about-left">
					<img class="img-fluid" src="view/main/img/book.png" alt="">
				</div>
				<div class="offset-lg-1 col-lg-6 offset-md-0 col-md-12 about-right">
					<h2>
						책소개
					</h2><br>
					<div class="wow fadeIn" data-wow-duration="1s">
						<p>
							민사고 학생들이 ‘성경’처럼 반복해서 읽은 바로 그 책!<br>
							“내 공부의 심장이 미친 듯 뛰기 시작했습니다!”<br><br>
							
							그 흔한 학원 하나 없는 깡촌 시골마을에서<br>
							내가 서울대 법대, 연세대 경영대<br>
							동신대 한의대에 동시 합격한 비결<br><br><br>
						</p>
					</div>
					
					<h2>
						목차
					</h2><br>
					<div class="wow fadeIn" data-wow-duration="1s">
						<p>
							PART 1<br>
							한 번은 힘주어 해주고 싶은 이야기<br><br>
							
							PART 2<br>
							마음을 다지는 순간, 공부는 재미있어진다<br><br>
							
							PART 3<br>
							마음을 키우는 순간, 공부는 재미있어진다<br><br>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End About Area -->
<div>


</html>