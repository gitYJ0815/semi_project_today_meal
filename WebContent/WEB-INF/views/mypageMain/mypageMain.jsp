<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/mypageMain/mypageMain.css" rel="stylesheet">
</head>
<body>
	
<div class="myPageFrame">
        <div class="myPageWrapper">
            <div class="mpTitle">
                <span><h2 class="mpH2 welcomeName">   님 반갑습니다.</h2></span>
                <span><h2 class="mpH2 welcomeCoin">적립금 : 0원</h2></span>
            </div>
            <div class="mpContent">
                <div class="myOrderHistory">
                    <h2 class="mpH2" style="color: black;">주문내역(최근 1개월)</h2>
                </div>
                <div class="mpStatus">
                    <img class="mpImg" src="<%= request.getContextPath() %>/resources/images/mypageMain/mp1.png">
                    <img class="mpPoint" src="<%= request.getContextPath() %>/resources/images/mypageMain/mpPoint.png">
                    <img class="mpImg" src="<%= request.getContextPath() %>/resources/images/mypageMain/mp2.png">
                    <img class="mpPoint" src="<%= request.getContextPath() %>/resources/images/mypageMain/mpPoint.png">
                    <img class="mpImg" src="<%= request.getContextPath() %>/resources/images/mypageMain/mp3.png">
                    
                    <!-- <span id="mpCount1">1</span>
                    <span id="mpCount2">2</span>
                    <span id="mpCount3">3</span> -->
                </div>
                <div class="mpTable">
                    <table>
                        <thead>
                            <tr>
                                <th>주문일자</th>
                                <th>주문 상품 정보</th>
                                <th>결제 금액</th>
                                <th>주문 상태</th>
                            </tr>
                        </thead>
                        <tbody>
                             <tr>
                                <td colspan="4">최근 주문/배송 조회 내역이 없습니다.</td>
                            </tr>
                            <!-- <tr>
                                <td>2021년09월08일</td>
                                <td>
                                    <div>
                                    <img src="images/rank1.png">
                                    <p>
                                        [양식]파시트일이삼사오<br>
					                                      추가 상품: 소스1개, 면 1개, 치즈 1개<br>
					                                      수량 : 2개
                                    </p>
                                    </div>
                                </td>
                                <td>10,000원</td>
                                <td>결제완료</td>
                            </tr>  -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>