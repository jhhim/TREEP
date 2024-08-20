<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<div class="share_info_container">
         <p class="share_info">당신의 아이디는
        </p>
        <p class="resultid">${member.member_id}</p><p> 입니다</p>
        </div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>