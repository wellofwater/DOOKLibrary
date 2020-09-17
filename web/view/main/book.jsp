<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Search Books 스타일 -->
	<style>
	
	.search-book {
  margin-top: 200px;
  margin-bottom: 112px;
  text-align: center;
  color: #fff;
  position: relative; }

  .search-book h2 {
    font-size: 35px;
    font-weight: 700;
    margin-bottom: 20px; }

  .search-book p {
    color: #fff;
    max-width: 615px;
    margin: 0 auto;
    margin-bottom: 40px; }

	</style>
	
<div id="center">
					
	<section class="home-banner-area relative">
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="banner-content col-lg-8 col-md-12">
					<div class="search-book col-lg-12">
						<h2 class="text-white">똑똑하게 『DDOK Library』</h2>
						
						<!-- start 상세 검색  -->	
						<div class="input-wrap">
								<form action="booklist.mc" method="post" class="form-box d-flex justify-content-between"> <!-- 검색하면 DB에서 자료 가져와서 뿌려줘 -->
									<select  name="searchCondition">
									<c:forEach items= "${conditionMap }" var="option">
										<option value="${option.value}">${option.key}
									</c:forEach> 
									</select>
									<input type="text" placeholder="검색어를 입력하세요" class="form-control" name="searchKeyword">
									<button type="submit" class="btn search-btn">Search</button>	
										
								</form>
						</div>
						
						<!-- end 상세 검색  -->	
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- End Banner Area -->

	<!-- Start top-category-widget Area -->
	<section class="top-category-widget-area pt-90 pb-90 ">
		<div class="container">
		
			<div class="row">
				<div class="col-lg-4">
					<div class="single-cat-widget">
						<div class="content relative">
							<div class="overlay overlay-bg"></div>
							<a href="bookdetail1.mc">
								<div class="thumb">
									<img class="content-image img-fluid d-block mx-auto" src="view/main/img/bookimg/daughter.jpg" alt="no image" style="width:200px">
								</div>
								<div class="content-details">
									<h4 class="content-title mx-auto text-uppercase">신작 도서</h4>
									<span></span>
									<p>New Book</p>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-cat-widget">
						<div class="content relative">
							<div class="overlay overlay-bg"></div>
							<a href="bookdetail3.mc">
								<div class="thumb">
									<img class="content-image img-fluid d-block mx-auto" src="view/main/img/bookimg/meet.jpg" alt="no image" style="width:200px">
								</div>
								<div class="content-details">
									<h4 class="content-title mx-auto text-uppercase">이달의 Best</h4>
									<span></span>
									<p>Best</p>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-cat-widget">
						<div class="content relative">
							<div class="overlay overlay-bg"></div>
							<a href="bookdetail4.mc">
								<div class="thumb">
									<img class="content-image img-fluid d-block mx-auto" src="view/main/img/bookimg/gameover.jpg" alt="no image" style="width:200px">
								</div>
								<div class="content-details">
									<h4 class="content-title mx-auto text-uppercase">오늘의 도서</h4>
									<span></span>
									<p>Today's Book</p>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End top-category-widget Area -->


<!--START 책 목록이 뿌려지는 곳 -->
	<!-- Start post-content Area -->
	<section class="post-content-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-3  col-md-3 meta-details">
							<ul class="tags">
								<li><a href="#">경제,</a></li>
								<li><a href="#">경영</a></li>
								
							</ul>
							<div class="user-details row">
								<p class="user-name col-lg-12 col-md-12 col-6"><a href="#">김승호</a> <span class="lnr lnr-user"></span></p>
								<p class="date col-lg-12 col-md-12 col-6"><a href="#">2020년 06월 15일 출간</a> <span class="lnr lnr-calendar-full"></span></p>
								<p class="view col-lg-12 col-md-12 col-6"><a href="#">1.2M Views</a> <span class="lnr lnr-eye"></span></p>
								<p class="comments col-lg-12 col-md-12 col-6"><a href="#">06 Comments</a> <span class="lnr lnr-bubble"></span></p>
							</div>
						</div>
						<div class="col-lg-9 col-md-9 ">
							<div class="feature-img">
								<img class="img-fluid" src="view/main/img/bookimg/money.jpg" alt="no image" style="width:150px">
							</div>
							<a class="posts-title" href="bookdetail5.mc"><h3>돈의 속성</h3></a>
							<p class="excert">
								최상위 부자 김승호 회장이 직접 밝히는 돈에 대한 통찰과 철학<br>
								
								매출 2조원 대 스노우폭스 김승호 회장이 말하는 〈돈의 속성〉 완결판<br>
								맨손에서 만들어낸 종잣돈으로 돈 버는 방법을 알려준다. 
							</p>
							<a href="bookdetail5.mc" class="primary-btn">View More</a>
						</div>
					</div>
					<div class="single-post row">
						<div class="col-lg-3  col-md-3 meta-details">
							<ul class="tags">
								<li><a href="#">경제,</a></li>
								<li><a href="#">경영</a></li>
								
							</ul>
							<div class="user-details row">
								<p class="user-name col-lg-12 col-md-12 col-6"><a href="#">최재봉</a> <span class="lnr lnr-user"></span></p>
								<p class="date col-lg-12 col-md-12 col-6"><a href="#">2020년 08월 20일 출간</a> <span class="lnr lnr-calendar-full"></span></p>
								<p class="view col-lg-12 col-md-12 col-6"><a href="#">1.5M Views</a> <span class="lnr lnr-eye"></span></p>
								<p class="comments col-lg-12 col-md-12 col-6"><a href="#">07 Comments</a> <span class="lnr lnr-bubble"></span></p>
							</div>
						</div>
						<div class="col-lg-9 col-md-9 ">
							<div class="feature-img">
								<img class="img-fluid" src="view/main/img/bookimg/change9.jpg" alt="no image" style="width:150px">
							</div>
							<a class="posts-title" href="bookdetail6.mc"><h3>Change9(체인지 나인)</h3></a>
							<p class="excert">
								베스트셀러 《포노 사피엔스》의 저자이자 문명 공학자 최재붕 교수의 두 번째 책.
2020년 세계를 강타한 ‘코로나19 바이러스’의 창궐은 디지털 문명과 팽팽한 힘겨루기를 하고 있던 기존 문명을 뿌리째 뒤흔들었다.인류는 감염을 피하기 위해 비접촉 생활 방식으로 강제 이동했고, 이로 인해 디지털 문명으로의 전환은 ‘선택’이 아닌 ‘생존’의 문제가 되었다.
<br>그는 신작 《CHANGE 9》을 통해 코로나19 시대의 변화상을 자세히 들여다보고, 가속화한 포노 사피엔스 문명 속에서 우리가 어떤 사람으로 살아가야 할지에 대한 선명한 방향을 제시한다. 
							</p>
							<a href="bookdetail6.mc" class="primary-btn">View More</a>
						</div>
					</div>
					<div class="single-post row">
						<div class="col-lg-3  col-md-3 meta-details">
							<ul class="tags">
								<li><a href="#">역사,</a></li>
								<li><a href="#">문화</a></li>
								
							</ul>
							<div class="user-details row">
								<p class="user-name col-lg-12 col-md-12 col-6"><a href="#">마크 호닉스바움</a> <span class="lnr lnr-user"></span></p>
								<p class="date col-lg-12 col-md-12 col-6"><a href="#">2020년 08월 19일 출간</a> <span class="lnr lnr-calendar-full"></span></p>
								<p class="view col-lg-12 col-md-12 col-6"><a href="#">1.0M Views</a> <span class="lnr lnr-eye"></span></p>
								<p class="comments col-lg-12 col-md-12 col-6"><a href="#">03 Comments</a> <span class="lnr lnr-bubble"></span></p>
							</div>
						</div>
						<div class="col-lg-9 col-md-9">
							<div class="feature-img">
								<img class="img-fluid" src="view/main/img/bookimg/pandemic.jpg" alt="no image" style="width:150px">
							</div>
							<a class="posts-title" href="bookdetail2.mc"><h3>대유행병의 시대</h3></a>
							<p class="excert">
								파이낸셜 타임스 선정 2019년 ‘올해의 책’<br>
						메일 온 선데이 선정 2019년 ‘뜨거운 여름에 읽을 만한 책’,<br>
						<br>
의학 역사가 이야기하는 사라지지 않는 적,<br>
치명적인 전염병과 그에 맞선 인류의 사투!<br>
스페인독감부터 사스, 에볼라, 코로나까지<br>
지난 100년 전염병 역사를 생생하게 파헤치다!<br>
							</p>
							
							<a href="bookdetail2.mc" class="primary-btn">View More</a>
						</div>
							
				
					</div>
					
		
	
	
		<!-- START 페이지 -->				
					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
							<li class="page-item">
								<a href="#" class="page-link" aria-label="Previous">
									<span aria-hidden="true">
										<span class="lnr lnr-chevron-left"></span>
									</span>
								</a>
							</li>
							<li class="page-item"><a href="#" class="page-link">01</a></li>
							<li class="page-item active"><a href="#" class="page-link">02</a></li>
							<li class="page-item"><a href="#" class="page-link">03</a></li>
							<li class="page-item"><a href="#" class="page-link">04</a></li>
							<li class="page-item"><a href="#" class="page-link">05</a></li>
							<li class="page-item">
								<a href="#" class="page-link" aria-label="Next">
									<span aria-hidden="true">
										<span class="lnr lnr-chevron-right"></span>
									</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
			<!-- END 페이지 -->	
					<div class="col-lg-4 sidebar-widgets">
					<div class="widget-wrap">
						<div class="single-sidebar-widget search-widget">
							
						</div>
						<div class="single-sidebar-widget user-info-widget">
						<h4 class="category-title">오늘의 추천 도서</h4><br>
							<img src="view/main/img/bookimg/cosmos.jpg" alt="no image" style="width:100px">
							<a href="bookdetail8.mc"><h4>코스모스</h4></a>
							<p>
								칼 세이건
							</p>
							
							<p>
								과학 교양서의 고전『코스모스』. 우주의 탄생과 은하계의 진화, 태양의 삶과 죽음, 우주를 떠돌던 먼지가 의식 있는 생명이 되는 과정, 외계 생명의 존재 문제 등에 관한 내용을 수 백장의 사진과 일러스트를 곁들여 흥미롭게 설명한다. 
							</p>
						</div>
						<div class="single-sidebar-widget popular-post-widget">
							<h4 class="popular-title">인기 도서</h4>
							<div class="popular-post-list">
								<div class="single-post-list d-flex flex-row align-items-center">
									<div class="thumb">
										<img class="img-fluid" src="view/main/img/bookimg/pandemic.jpg" alt="no image" style="width:50px">
									</div>
									<div class="details">
										<a href="bookdetail2.mc"><h6> 1. 대유행병의 시대</h6></a>
										
									</div>
								</div>
								<div class="single-post-list d-flex flex-row align-items-center">
									<div class="thumb">
										<img class="img-fluid" src="view/main/img/bookimg/depression.jpg" alt="no image"style="width:50px">
									</div>
									<div class="details">
										<a href="bookdetail7.mc"><h6>2. 나도 나를 어쩌지 못할 떄</h6></a>
										
									</div>
								</div>
								<div class="single-post-list d-flex flex-row align-items-center">
									<div class="thumb">
										<img class="img-fluid" src="view/main/img/bookimg/gameover.jpg" alt="no image" style="width:50px">
									</div>
									<div class="details">
										<a href="bookdetail4.mc"><h6>3. 게임오버(GAME OVER)</h6></a>
										<p>02 Hours ago</p>
									</div>
								</div>
								<div class="single-post-list d-flex flex-row align-items-center">
									<div class="thumb">
										<img class="img-fluid" src="view/main/img/bookimg/money.jpg" alt="no image" style="width:50px">
									</div>
									<div class="details">
										<a href="bookdetail5.mc"><h6>4. 돈의 속성</h6></a>
										<p>02 Hours ago</p>
									</div>
								</div>
							</div>
						</div>
						<div class="single-sidebar-widget ads-widget">
							<a href="#"><img class="img-fluid" src="img/blog/ads-banner.jpg" alt=""></a>
						</div>
						<div class="single-sidebar-widget post-category-widget">
							<h4 class="category-title">도서 분류</h4>
							<ul class="cat-list">
								<li>
									<a href="#" class="d-flex justify-content-between">
										<p>인문</p>
										
									</a>
								</li>
								<li>
									<a href="#" class="d-flex justify-content-between">
										<p>경제/경영</p>
										
									</a>
								</li>
								<li>
									<a href="#" class="d-flex justify-content-between">
										<p>역사/문화</p>
										
									</a>
								</li>
								<li>
									<a href="#" class="d-flex justify-content-between">
										<p>예술</p>
										
									</a>
								</li>
								<li>
									<a href="#" class="d-flex justify-content-between">
										<p>시/에세이</p>
										
									</a>
								</li>
								<li>
									<a href="#" class="d-flex justify-content-between">
										<p>소설</p>
										
									</a>
								</li>
								<li>
									<a href="#" class="d-flex justify-content-between">
										<p>기타</p>
										
									</a>
								</li>
							</ul>
						</div>
						
						<div class="single-sidebar-widget tag-cloud-widget">
							<h4 class="tagcloud-title">Tag Clouds</h4>
							<ul>
								<li><a href="#">인문</a></li>
								<li><a href="#">경제/경영</a></li>
								<li><a href="#">역사/문화</a></li>
								<li><a href="#">예술</a></li>
								<li><a href="#">시/에세이</a></li>
								<li><a href="#">소설</a></li>
								<li><a href="#">철학</a></li>
								<li><a href="#">과학</a></li>
								<li><a href="#">SF</a></li>
								<li><a href="#">잡지</a></li>
								<li><a href="#">일상생활</a></li>
								<li><a href="#">기타</a></li>
							</ul>
						</div>
					</div>
				</div>	
						
					</div>
				</div>
			</div>
		
	</section>
	
	<!--END 책 목록 -->
	<!-- End post-content Area -->
</div>