<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<h1 class="text-center dark-color">QUẢN LÝ NGƯỜI DÙNG</h1>

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/account/add-or-update"/>">
            <i class="fa-solid fa-plus"></i>
            Thêm
        </a>
    </li>
</ul>

<table class="table table-striped">
    <thead>
    <tr>
        <th class="text-center" style="width: 15%">Thực thi</th>
        <th class="text-center" style="width: 5%">STT</th>
<%--        <th class="text-center" style="width: 10%">ID</th>--%>
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
                <a style="margin-right: 10px" href="<c:url value="/admin/account/view" />?id=${u.id}"
                   title="Xem chi tiết">
                    <i class="fa-solid fa-eye"></i>
                </a>
                <a style="margin-right: 10px" href="<c:url value="/admin/account/add-or-update" />?id=${u.id}"
                   data-toggle="tooltip" title="Sửa">
                    <i class="fa-solid fa-pen"></i>
                </a>
                <a href="<c:url value="/admin/account/delete" />?id=${u.id}" class="confirmation" title="Xoá">
                    <i class="fa-solid fa-trash"></i>
                </a>
            </td>
            <td class="text-center">${(currentPage - 1) * userService.maxItemsInPage + loop.index + 1}</td>
<%--            <td class="text-center">#${u.id}</td>--%>
            <td>${u.username}</td>
            <td>${u.phone}</td>
            <td>${u.email}</td>
            <td>
                    ${u.userType}
                        <c:if test="${u.userType.equals('ROLE_UV')}">
                            <a style="margin-left: 10px" href="<c:url value="/admin/account/candidate-info/update" />?userId=${u.id}"
                               data-toggle="tooltip" title="Sửa thông tin ứng viên">
                                <i class="fa-solid fa-user-pen"></i>
                            </a>
                        </c:if>
            </td>
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
            <a class="page-link" href="<c:url value="/admin/account" />?page=${page}">${page}</a>
        </li>
    </c:forEach>
</ul>
