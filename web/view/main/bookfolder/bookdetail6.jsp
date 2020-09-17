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
						도서상세정보
					</h1>
					
					<div class="link-nav">
						<span class="box">
							<a href="booklist.mc">다른 도서 검색하기 </a>
							
							
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="rocket-img">
			<img src="view/main/img/rocket.png" alt="">
		</div>
	</section>
	<!-- End Banner Area -->

	<!-- Start top-category-widget Area -->
	<section class="top-category-widget-area pt-90 pb-90 ">
		
	</section>
	<!-- End top-category-widget Area -->

	<!-- Start post-content Area -->
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="feature-img">
								<img class="img-fluid" src="view/main/img/bookimg/${bookdetail6.img }" alt="" style="width:200px">
							</div>
						</div>
						<div class="col-lg-3  col-md-3 meta-details">
							<ul class="tags">
								<li><h5><${bookdetail6.category }></h5></li>
								
							</ul>
							<div class="user-details row">
								<p class="user-name col-lg-12 col-md-12 col-6"><a href="#">${bookdetail6.author }</a> <span class="lnr lnr-user"></span></p>
								<p class="date col-lg-12 col-md-12 col-6"><a href="#">${bookdetail6.publisher }</a> <span class="lnr lnr-calendar-full"></span></p>
								<p class="view col-lg-12 col-md-12 col-6"><a href="#">보유권수: ${bookdetail6.qt }권</a> <span class="lnr lnr-eye"></span></p>
								
								<ul class="social-links col-lg-12 col-md-12 col-6">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-github"></i></a></li>
									<li><a href="#"><i class="fa fa-behance"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-9 col-md-9">
							<h3 class="mt-20 mb-20">${bookdetail6.name }</h3>
							<p class="excert">
								${bookdetail6.contents }
							</p>
							<a href="#" class="primary-btn">대출하기</a>
						</div>
						
					</div>
					<div class="navigation-area">
						
					</div>
					
					<div class="comment-form">
						<h4>Leave a Comment</h4>
						<form>
							<div class="form-group form-inline">
								<div class="form-group col-lg-6 col-md-12 name">
									<input type="text" class="form-control" id="name" placeholder="Enter Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Name'">
								</div>
								<div class="form-group col-lg-6 col-md-12 email">
									<input type="email" class="form-control" id="email" placeholder="Enter email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'">
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="subject" placeholder="Subject" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Subject'">
							</div>
							<div class="form-group">
								<textarea class="form-control mb-10" rows="5" name="message" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"
								 required=""></textarea>
							</div>
							<a href="#" class="primary-btn">Post Comment</a>
						</form>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- End post-content Area -->
    </div>