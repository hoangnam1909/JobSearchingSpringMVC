<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/job-type/add"/>">Thêm</a>
    </li>
</ul>

<table class="table table-striped">
    <thead>
    <tr>
        <th class="text-center">Action</th>
        <th>Name</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${jobTypes}" var="jt">
        <tr>
            <td style="text-align: center">
                <a style="margin-right: 10px" href="<c:url value="/admin/job-type/edit/${jt.id}"/>" data-toggle="tooltip" title="Sửa">
                    <i class="fa-solid fa-pen"></i>
                </a>
                <a href="<c:url value="/admin/job-type/delete/${jt.id}"/>" data-toggle="tooltip" title="Xoá">
                    <i class="fa-solid fa-trash"></i>
                </a>
            </td>
            <td>${jt.name}</td>
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
