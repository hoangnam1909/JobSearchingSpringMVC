<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 class="text-center dark-color">QUẢN LÝ BÀI VIẾT</h1>

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/job-post/add-or-update"/>">Thêm</a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
           aria-expanded="false">Sắp xếp</a>
        <div class="dropdown-menu">
            <c:url var="editUrl" value="">
                <c:param name="sort" value="desc"/>
            </c:url>
            <%--            <a class="dropdown-item" href="<c:url value="/admin/job-post" />?sort=desc">Ngày đăng mới nhất</a>--%>
            <a class="dropdown-item" href="<c:url value="${editUrl}"/>">Ngày đăng mới nhất</a>
            <a class="dropdown-item" href="<c:url value="/admin/job-post" />?sort=asc">Ngày đăng lâu nhất</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
        </div>
    </li>
</ul>

<table class="table table-striped">
    <thead>
    <tr>
        <th class="text-center" style="width: 15%">Thực thi</th>
        <th class="text-center" style="width: 5%">STT</th>
        <th class="text-center" style="width: 10%">ID</th>
        <th>Tiêu đề</th>
        <th>Ngày đăng</th>
        <th>Đăng bởi</th>
        <th>Loại việc làm</th>
        <th>Công ty</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${jobPosts}" var="jp" varStatus="loop">
        <tr>
            <td style="text-align: center">
                <a style="margin-right: 10px" href="<c:url value="/admin/job-post/view" />?id=${jp.id}"
                   title="Xem chi tiết">
                    <i class="fa-solid fa-eye"></i>
                </a>
                <a style="margin-right: 10px" href="<c:url value="/admin/job-post/add-or-update" />?id=${jp.id}"
                   title="Sửa">
                    <i class="fa-solid fa-pen"></i>
                </a>
                <a style="margin-right: 10px" href="<c:url value="/admin/job-post/delete" />?id=${jp.id}"
                   class="confirmation" title="Xoá">
                    <i class="fa-solid fa-trash"></i>
                </a>
            </td>
            <td class="text-center">${(currentPage - 1) * jobPostService.maxItemsInPage + loop.index + 1}</td>
            <td class="text-center"> #${jp.id} </td>
            <td> ${jp.title} </td>
            <td>
                <c:if test="${jp.createdDate != null}">
                    <fmt:formatDate pattern="dd/MM/yyyy" value="${jp.createdDate}"/>
                </c:if>
            </td>
            <td> ${userService.getById(jp.postedByUser.id).username} </td>
            <td> ${jobTypeService.getById(jp.jobType.id).name} </td>
            <td> ${companyService.getById(jp.company.id).name} </td>
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
    <c:forEach begin="1" end="${Math.ceil(counter/jobPostService.maxItemsInPage)}" var="page">
        <li class="page-item">
            <a class="page-link" href="<c:url value="/admin/job-post" />?page=${page}">${page}</a>
        </li>
    </c:forEach>
</ul>
