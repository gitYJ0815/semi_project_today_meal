<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>상품정보페이지</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
</head>
<style>
	a {
		color : black;
	}
    body {
        padding: 50px;
    }
    * {
        font-family: 'Noto Sans KR', sans-serif;
    }
    .product_view {
        position: relative;
        padding: 0 0 0 395px;
        width: 1000px;
        height: 375px;
        box-sizing: border-box;
        background-color: #F5F5F5;
        margin: 0 auto;
    }

    .product_view .img {
        position: absolute;
        left: 0;
        top: 0;
        margin-left: 50px;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    .product_view .img>img {
        width: 368px;
        height: 330px;
        border: 1px solid #e8e8e8;
    }

    .product_view h2 {
        text-align: center;
        margin: 0 0 15px;
        padding: 50px 0 20px;
        font-size: 24px;
        font-weight : bold;
    }

    .product_view table th,
    .product_view table td {
        padding: 14px 0;
        font-size: 15px;
        color: #444;
        text-align: center;
    }
	.product_view table td,
	.product_view table th {
		padding-left : 100px
	}
    table {
        margin-left: 150px;
    }

    /* .product_view table td.price {
        font-size: 22px;
    } */

    .product_view .btns {
        padding: 45px 0 0;
        text-align: center;
    }

    .product_view .btns>a {
        display: inline-block;
        width: 136px;
        height: 42px;
        border-radius: 2px;
        font-size: 16px;
        color: #fff;
        line-height: 42px;
    }

    .product_view .btns>a.btn2 {
        background: #294401;
        border-radius : 7px
    }

    a {
        color: #666;
        text-decoration: none;
    }

    li {
        list-style: none;
    }

    .review_sort_list li {
        display: inline-block;
    }

    .review_sort_list .selected {
        font-weight: bold;
    }

    .sub_btn p {
        display: inline-block;
        justify-content: space-around;
    }

    .sub_btn {
        width: 1000px;
        height: 50px;
        margin: 0px auto;
        border: 1px solid lightgray;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    #moveDtail {
        background: #A1AD61;
        text-align: center;
        width: 500px;
        margin: 0 auto;
        padding-top: 15px;
        padding-bottom: 15px;
        float: left;
    }

    #moveReview {
        /* text-align: center;
        width: 500px;
        height: 50px; */
        text-align: center;
        width: 500px;
        margin: 0 auto;
        padding-top: 15px;
        padding-bottom: 15px;
    }

    .detail_img {
        width: 800px;
        height: 900px;
        border: 1px solid lightgray;
        margin: 0 auto;
    }

    .review_sort {
        text-align: right;
        padding-right: 300px;
    }

    .review_info {
        width: 300px;
        vertical-align: middle;
    }

    .review_content {
        width: 550px;
        height: 200px;
        text-align: center;
        vertical-align: middle;
        word-break: break-all;
        margin-left: 50px;
    }

    .review_thum {
        width: 100px;
        margin-left: 45px;
        border: 1px solid black;
    }

    .review_list {
        width: 1000px;
        height: 200px;
        /* background-color: lightgray; */
        margin-left: 290px;
        /*border: 1px solid black;*/
        margin-top : 20px
    }

    #myDiv {
        display: none;
        width: 800px;
        background-color: lightgray;
        margin-left: 150px;
    }

    .con {
        vertical-align: middle;
    }

    #hide {
        padding-top: 10px;
        height: 500px;
    }

    .box {
        display: inline-block;
    }
    /* 0909 test */
    .main{
            position: relative;
            top: 50%;
            width: 1000px;
            height: 200px;
        }
           
        .main_common{
            display:inline-table;
            float: left;
            width: 100px;
            height: 100px;
        }
         
        .pcontent {
            display: table-cell;
            vertical-align: middle;
            text-align: center;
            word-break:break-all;
        }
/*          
        .main_1, .main_3 { font-size: 30px; }
        .main_2 { font-size: 40px; } */

        .main_1 {
            width: 200px;
            height: 200px;
        }
        .main_2{
            width: 500px;
            height: 200px;
        }
        .main_3 {
            width: 200px;
            height: 200px;
            text-align: center;
            vertical-align: middle;
        }
        .img_review {
            margin-top: 50px;
        }
        .detail_review_img {
            text-align: center;
            vertical-align: middle;
            width: 300px;
            height: 300px;
        }
        .detail_review_img img {
        	margin-left : 370px;
        }
        .detail_info {
            width: 100px;
            height: 100px;
            border: 1px solid black;
        }
        .detail_content {
            width: 500px;
            height: 100px;
            border: 1px solid black;
        }
        .detail {
            position: relative;
            top: 50%;
            width: 1000px;
            height: 170px;
            text-align: center;
            vertical-align: middle;
        }
        .fold_review {
            text-align: right;
            font-weight: bold;
        }
        .fold_review:hover{
            cursor: pointer;
        }
        /* 별점 스타일 */
		.star {
			display: inline-block;
			width: 10px;
			height: 10px;
			cursor: pointer;
		}
		.star_left {
			background: url(../../images/review/star.PNG) no-repeat 0 0;;
			background-size: 60px;
			margin-right: -3px;
		}
		.star_right {
			background: url(../images/review/star.PNG) no-repeat -30px 0;
			background-size: 60px;
			margin-left: -3px;
		}
		.detail_content {
			width : 100px;
		}
</style>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/top.jsp" />
    <div class="product_view">
        <h2 name="product_name"> <!-- 상품명 받아오기 --> </h2>
        <table>
            <colgroup>
                <col style="width:173px;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th>가격</th>
                    <td class="price" name="price"><!--  가격 받아오기  --></td>
                </tr>
                <tr>
                    <th>배송정보</th>
                    <td>배송일 지정</td>
                </tr>

            </tbody>
        </table>
        <div class="img">
            <img src="" alt="">

        </div>
        <div class="btns">
            <a href="#" class="btn2">재료변경/주문하기</a>
        </div>
    </div>
    <!-- 내부이동 버튼 영역-->
    <div class="sub_btn">
        <p id="moveDtail"><a href="#pro_detail">상세정보</a></p>
        <p id="moveReview"><a href="#reviewsort">리뷰</a></p>
    </div>
    <!-- 상품 상세 정보 -->
    <div class="detail_img" id="pro_detail">
        <img src="" alt="">
    </div>

    <!-- 리뷰 정렬 영역 -->
    <div class="review_sort" id="reviewsort">
        <ul class="review_sort_list">
            <li class="selected"><span onclick="">최신순</span> &nbsp; |</li>
            <li><span onclick="">별점높은순</span></li>
        </ul>
    </div>
    <!-- 하단 리뷰 영역 -->
    <div class="review_list">
        <ul class="review">
            <li class="review_li">
                <div class="main">
                    <div class="main_1 main_common">
                        <p class="pcontent">별점
                        <!--  이미지 테스트 
                        	<img src="../resources/images/review/star.PNG" style="width:20px; height:20px;">
                        	<img src="../resources/images/review/star.PNG" style="width:20px; height:20px;">
                        	<img src="../resources/images/review/star.PNG" style="width:20px; height:20px;">
                        	<img src="../resources/images/review/star.PNG" style="width:20px; height:20px;">
                        	<img src="../resources/images/review/star.PNG" style="width:20px; height:20px;">
                          -->
                         <br> 작성자 <br> 작성일 </p>
                    </div>
                    <div class="main_2 main_common"><p class="pcontent"><a href=#none id="show" onclick="review_detail();">리뷰내용</a></p></div>
                    <div class="main_3 main_common">
                        <img class="img_review" src="" alt=""
                        style="width: 100px; height: 100px;">
                    </div>
                </div>
            </li>
        </ul>
        <!-- 리뷰 내용 눌렀을 때 아래로 펼치기 기능 -->
        <div id="hide" style="display: none;">
            <div>
                <div class="detail">
                    <div class="main_common main_1">
                        <!-- <p class="pcontent">
                        	별점 <br> 작성자
                        </p>
                        -->
                        <div class="pcontent">
                        	<p>별점 
                        	<!--  이미지 테스트
                        	<img src="../resources/images/review/star.PNG" style="width:20px; height:20px;">
                        	<img src="../resources/images/review/star.PNG" style="width:20px; height:20px;">
                        	<img src="../resources/images/review/star.PNG" style="width:20px; height:20px;">
                        	<img src="../resources/images/review/star.PNG" style="width:20px; height:20px;">
                        	<img src="../resources/images/review/star.PNG" style="width:20px; height:20px;">
                        	  -->
                        	</p>
                        	<p>작성자</p>
                        </div>
                    </div>
                    <div class="main_common main_2">
                        <p class="pcontent">리뷰 내용</p>
                    </div>
                </div>
                <div class="detail_review_img">
                    <img style="width: 300px; height: 300px;" src="" alt="">
                </div>
                <div><p class="fold_review" id="fold" onclick="folding();">▲ 리뷰 접기</p></div>
            </div>
        </div>
    </div>
    <form role="form" method="post">
        <input type="hidden" name="" value="" />
    </form>

    <script>
        function review_detail() {
            var main = document.querySelector('.main');
            var thumnail = document.getElementById('thumbnail');
            if (hide.style.display == 'none') {
                hide.style.display = '';
                main.style.display = 'none';
            } else {
                hide.style.display = 'none';
            }
        }

        function folding() {
            var fold = document.getElementById('fold');
            var main = document.querySelector('.main');
            if (main.style.display == 'none') {
                main.style.display = '';
                hide.style.display = 'none';
            }
        }
    </script>
    <!--  sub_btn 특정 위치에서 따라다니는 메뉴바 스크립트 -->
    <script>
    $(window).scroll(function() {
    	if($(this).scrollTop() > 400) {
    		$(".sub_btn").css('position','fixed').css('margin-left','250px').css('top','0');
    	} else {
    		 $(".sub_btn").css('position', 'relative');
    	}
    });
    </script>
    
    <jsp:include page="/WEB-INF/views/common/top.jsp" />
</body>

</html>