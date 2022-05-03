<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<h1 class="text-center dark-color">TÌM KIẾM ỨNG VIÊN</h1>

<table class="table table-striped mt-5">
    <thead>
    <tr>
        <th class="text-center" style="width: 10%">Thực thi</th>
        <th class="text-center" style="width: 10%">STT</th>
        <th>Tên đăng nhập</th>
        <th>Số điện thoại</th>
        <th>Email</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="u" varStatus="loop">
        <tr>
            <td style="text-align: center">
                <a style="margin-right: 10px" href="<c:url value="/employer/find/view" />?id=${u.id}"
                   title="Xem chi tiết">
                    <i class="fa-solid fa-eye"></i>
                </a>
            </td>
            <td class="text-center">${(currentPage - 1) * userService.maxItemsInPage + loop.index + 1}</td>
            <td>${u.username}</td>
            <td>${u.phone}</td>
            <td>${u.email}</td>
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
            <a class="page-link" href="<c:url value="/employer/find" />?page=${page}">${page}</a>
        </li>
    </c:forEach>
</ul>
