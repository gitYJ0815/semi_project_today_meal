<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="login.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/payment/payment.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="container">
		<div class="contents">
			<div class="inner">
				<div class="payment_title">
					주문/결제
				</div>	
			 	<div class="left">
			 		<div class="product_info">
			 			<div class="payment_subject">
							상품정보
						</div>
			 			<div class="date">
			 				배송 : <span>2021-08-30</span>도착(배송일 지정)
			 			</div>
			 			<div class="product">
			 				<div class="img_area">
			 					<img src="<%= request.getContextPath() %>/resources/images/faq/Q.png" class="pro_thumb">
			 				</div>
			 				<div class="pro_name">
			 					<p class="goods">백리향 백짬뽕</p>
			 					<p>1개(12,900원)</p>
			 				</div>
			 				<div class="pro_info">
			 					<table class="info">
			 						<tr>
			 							<td>상품금액</td>
			 							<td class="info_price">1개(12,900원)</td>
			 						</tr>
			 						<tr>
			 							<td>우동사리</td>
			 							<td class="info_price">2개(3,000원)</td>
			 						</tr>
			 						<tfoot>
			 							<tr>
			 								<td>총 금액</td>
			 								<td>15,900원</td>
			 							</tr>
			 						</tfoot>
			 					</table>
			 				</div>
			 			</div>
			 		</div>
			 		
			 		<div class="delivery_info">
			 			<div class="payment_subject">
							배송정보
						</div>
			 			<table cellspacing="10">
			 				<tr>
			 					<td>우편번호<b>*</b></td>
			 					<td><input type="text" name="address" class="postcodify_postcode5" value="${ loginUser.address1 }" readonly required></td>
			 					<td><button id="postcodify_search_button" type="button">검색</button></td>			 							
			 				</tr>
			 				<tr>
			 					<td>도로명주소<b>*</b></td>
			 					<td colspan="3"><input type="text" name="address" class="postcodify_address" value="${ loginUser.address2 }" readonly required></td>
			 				</tr>
			 				<tr>
			 					<td>상세주소<b>*</b></td>
			 					<td colspan="3"><input type="text" name="address" class="postcodify_details" value="${ loginUser.address3 }" required></td>
			 				</tr>
			 				<tr>
			 					<td>받는 분<b>*</b></td>
			 					<td colspan="2"><input type="text" name="member" value="${ loginUser.userName }" required></td>
			 				</tr>
			 				<tr>
			 					<td>연락처<b>*</b></td>
			 					<td colspan="2"><input type="text" name="member" value="${ loginUser.phone }" required></td>
			 				</tr>
			 				<tr>
			 					<td colspan="3"><input type="text" name="msg" class="delivery_msg" 
			 						placeholder="배송 메시지를 입력해주세요"></td>
			 				</tr>
			 			</table>
			 		</div>
			 		
			 		<div class="discount">
			 			<div class="payment_subject">
							할인
						</div>
			 			<div class="discount_div">
				 			적립금 <input type="text" id="use" value="">&nbsp;&nbsp;/&nbsp;&nbsp;<span>${ loginUser.coin }</span>
				 			<form class="full_use">
				 				<input type="checkbox" id="coin" name="" value="">
								<label for="coin">전액사용</label>
				 			</form>
			 			</div>
			 		</div>
			 	</div>
				<div class="right">
					
						<div class="payment_info">
							<div class="price">
								<div class="payment_subject">
									결제금액
								</div>
								<span id="final_price">18,900</span>원<br>
								주문금액 <span>15,900</span>원 - 할인금액 <span>0</span>원 + 배송비 <span>3,000</span>원 
							</div>
							<div class="pay_method">
								신용카드 결제
							</div>
								<div class="btn_area">
									<button type="submit" id="btn" onclick="requestPay()">결제하기</button>
								</div>
						</div>
					
				</div>
			</div> <!-- inner div -->		
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<!-- 우편번호 검색 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    
  	<!-- 아임포트 -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

	<script>
		// 우편번호 검색
		$(function(){ 
			$("#postcodify_search_button").postcodifyPopUp(); 
		});
		
		// 적립금 전액사용
		let chk = $("input[id=coin]");

		chk.on("click", function(){
		  if($(this).is(":checked")){
		    $("#use").val(${ loginUser.coin});
		  }else
		 	 $("#use").val("");
		});
		
		// 아임포트 API 연동 -----------------------------------------------------------------------
		var IMP = window.IMP;
	    IMP.init("{imp24190117}");
	    
	    function requestPay() {
	        // IMP.request_pay(param, callback) 결제창 호출
	        IMP.request_pay({ // param
	            pg: "html5_inicis",		// PG사 선택
	            pay_method: "card",		// 지불 수단
	            merchant_uid: "ORD20180131-0000011",	// 고유한 id
	            name: "노르웨이 회전 의자",	// 상품명
	            amount: 64900,			// 가격
	            buyer_email: "gildong@gmail.com",	// 구매자 이메일
	            buyer_name: "홍길동",		// 구매자 이름
	            buyer_tel: "010-4242-4242",		// 구매자 연락처
	            buyer_addr: "서울특별시 강남구 신사동",	// 구매자 주소
	            buyer_postcode: "01181"			// 구매자 우편번호
	        }, function (rsp) { // callback
	            if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	                $.ajax({
	                	url: "{서버의 결제 정보를 받는 endpoint}", // 예: https://www.myservice.com/payments/complete
	                    method: "POST",
	                    headers: { "Content-Type": "application/json" },
	                    data: {
	                        imp_uid: rsp.imp_uid,
	                        merchant_uid: rsp.merchant_uid
	                    }
	                }).done(function (data) {
	                  // 가맹점 서버 결제 API 성공시 로직
	                })
	              } else {
	                alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	              }
	            });
	      }
	</script>
</body>
</html>