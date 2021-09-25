<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인</title>
<style>
    #kakao{
        width: 330px;
        height: 394px;
        margin: 100px auto;
        display: flex;
        justify-content: center;
        align-items:center;
        height: 70vf;
    }

</style>
</head>
<body>
     <%@ include file="/WEB-INF/views/common/header.jsp" %>
     
     <form class="loginArea" action="<%= request.getContextPath() %>/kakaologin" method="post" onsubmit="return validate();">
     
     <img id="kakao" src="<%= request.getContextPath() %>/resources/images/login/kakao.PNG">
    
     </form>
     <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>