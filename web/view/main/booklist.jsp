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
	<!--Start booklist (To show the booklist after click search button) ############################################################## -->
	<section class="post-content-area">
		<div class="container">
			<h3>소장자료</h3>
			<div class="row">
				<div class="section-top-border">
				<div class="progress-table-wrap">
					<div class="progress-table">
						<div class="table-head">
							<div class="serial" style="margin:20px;text-align:center">#</div>							
							<div class="country" style="margin:20px;text-align:center">도서</div>
							<div class="country" style="margin:20px;width:500px;text-align:center" >도서명</div>
							<div class="country" style="margin:20px;width:200px;text-align:center">저자</div>
							<div class="country" style="margin:20px;text-align:center">출판사</div>
							<div class="country" style="margin:20px;text-align:center">분류</div>
						</div>
						
					<!-- 검색 시 책 목록 구현  -->
						<c:forEach items="${booklist }" var="b">
						<div class="table-row">
							<div class="serial" style="margin:20px;text-align:center" >${b.id }</div>							
							<div class="country" style="margin:20px;display:block;text-align:center"> 
								<a href="bookdetail.mc?id=${b.id }"> 	
							 	<img src="view/main/img/bookimg/${b.img }" alt="no image" style="width:100px">
								</a>
							</div> 
							<div class="country" style="margin:20px;width:600px;text-align:center">${b.name }</div>
							<div class="country" style="margin:20px;text-align:center">${b.author }</div>
							<div class="country" style="margin:20px">${b.publisher }</div>
							<div class="country" style="margin:20px;text-align:center">${b.category }</div>
						</div>	
							</c:forEach>
						
				<%-- <div class="col-lg-8 posts-list">
					<table border="1" width="700">
						<tr>
							<th>번호</th>
							<th>사진</th>
							<th>도서명</th>
							<th>저자</th>
							<th>출판사</th>
						</tr>
					<c:forEach items="${booklist }" var="b">
						<tr>
							<td>${b.id }</td>
							<td>${b.img }</td>
							<td>${b.name }</td>
							<td>${b.author }</td>
							<td>${b.publisher }</td>
						</tr>
						</c:forEach>
					
					</table>
			
				</div> --%>
				
			</div>
			
		
		</div>
		</div>
		</div>
		</div>
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
		</section>
	<!--End booklist ############################################################### -->
	<!-- End post-content Area -->
</div>
	