<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<h1 class="text-center text-success">XÁC NHẬN NHÀ TUYỂN DỤNG</h1>

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/account-permission/accept-all"/>">Xác nhận tất cả</a>
    </li>
</ul>

<table class="table table-striped">
    <thead>
    <tr>
        <th class="text-center" style="width: 10%">Thực thi</th>
        <th class="text-center" style="width: 5%">STT</th>
        <th class="text-center" style="width: 10%">ID</th>
        <th>Tên đăng nhập</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Loại tài khoản</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="u" varStatus="loop">
        <tr>
            <td style="text-align: center">
                <a style="margin-right: 10px" href="<c:url value="/admin/account-permission/accept" />?id=${u.id}"
                   data-toggle="tooltip"
                   title="Duyệt">
                    <i class="fa-solid fa-check"></i>
                </a>
            </td>
            <td class="text-center">${(currentPage - 1) * jobTypeService.maxItemsInPage + loop.index + 1}</td>
            <td class="text-center">#${u.id}</td>
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
            <a class="page-link" href="<c:url value="/admin/account-permission/" />?page=${page}">${page}</a>
        </li>
    </c:forEach>
</ul>
