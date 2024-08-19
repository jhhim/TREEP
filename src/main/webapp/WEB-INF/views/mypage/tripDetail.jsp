<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>

.container {
    display: flex;
    height: 100vh;
}

.left-panel {
    flex: 0 0 400px;
    background: #ffffff;
    padding: 20px;
    border-right: 2px solid #cce5cc; 
/*     box-shadow: 4px 0 8px rgba(0,0,0,0.1);
 */    overflow: hidden;
}

.trip-title {
    font-size: 2em;
    margin-bottom: 15px;
    color: #2e8b57; 
}

.trip-dates p {
    font-size: 1.2em;
    color: #666;
    margin-bottom: 10px;
}

.trip-photo {
    text-align: center;
    margin-top: 15px;
}

.photo {
    max-width: 100%;
    height: auto;
    border-radius: 10px;
    border: 2px solid #d1e7d1; 
}

.right-panel {
    flex: 1;
    padding: 20px;
    overflow-y: auto;
}

.schedules {
    border-top: 2px solid #d1e7d1;
}

.schedule {
    margin-bottom: 20px;
    padding: 15px;
    border: 1px solid #cce5cc; 
    border-radius: 10px;
    background: #f9fff9; 
}

.schedule-date {
    font-size: 1.4em;
    color: #2e8b57;
    margin-bottom: 10px;
}

.schedule-content {
    font-size: 1.1em;
    color: #666;
    margin: 10px 0;
}

.places-list {
    list-style: none;
    padding: 0;
}

.place-item {
    background: #e6ffe6; 
    margin-bottom: 8px;
    padding: 10px;
    border-radius: 6px;
    color: #2e8b57; 
    border: 1px solid #b3e2b3; 
}

</style>
<main>
<div class="container">
        <div class="left-panel">
            <h1 class="trip-title">${trip.trip_title}</h1>
            <div class="trip-dates">
                <p><strong>Start Date:</strong> ${trip.trip_start}</p>
                <p><strong>End Date:</strong> ${trip.trip_end}</p>
            </div>
            <div class="trip-photo">
                <img src="${trip.place_photo_url}" alt="Place Photo" class="photo">
            </div>
        </div>
        <div class="right-panel">
            <div class="schedules">
                <h2>Schedules</h2>
                <c:forEach var="schedule" items="${trip.schedules}">
                    <div class="schedule">
                        <h3 class="schedule-date">Schedule Date: ${schedule.schedule_date}</h3>
                        <p class="schedule-content">Schedule Content: ${schedule.schedule_content}</p>
                        <h4>Places</h4>
                        <ul class="places-list">
                            <c:forEach var="place" items="${schedule.places}">
                                <li class="place-item">Place Name: ${place.place_name}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>