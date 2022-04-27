<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/account/add"/>">Thêm</a>
    </li>
</ul>

<table class="table table-striped">
    <thead>
    <tr>
        <th class="text-center" style="width: 10%">Action</th>
        <th style="width: 5%">ID</th>
        <th style="width: 25%">Username</th>
        <th style="width: 15%">Phone</th>
        <th style="width: 30%">Email</th>
        <th style="width: 15%">Role</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="u">
        <tr>
            <td style="text-align: center">
                <a style="margin-right: 10px" href="<c:url value="/admin/account/edit/${u.id}"/>" data-toggle="tooltip"
                   title="Sửa">
                    <i class="fa-solid fa-pen"></i>
                </a>
                <a href="<c:url value="/admin/account/delete/${u.id}"/>" data-toggle="tooltip" title="Xoá">
                    <i class="fa-solid fa-trash"></i>
                </a>
            </td>
            <td>${u.id}</td>
            <td>${u.username}</td>
            <td>${u.phone}</td>
            <td>${u.email}</td>
            <td>${u.userType}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<c:if test="${sucMsg != null}">
    <div class="alert alert-success" role="alert">
            ${sucMsg}
    </div>
</c:if>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger" role="alert">
            ${errMsg}
    </div>
</c:if>

<ul class="pagination d-flex justify-content-center mt-4">
    <c:forEach begin="1" end="${Math.ceil(counter/userService.maxItemsInPage)}" var="page">
        <li class="page-item">
            <a class="page-link" href="<c:url value="/admin/account/" />?page=${page}">${page}</a>
        </li>
    </c:forEach>
</ul>
