<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <style>
 ul{
 text-align:left;
 }
 </style>
	<ul>
	<c:if test="${noticeList != null}">
      <c:forEach var="dto" items="${noticeList}" varStatus="status">
      	
      	<li><a href="boardNotice?num=${dto.bn_num}">${dto.bn_title}</a></li>
   
      	
      	</c:forEach>
      	</c:if>
      </ul>
