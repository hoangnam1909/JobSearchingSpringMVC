<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/company/add"/>">Thêm</a>
    </li>
</ul>

<table class="table table-striped">
    <thead>
    <tr>
        <th class="text-center" style="width: 10%">Thực thi</th>
        <th style="width: 5%">ID</th>
        <th style="width: 20%">Tên</th>
        <th style="width: 25%">Địa điểm</th>
        <th style="width: 20%">Liên hệ</th>
        <th style="width: 20%">Trang web</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${companies}" var="com">
        <tr>
            <td style="text-align: center">
                <a style="margin-right: 10px" href="<c:url value="/admin/company/edit/${com.id}"/>" data-toggle="tooltip" title="Sửa">
                    <i class="fa-solid fa-pen"></i>
                </a>
                <a style="margin-right: 10px" href="<c:url value="/admin/company/delete/${com.id}"/>" data-toggle="tooltip" title="Xoá">
                    <i class="fa-solid fa-trash"></i>
                </a>
            </td>
            <td>${com.id}</td>
            <td>${com.name}</td>
            <td>${com.location}</td>
            <td>${com.contact}</td>
            <td>${com.website}</td>
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
    <c:forEach begin="1" end="${Math.ceil(counter/companyService.maxItemsInPage)}" var="page">
        <li class="page-item">
            <a class="page-link" href="<c:url value="/admin/company/" />?page=${page}">${page}</a>
        </li>
    </c:forEach>
</ul>
