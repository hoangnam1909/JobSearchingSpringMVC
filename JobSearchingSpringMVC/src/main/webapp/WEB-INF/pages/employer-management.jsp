<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">

<h1 class="text-center dark-color">TRANG QUẢN LÝ TIN TUYỂN DỤNG</h1>

<c:if test="${jobPosts.size() == 0}">
    <div class="alert alert-danger mt-4 d-flex justify-content-center align-items-center" style="height: 80px"
         role="alert">
        <h5>Không có dữ liệu về bài viết!</h5>
    </div>
</c:if>
<c:if test="${jobPosts.size() != 0}">
    <table class="table table-striped mt-5">
        <thead>
        <tr>
            <th class="text-center" style="width: 15%"></th>
            <th class="text-center" style="width: 5%">STT</th>
            <th>Tiêu đề</th>
            <th>Ngày đăng</th>
            <th>Loại việc làm</th>
            <th>Công ty</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${jobPosts}" var="jp" varStatus="loop">
            <tr>
                <td style="text-align: center">
                    <a style="margin-right: 10px" href="<c:url value="/employer/post/view" />?id=${jp.id}"
                       title="Xem chi tiết">
                        <i class="fa-solid fa-eye"></i>
                    </a>
                    <a style="margin-right: 10px"
                       href="<c:url value="/employer/post/add-or-update" />?id=${jp.id}"
                       title="Sửa">
                        <i class="fa-solid fa-pen"></i>
                    </a>
                    <a style="margin-right: 10px" href="<c:url value="/employer/post/delete" />?id=${jp.id}"
                       class="confirmation" title="Xoá">
                        <i class="fa-solid fa-trash"></i>
                    </a>
                </td>
                <td class="text-center">${(currentPage - 1) * jobTypeService.maxItemsInPage + loop.index + 1}</td>
                <td> ${jp.title} </td>
                <td>
                    <c:if test="${jp.createdDate != null}">
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${jp.createdDate}"/>
                    </c:if>
                </td>
                <td> ${jobTypeService.getById(jp.jobType.id).name} </td>
                <td> ${employerService.getByUserId(jp.postedByUser.id).name} </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <ul class="pagination d-flex justify-content-center mt-2 mx-auto">
        <c:forEach begin="1" end="${Math.ceil(counter/jobPostService.maxItemsInPage)}" var="page">
            <li class="page-item">
                <a class="page-link" href="${url}?page=${page}">${page}</a>
            </li>
        </c:forEach>
    </ul>
</c:if>
</div>
