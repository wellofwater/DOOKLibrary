<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<div id="center">

	<!-- Start Banner Area -->
	<section class="banner-area relative">
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">
						통합검색
					</h1>
					
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
								
								
								
								<%-- <option value="bookname">책 이름</option>
								<option value="author">저자</option>
								<option value="publisher">출판사</option>
							</select>
							<input type="text" placeholder="검색어를 입력하세요" class="form-control" name="searchKeyword">
							<button type="submit" class="btn search-btn">Search</button> --%>
						</form>
				</div>
				
				<!-- end 상세 검색  -->	
				
			</div>
		</div>
		<div class="rocket-img">
			<img src="img/rocket.png" alt="">
		</div>
	</section>
	<!-- End Banner Area -->

	<!-- Start top-category-widget Area -->
	<section class="top-category-widget-area pt-90 pb-90 ">
		
	</section>
	<!-- End top-category-widget Area -->

	<!-- Start post-content Area -->
	<!--Start booklist ############################################################## -->
	<section class="post-content-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div>				
					<div class="col-lg-12 col-md-6 about-left">
					<img class="img-fluid" src="view/main/img/bookimg/magnifier.jpg" alt="no image" style="width:100px">
					<h1>
						검색결과가 없습니다.
					</h1>
					</div>
					<br><br><br>
					</div>
				<div class="offset-lg-1 col-lg-12 offset-md-0 col-md-12 about-right">
					
					<div class="wow fadeIn" data-wow-duration="1s">
					</div>
			</div>
		</div>
		</section>
	<!--End booklist ############################################################### -->
	<!-- End post-content Area -->
</div>
	