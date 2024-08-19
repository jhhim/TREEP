<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
<h1>Trip Details</h1>
    <div>
        <p>Trip Title: ${trip.trip_title}</p>
        <p>Start Date: ${trip.trip_start}</p>
        <p>End Date: ${trip.trip_end}</p>
        <p>Place Photo URL: <img src="${trip.place_photo_url}" alt="Place Photo"/></p>
        <h2>Schedules</h2>
        <c:forEach var="schedule" items="${trip.schedules}">
            <h3>Schedule Date: ${schedule.schedule_date}</h3>
            <p>Schedule Content: ${schedule.schedule_content}</p>
            <h4>Places</h4>
            <c:forEach var="place" items="${schedule.places}">
                <p>Place Name: ${place.place_name}</p>
            </c:forEach>
        </c:forEach>
    </div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>