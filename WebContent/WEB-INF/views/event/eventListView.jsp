<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행중인 이벤트</title>
<link href="<%= request.getContextPath() %>/resources/css/event/eventStyle.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/top.jsp" />
	<div id="container">
                    <h2 style="font-weight : bolder; font-size:32px">진행중인 이벤트</h2>
                    <div class="search_area">
                        <form action="">
                            <span class="input_area"> 
                                <input type="search" name="searchValue" value="">
                            </span>
                            <button type="submit">검색</button>
                        </form>
                    </div>
                    <div class="board_list" onclick="">
                        <ul class="board_header">
                            <li class="title">제목</li>
                            <li class="term">기간</li>
                            <li class="count">조회수</li>
                        </ul>
                        <ul class="board_ul" onclick="">
                            <li class="title"></li>
                            <li class="term"></li>
                            <li class="count"></li>
                        </ul>
                    </div>
                <!-- </div> -->
            <!-- </div> -->
        </div>
</body>
</html>