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
        <th>ID</th>
        <th>Tiêu đề</th>
        <th>Ngày đăng</th>
        <th>Đăng bởi</th>
        <th>Loại việc làm</th>
        <th>Công ty</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${jobPosts}" var="jp">
        <tr>
            <td style="text-align: center">
                <a style="margin-right: 10px" href="<c:url value="/admin/job-post/edit/${jp.id}"/>"
                   data-toggle="tooltip"
                   title="Sửa">
                    <i class="fa-solid fa-pen"></i>
                </a>
                <a style="margin-right: 10px" href="<c:url value="/admin/job-post/delete/${jp.id}"/>"
                   data-toggle="tooltip"
                   title="Xoá">
                    <i class="fa-solid fa-trash"></i>
                </a>
            </td>
            <td> ${jp.id} </td>
            <td> ${jp.title} </td>
            <td>
                <c:if test="${jp.createdDate != null}">
                    <fmt:formatDate pattern="dd/MM/yyyy" value="${jp.createdDate}"/>
                </c:if>
            </td>
            <td>
                    ${userService.getById(jp.postedByUser.id).username}
            </td>
            <td>
                    ${jobTypeService.getById(jp.jobType.id).name}
            </td>
            <td>
                    ${companyService.getById(jp.company.id).name}
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

<c:if test="${currentPage != null}">
    <ul class="pagination d-flex justify-content-center mt-4">
        <c:forEach begin="1" end="${Math.ceil(countAll/maxItems)}" var="i">
            <c:if test="${currentPage == i}">
                <li class="page-item active">
                    <a class="page-link" href="<c:url value="/admin/job-post/${i}"/>">${i}</a>
                </li>
            </c:if>
            <c:if test="${currentPage != i}">
                <li class="page-item">
                    <a class="page-link" href="<c:url value="/admin/job-post/${i}"/>">${i}</a>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</c:if>
