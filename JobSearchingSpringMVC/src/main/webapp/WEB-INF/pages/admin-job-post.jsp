<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="now" value="<% = new java.util.Date()%>"/>

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/job-post/add"/>">Thêm</a>
    </li>
</ul>

<table class="table table-striped">
    <thead>
    <tr>
        <th class="text-center">Action</th>
        <th>Tiêu đề</th>
        <th>Người đăng</th>
        <th>Ngày đăng</th>
        <th>Ngày hết hạn</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${jobPosts}" var="jp">
        <tr>
            <td style="text-align: center">
                <a style="margin-right: 10px" href="<c:url value="/admin/job-post/edit/${jp.id}"/>" data-toggle="tooltip"
                   title="Sửa">
                    <i class="fa-solid fa-pen"></i>
                </a>
                <a href="/admin/job-post/delete/${jp.id}" data-toggle="tooltip" title="Xoá">
                    <i class="fa-solid fa-trash"></i>
                </a>
            </td>
            <td>
                    ${jp.title}
            </td>
            <td>
                    ${jp.postedByUser.id}
            </td>
            <td>
                <c:if test="${jp.createdDate != null}">
                    <fmt:formatDate type="time" value="${jp.createdDate}"/>
                    -
                    <fmt:formatDate pattern="d/M/y" value="${jp.createdDate}"/>
                </c:if>
            </td>
            <td>
                <c:if test="${jp.expiredDate != null}">
                    <fmt:formatDate type="time" value="${jp.expiredDate}"/>
                    -
                    <fmt:formatDate pattern="d/M/y" value="${jp.expiredDate}"/>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
