<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매관리</title>
<link href="<%= request.getContextPath() %>/resources/css/saleManagement/saleListView.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="container">
		<nav class="snb">
			<jsp:include page="/WEB-INF/views/common/adminPage/subMenu.jsp"/>
		</nav>
		<div class="contents">
			<div class="contents_inner">
				<h2>판매 관리</h2>
				<form class="search_area">
					<div>
						<div>
							<label for="startYear">기간 : </label>
							<select id="startYear" name="startYear" class="year">
								<option value="2021">2021</option>
								<option value="2021">2020</option>
								<option value="2021">2019</option>
								<option value="2021">2018</option>
							</select>
							<span>년</span>
							<select name="startMonth">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
							<span>월</span>
							<select name="startDay">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
							</select>
							<span class="except_margin">일</span>
							<span class="except_margin">~</span>
							<select name="endYear" class="year">
								<option value="2021">2021</option>
								<option value="2021">2020</option>
								<option value="2021">2019</option>
								<option value="2021">2018</option>
							</select>
							<span>년</span>
							<select name="endMonth">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
							<span>월</span>
							<select id="endDay">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
							</select>
							<span class="except_margin">일</span>
						</div>
						<div>
							<div>
								<label for="id">아이디 :</label>
								<input type="text" name="id" id="id" maxLength="12" placeholder="아이디 입력">
							</div>
							<div>
								<label for="orderNumber">주문 번호 : </label>
								<input type="number" name="orderNumber" id="orderNumber" placeholder="주문번호 입력">
							</div>
						</div>
					</div>
					<button type="button" class="green_button search_button">검색</button>
				</form>
				<div class="result_area">
					<div class="result_option">
						<input type="checkbox" name="selectAll" id="selectAll">
						<label for="selectAll">전체 선택</label>
						<button type="button" class="green_button">주문상태 변경</button>
					</div>
					<table>
						<caption class="blind">주문 데이터</caption>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">일자</th>
								<th scope="col">주문번호</th>
								<th scope="col">아이디</th>
								<th scope="col">주문상품 목록</th>
								<th scope="col">결제내역</th>
								<th scope="col">
									<select name="orderStatus">
										<option value="default" selected>주문 상태</option>
										<option value="processing">주문 완료</option>
										<option value="pickup">배송 대기</option>
										<option value="transit">배송중</option>
										<option value="delivered">배송 완료</option>
										<option value="cancelled">취소/환불</option>
									</select>
								</th>
								<th scope="col">상세 보기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" name="select_row" class="active"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="select_row"></td>
								<td>2021-08-31</td>
								<td>2108270099</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button" class="green_button learn_more_button">상세 보기</button></td>
							</tr>
						</tbody>
					</table>
					<div class="paging">
						<jsp:include page="/WEB-INF/views/common/paging/paging.jsp"/>
					</div>
				</div>
			</div>
		</div>
		<div class="dimmed">
			<div id ="modal">
				<div class="modal_inner">
					<div class="payment_inner">
						<h3>거래내역</h3>
						<div class="status_area">
							<ul>
								<li>2108270099</li>
								<li>2021-08-27</li>
							</ul>
							<div>
								<p>주문완료 상태</p>
							</div>
						</div>
						<div class="product_area">
							<h4>- 상품내역</h4>
							<table>
								<thead>
									<tr>
										<th scope="col">제품명</th>
										<th scope="col">제품 수량</th>
										<th scope="col">가격</th>
									</tr>
								</thead>
								<tbody>
									<tr class="depth_1">
										<td>불낙지 3종 세트</td>
										<td class="center">99</td>
										<td class="center">500,000,000</td>
									</tr>
									<tr class="depth_2">
										<td>+ 무순</td>
										<td class="center">2</td>
										<td class="center">1,000</td>
									</tr>
									<tr class="depth_2">
										<td>+ 타이거 새우 튀김</td>
										<td class="center">2</td>
										<td class="center">1,000</td>
									</tr>
								</tbody>
								<tbody>
									<tr class="depth_1">
										<td>스키야키</td>
										<td class="center">99</td>
										<td class="center">1,000,000</td>
									</tr>
									<tr class="depth_2">
										<td>+ 배추</td>
										<td class="center">1</td>
										<td class="center">1,000</td>
									</tr>
									<tr class="depth_2">
										<td>+ 두부</td>
										<td class="center">5</td>
										<td class="center">3,000</td>
									</tr>
								</tbody>
								<tbody>
									<tr class="depth_1">
										<td>알리오 올리오 치즈 세트</td>
										<td class="center">99</td>
										<td class="center">500,000,000</td>
									</tr>
									<tr class="depth_2">
										<td>+ 타이거 새우</td>
										<td class="center">5</td>
										<td class="center">30,000</td>
									</tr>
									<tr class="depth_2">
										<td>+ 베이컨</td>
										<td class="center">5</td>
										<td class="center">3,000</td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td>배송료</td>
										<td class="center">1</td>
										<td class="center">3,000</td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td>적립금 사용</td>
										<td class="center">1</td>
										<td class="center">-2,000</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<th scope="row" colspan="2">합계</th>
										<td class="center">350,000,000</td>
									</tr>
								</tfoot>
							</table>
						</div>
						<div class="list">
							<h4>- 결제내역</h4>
							<div>
								<dl>
									<dt class="two_line">거래<br> 고유 번호</dt>
									<dd>imp_550999463154</dd>
								</dl>
								<dl>
									<dt>결제 수단</dt>
									<dd>신용카드</dd>
								</dl>
								<dl>
									<dt>결제금액</dt>
									<dd>350,000,000</dd>
								</dl>
								<dl>
									<dt>승인일시</dt>
									<dd>2021-08-31 18:25:04</dd>
								</dl>
								<dl>
									<dt>결제상태</dt>
									<dd>미결제</dd>
								</dl>
							</div>
						</div>
						<div class="list">
							<h4>- 배송정보</h4>
							<div>
								<dl>
									<dt>이름</dt>
									<dd>강하늘</dd>
								</dl>
								<dl>
									<dt>연락처</dt>
									<dd>010-1111-2222</dd>
								</dl>
								<dl>
									<dt>주소</dt>
									<dd class="two_line">
										경기 성남시 분당구 불정로 6(13561)
										101동 1501호
									</dd>
								</dl>
								<dl>
									<dt class="two_line">배송시<br>요청사항</dt>
									<dd class="two_line">신선하게 배송해주세요.신선하게 배송해주세요.신선하게 배송해주세요.신선하게 배송해주세요.신선하게 배송해주세요.</dd>
								</dl>
								<dl>
									<dt>결제상태</dt>
									<dd>미결제</dd>
								</dl>
							</div>
						</div>
						<button type="button" class="green_button check_button">확인</button>
					</div>
					<div class="change_inner">
						<h3>선택한 주문 건을 모두 아래와<br> 같은 주문 상태로 변경하겠습니까?</h3>
						<div class="change_area">
							<p class="prev_status">주문 완료</p>
							<span></span>
							<select name="change_status">
								<option value="default" selected>주문 상태</option>
								<option value="processing">주문 완료</option>
								<option value="pickup">배송 대기</option>
								<option value="transit">배송중</option>
								<option value="delivered">배송 완료</option>
								<option value="cancelled">취소/환불</option>
							</select>
						</div>
						<div class="button_area">
							<button type="button" class="green_button">취소</button>
							<button type="button" class="confirm_button">확인</button>
						</div>
					</div>
				</div>
				<button type="button" class="close_button"></button>
			</div>
		</div>
	</div>
	
	<script src="${ contextPath }/resources/js/saleManagement/saleListView.js"></script>
</body>
</html>