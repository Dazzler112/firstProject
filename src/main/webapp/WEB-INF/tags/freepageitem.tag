<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="freePageNum" %>

<c:url value="/freeboard/freelist" var="freepageLink">
	<c:param name="page" value="${freePageNum }" />
	<c:if test="${not empty param.search }">
		<c:param name="search" value="${param.search }" />
	</c:if>
	<c:if test="${not empty param.type }">
		<c:param name="type" value="${param.type }" />
	</c:if>

</c:url>
	<li class="page-item">
		<a class="page-link ${freePageNum eq pageInfo.thisPage ? 'active' : '' }" href="${freepageLink }">
		<jsp:doBody></jsp:doBody>
		</a>
	</li>