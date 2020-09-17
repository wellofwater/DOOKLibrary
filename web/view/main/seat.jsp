<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="view/main/css/seat.css">
<script language="JavaScript">
   //$(document).ready(function(){
   //});

   function display(data) {
      location.href = "seat.mc?floor=" + data;
   }

   function seatconfirm(userid, seatid, o) {
      var result = confirm(seatid + "를 선택합니다.");
      if (result) {
         $.ajax({
            url : 'seatupdateimpl.mc',
            async : false,
            data : {
               user : userid,
               id : seatid,
               occupy : o
            },
            success : function(data) {
               if (data != 0) {
                  alert("배정되었습니다.");
                  display(data);
               }
            },
            error : function() {
               alert('Error.....');
            }
         });
      } else {
         document.close();
         return false;
      }
   }

   function checkout(id) {
      var result = confirm("퇴실하겠습니까?");
      if (result) {
         $.ajax({
            url : 'checkoutimpl.mc',
            async : false,
            data : {
               userid : id
            },
            success : function(data) {
               alert("퇴실되었습니다.");
               if (data != 0) {
                  display(data);
               }
            },
            error : function() {
               alert('Error.....');
            }
         });
      } else {
         document.close();
         return false;
      }
   }
</script>

<div id="center">

   <!-- Start Banner Area -->
   <section class="banner-area relative">
      <div class="container">
         <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
               <h1 class="text-white" style="margin-top: 1.5em">좌석 예약</h1>
            </div>
         </div>
      </div>
      <div class="rocket-img">
         <img src="view/main/img/rocket.png" alt="">
      </div>
   </section>
   <!-- End Banner Area -->

   <!-- Start Button -->
   <section class="button-area">
      <div class="container border-top-generic">
         <h3 class="text-heading">이용 현황</h3>

         <div class="button-group-area">
            <a href="seatmanual.mc" class="genric-btn success radius">시설 이용안내</a>
            <input type="button" class="genric-btn primary radius" value="퇴실하기" onclick="checkout('${loginuser.id }')">

            <div class="assignment">
               <div class="canuse">배정가능</div>
               <div class="using">배정불가</div>
            </div>
         </div>

         <!-- Start Seat Area -->
         <div class="table-responsive" style="background: #e9e9ee; margin-top: 1em; padding-top: 1em; padding-left: 0.8em; padding-right: 0.8em;">
         <table class="seattable">
            <tr>
               <c:forEach var="seat" items="${seatlist }" varStatus="status">

                  <td align='center'>
                  
                     <!-- 위치: img 폴더 아래 > seat(생성) 폴더 아래 -->
                     <c:if test="${status.count % 16 < 9 && status.count % 16 != 0 }">
                           <img alt="emptySeat" src="view/main/img/seat/empty_seat.png" style="width: 3em; display: block;" >
                     </c:if>
                  
                     <c:choose>
                        <c:when test="${seat.occupy == 1 }">
                           <input type="button" class="using" value="${seat.id }"
                              onclick="alert('사용중인 좌석입니다.')">
                        </c:when>
                        <c:otherwise>
                           <input type="button" class="genric-btn info-border radius"
                              value="${seat.id }"
                              onclick="seatconfirm('${loginuser.id }', '${seat.id }','${seat.occupy }')">
                        </c:otherwise>
                     </c:choose>
                     
                     
                     <c:if test="${status.count % 16 > 8 || status.count % 16 == 0 }">
                           <img alt="emptySeat" src="view/main/img/seat/empty_seat2.png" style="width: 3em; display: block;" >
                     </c:if>
                     
                  </td>
                  
                  <c:choose>
                     <c:when test="${status.count % 16 == 0 }">
                        </tr><tr height="40"><td colspan="11"></tr><tr>
                     </c:when>
                     <c:when test="${status.count % 8 == 0 }">
                        </tr><tr>
                     </c:when>
                     <c:when test="${status.count != 1 && status.count % 4 == 0}">
                        <td><div></div></td>
                     </c:when>
                  </c:choose>
               </c:forEach>
            </tr>
            <tr>
            <td colspan="4"></td>
            <td colspan="1"><div class="genric-btn default arrow">출입구<span class="lnr lnr-arrow-right"></span></div></td>
            <td colspan="4"></td>
            </tr>
         </table>
         </div>

         <div id="floor" class="floorbtn">
            <a href="seat.mc?floor=1F" class="genric-btn success">1F</a>
            <a href="seat.mc?floor=2F" class="genric-btn success">2F</a>
            <a href="seat.mc?floor=3F" class="genric-btn success">3F</a>
         </div>
         <!-- End Seat Area -->

      </div>
   </section>
   <!-- End Button -->