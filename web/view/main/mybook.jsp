<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<%-- 본인의 대출내역, 연체내역, 좌석 대여 정보 조회 --%>
<%--최종수정: 2020.09.08 --%>
<div id="center">
	<!-- Start Banner Area -->
	<section class="banner-area relative">
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="search-book col-lg-12">
					<h1 class="text-white">도서관 이용 내역을 조회합니다.</h1>
					<p>대출 / 연체 / 좌석 </p>
					<div class="link-nav">
						<span class="box"> <a href="main.mc">홈 </a> <i
							class="lnr lnr-arrow-right"></i> <a href="login.mc">로그인</a>
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


	<!-- 대출 조회-->
	<section class="sample-text-area">
		<div class="container border-top-generic">
			<h3 class="text-heading">대출도서조회</h3>
			
			
			<div class="progress-table">
				<div class="table-head">
				<%-- 2020.09.08 추가--%>
					<div class="serial">도서명</div>
					<div class="country">대출일자</div>
					<div class="visit">반납예정일</div>
					<div class="visit">반납상태</div>
					<div class="percentage">반납일</div>
				</div>
				
				<c:forEach var="resb" items="${resbook }" varStatus="loop">
					<div class="table-row">
						<%-- 2020.09.08 추가--%>
						<div class="serial"> ${bookList[loop.index].name} </div>
						<div class="country"> 
							 <fmt:formatDate value="${resb.brdate}" pattern="yyyy-MM-dd (E)"/>  
						</div>
						<div class="visit">	
							 <fmt:formatDate value="${resb.duedate}" pattern="yyyy-MM-dd (E)"/>   
						</div>
						<c:choose>
							<c:when test="${resb.state == 't'}">
								<%-- 2020.09.08 변경--%>
								<div class="visit"><a href="bookreturnimpl.mc?bid=${resb.bookid}&rid=${resb.id}&uid=${loginuser.id}"> 대출 중</a></div>  
							</c:when>
							<c:otherwise>
								<div class="visit"> 반납 완료</div> 
							</c:otherwise> 
						</c:choose>
						<div class="percentage">	
							 <fmt:formatDate value="${resb.rtdate}" pattern="yyyy-MM-dd (E)"/>   
						</div>
					</div>				
				</c:forEach>
			</div>
		</div>
	</section>
	
	<!-- 연체내역 조회-->
	<section class="sample-text-area">
		<div class="container border-top-generic">
			<h3 class="text-heading">연체도서조회</h3>
			<fmt:formatDate value="${testDate }" pattern="yyyy-MM-dd (E)"/>기준 
			<div class="progress-table">
				<div class="table-head">
					<div class="serial">도서명</div>
					<div class="country">대출일자</div>
					<div class="visit">반납예정일</div>
					<div class="visit">반납상태</div>
					<div class="percentage">반납일</div>
				</div>
				<%--루프를 연체도서 조회, 연체 기준이 되는 날짜는 ResBookController 의 getresbookimpl.mc안에 정의됨.
				 2020.09.07--%>
				<c:forEach var="lb" items="${lateresbook }" varStatus="loop">
					<div class="table-row">
						<div class="serial"> ${latebookList[loop.index].name} </div>
						<div class="country"> 
							 <fmt:formatDate value="${lb.brdate}" pattern="yyyy-MM-dd (E)"/> 
						</div>
						<div class="visit">	 
							<fmt:formatDate value="${lb.duedate}" pattern="yyyy-MM-dd (E)"/>
						</div>
						<c:choose>
						<c:when test="${lb.state == 't'}">
								<%-- 2020.09.08 변경--%>
								<div class="visit"><a href="bookreturnimpl.mc?bid=${lb.bookid}&rid=${lb.id}&uid=${loginuser.id}"> 대출 중</a></div>  
							</c:when>
							<c:otherwise>
								<div class="visit"> 반납 완료</div> 
							</c:otherwise> 
						</c:choose>
						<div class="percentage">	
							 <fmt:formatDate value="${lb.rtdate}" pattern="yyyy-MM-dd (E)"/>   
						</div>
					</div>				
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- 좌석 조회-->
	<section class="sample-text-area">
		<div class="container border-top-generic">
			<h3 class="text-heading">좌석정보조회</h3>
			
			<div class="progress-table">
				<div class="table-head">
					<div class="serial">좌석아이디</div>
					<div class="country">입실시간</div>
					<div class="visit">퇴실시간</div>
				</div>
				<%--루프를 통해 DB의 USESEAT 데이터 중 일부를 가져와 보여줌. 2020.09.07--%>
				<c:forEach var="s" items="${seatlist }">
					<div class="table-row">
						<div class="serial">${s.sid } </div>  
						<div class="country"> <fmt:formatDate value="${s.intime }" pattern="yyyy-MM-dd (E) HH:MM"/>   </div>
						<div class="visit"> <fmt:formatDate value="${s.outtime}" pattern="yyyy-MM-dd (E) HH:MM"/> </div>
					</div>				
				</c:forEach>
			</div>
		</div>
	</section>	
	
</div>