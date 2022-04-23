<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/account/add"/>">Thêm</a>
    </li>
</ul>

<table class="table table-striped">
    <thead>
    <tr>
        <th class="text-center">Action</th>
        <th>ID</th>
        <th>Firstname</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Role</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="u">
        <tr>
            <td style="text-align: center">
                <a style="margin-right: 10px" href="<c:url value="/admin/account/edit/${u.id}"/>" data-toggle="tooltip" title="Sửa">
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

<c:if test="${alert.contains('khong') == false}">
    <div class="alert alert-success" role="alert">
            ${alert}
    </div>
</c:if>

<c:if test="${alert.contains('khong') == true}">
    <div class="alert alert-danger" role="alert">
            ${alert}
    </div>
</c:if>
