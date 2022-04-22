<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/job-post/add"/>">Thêm</a>
    </li>
</ul>

<table class="table table-striped">
    <thead>
    <tr>
        <th></th>
        <th>Tiêu đề</th>
        <th>Ngày đăng</th>
        <th>Khả dụng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${jobPosts}" var="jp">
        <tr>
            <td style="text-align: center">
                <a style="margin-right: 10px" href="/JobSearch/admin/job-post/edit/${jp.id}" data-toggle="tooltip"
                   title="Sửa">
                    <i class="fa-solid fa-pen"></i>
                </a>
                <a href="/JobSearch/admin/job-post/delete/${jp.id}" data-toggle="tooltip" title="Xoá">
                    <i class="fa-solid fa-trash"></i>
                </a>
            </td>
            <td>${jp.title}</td>
            <td>
            <c:catch var="ex">
                <fmt:formatDate value="${jp.createdDate}" pattern="HH:mm:ss dd-MM-yyyy"/>
            </c:catch>
            </td>
            <td>${jp.active}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
