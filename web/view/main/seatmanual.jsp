<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="view/main/css/seat.css">

<script language="JavaScript">
</script>

<div id="center">

   <!-- Start Banner Area -->
   <section class="banner-area relative">
      <div class="container">
         <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
               <h1 class="text-white">열람실 이용 안내</h1>
               <div class="link-nav">
                  <span class="box" style="margin-top: 2em">
                     <a href="seat.mc">좌석 예약</a>
                     <i class="lnr lnr-arrow-right"></i>
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

   <!-- Start Manual -->
   <div class="whole-wrap">
      <div class="container">
         <div class="section-top-border">
            <h3 class="mb-30">Rules</h3>
            <div class="row">
               <div class="col-md-3">
                  <!-- <img class="img-fluid" src="view/main/img/about.jpg" alt=""> -->
                  <img src="view/main/img/about.jpg" alt="" class="img-fluid">
               </div>
               <div class="col-md-9 mt-sm-20">
                  <ol class="ordered-list">
                        <li><span>열람실은 본교의 학생만 이용이 가능합니다.</span></li>
                        <li><span>1F 열람실은 연중무휴 24시간 운영합니다.</span></li>
                        <li><span>2F,3F 열람실은 연중무휴 6:00 ~ 23:00 운영합니다. 시험기간 중엔 24시간 운영합니다.</span></li>
                        <li><span>열람석을 장시간 이석할 경우에는 자리배석시스템에서 퇴실처리하여 다른 이용자가 이용할 수 있도록 합니다.</span></li>
                        <li><span>타인의 계정은 사용이 불가합니다. 타인 계정 사용이 적발시 벌금이 부과됩니다.</span></li>
                        <li><span>열람실내에서는 항상 청결과 정숙을 유지합니다.</span></li>
                        <li><span>열람실내에서는 음식물 반입과 흡연은 금지됩니다. 뚜껑이 있는 음료만 반입 가능합니다.</span></li>
                        <li><span>다른 이용자에게 방해가 되는 행동은 주의하여 주십시오.</span></li>
                     </ol>
               </div>
            </div>
         </div>
         <div class="section-top-border">
            <h3 class="mb-30">Manual</h3>
            <div class="row">
               <div class="col-md-4">
                  <div class="single-defination">
                     <div class="mb-20">
                        <div class="genric-btn info-border radius" style="margin-right: 20px;">배정가능</div>
                        <div class="using">배정불가</div>
                     </div>
                     <p>배정가능 좌석을 클릭하여 좌석을 배정받은 후 사용합니다. 다른 사용자가 이용중인 좌석은 배정 불가로 표시됩니다.</p>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="single-defination">
                     <div class="mb-20">
                        <div class="genric-btn primary">퇴실하기</div>
                     </div>
                     <p>[퇴실하기] 클릭을 통해 퇴실처리가 됩니다. <br>퇴실미처리시 다른 사용자가 이용하지 못하게 되니 꼭 퇴실처리를 하여 주십시오.</p>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="single-defination">
                     <div class="mb-20">
                        <div class="genric-btn success" style="margin-right: 10px;">1F</div>
                        <div class="genric-btn success" style="margin-right: 10px;">2F</div>
                        <div class="genric-btn success">3F</div>
                     </div>
                     <p>각 층별 이용 현황을 조회할 수 있습니다.</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- End Manual -->
</div>