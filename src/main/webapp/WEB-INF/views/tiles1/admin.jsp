<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #reports > * {
        border: solid 1px black;
    }
</style>

    <div id="reports">
        <c:forEach items="${reports}" var="report">

            <div class="no">${report.reportNo}</div>
            <div class="cert">${report.fkCertifyNo}</div>
            <div class="content">'${report.reportContent}</div>

        </c:forEach>

    </div>
