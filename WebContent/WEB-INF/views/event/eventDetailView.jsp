<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/event/eventDetailStyle.css" rel="stylesheet">
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
            <h2 style="font-weight:bold; font-size:20px">진행중인 이벤트</h2>
            <div class="notice_content">
                <div class="subject">
                    <span>제목 :   </span> 
                    <span>기간 :   </span>
                </div>
                <div id="eventImg_area" style="height: 1600px;">
                    <!-- 이벤트 이미지 영역-->
                    <img src="">
                </div>
                <div class="btn_area">
                    <button type="button" onclick="location.href='${contextPath}/today_meal/event/list'">목록으로</button>
                </div>
            </div>
            <form name="eventForm" method="post">
				<input type="hidden" name="eno" value="${ event.eno }">
			</form>    
        </div>
</body>
</html>