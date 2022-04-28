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
        <th class="text-center">Thực thi</th>
        <th>ID</th>
        <th>Tên</th>
        <th>Mô tả</th>
        <th>Địa điểm</th>
        <th>Liên hệ</th>
        <th>Trang web</th>
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
            <td>${com.description}</td>
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
