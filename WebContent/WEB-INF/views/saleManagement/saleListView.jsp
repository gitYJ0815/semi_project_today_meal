<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매관리</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="container">
		<nav class="snb">
			<div class="snb_inner">
				<h2>관리자 페이지</h2>
				<ul>
					<li><a href="#"><img alt="판매 관리 아이콘" src="${ contextPath }/resources/images/common/adminPage/menubar/delivery_icon.png" class="menu_icon delevery_management"><span class="depth_1">판매 관리</span></a></li>
					<li><a href="#"><img alt="매출 관리 아이콘" src="${ contextPath }/resources/images/common/adminPage/menubar/sale_icon.png" class="menu_icon sale_management"><span class="depth_1">매출 관리</span></a></li>
					<li>
						<img alt="상품 관리 아이콘" src="${ contextPath }/resources/images/common/adminPage/menubar/product_icon.png" class="menu_icon product_management"><span class="depth_1">상품 관리</span>
						<ul class="depth_2">
							<li><a href="#">상품 등록</a></li>
							<li><a href="#">상품 조회/수정</a></li>
						</ul>
					</li>
					<li><a href="#"><img alt="재고 관리 아이콘" src="${ contextPath }/resources/images/common/adminPage/menubar/inventory_icon.png" class="menu_icon inventory_management"><span class="depth_1">재고 관리</span></a></li>
					<li>
						<img alt="문의 관리 아이콘" src="${ contextPath }/resources/images/common/adminPage/menubar/question_icon.png" class="menu_icon question_management"><span class="depth_1">문의 관리</span>
						<ul class="depth_2">
							<li><a href="#">FAQ 관리</a></li>
							<li><a href="#">1:1 문의 관리</a></li>
						</ul>
					</li>
					<li><a href="#"><img alt="이벤트 게시판 관리" src="${ contextPath }/resources/images/common/adminPage/menubar/event_icon.png" class="menu_icon event_management"><span class="depth_1">이벤트 게시판 관리</span></a></li>
				</ul>
			</div>
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
							<span>일</span>
							<span>~</span>
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
							<span>일</span>
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
					<button type="button" class="green_btn search_button">검색</button>
				</form>
				<div class="result_area">
					<div class="result_change_status">
						<input type="checkbox" name="select_all" id="select_all"><label for="select_all">전체 선택</label>
						<button type="button">주문상태 변경</button>
					</div>
					<table summary="20개 주문 데이터 노출">
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">일자</th>
								<th scope="col">주문번호</th>
								<th scope="col">아이디</th>
								<th scope="col">주문상품 목록</th>
								<th scope="col">결제내역</th>
								<th scope="col">
									<select id="order_status">
										<option value="주문 상태">주문 상태</option>
										<option value="주문 완료">주문 완료</option>
										<option value="배송 대기">배송 대기</option>
										<option value="배송중">배송중</option>
										<option value="배송 완료">배송 완료</option>
										<option value="취소/환불">취소/환불</option>
									</select>
								</th>
								<th scope="col">상세 보기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>
									<label for="select_row" class="blind">해당 행 선택하기</label>
									<input type="checkbox" name="select_row" id="select_row">
								</td>
								<td>2021-08-31</td>
								<td>20210800555</td>
								<td>abcdef123456</td>
								<td>불낙지 3종 세트 외 2건</td>
								<td>350,000,000</td>
								<td>주문 완료</td>
								<td><button type="button">상세보기</button></td>
							</tr>
						</tbody>
					</table>
					<div class="paging">
						<ul>
							<li><a href="#"><img src="${ contextPath }/resources/images/common/paging/prev_disabled.png" alt=""></a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">6</a></li>
							<li><a href="#">7</a></li>
							<li><a href="#">8</a></li>
							<li><a href="#">9</a></li>
							<li><a href="#">10</a></li>
							<li><a href="#"><img src="${ contextPath }/resources/images/common/paging/next_active.png" alt=""></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>