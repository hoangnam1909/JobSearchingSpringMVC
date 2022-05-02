<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 class="text-center text-success">TRANG CHỦ NHÀ TUYỂN DỤNG</h1>

<div class="row mt-5">
    <div class="col-2 py-3" style="background-color: #f1f1f1">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/employer/job-post/add-or-update"/>">Thêm</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                   aria-expanded="false">Sắp xếp</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="<c:url value="/employer/job-post" />?sort=desc">Ngày đăng mới nhất</a>
                    <a class="dropdown-item" href="<c:url value="/employer/job-post" />?sort=asc">Ngày đăng lâu nhất</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Separated link</a>
                </div>
            </li>
        </ul>
    </div>
    <div class="col-10">
        <table class="table table-striped">
            <thead>
            <tr>
                <th class="text-center" style="width: 15%">Thực thi</th>
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
                        <a style="margin-right: 10px" href="<c:url value="/employer/job-post/view" />?id=${jp.id}"
                           title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a style="margin-right: 10px" href="<c:url value="/employer/job-post/add-or-update" />?id=${jp.id}"
                           title="Sửa">
                            <i class="fa-solid fa-pen"></i>
                        </a>
                        <a style="margin-right: 10px" href="<c:url value="/employer/job-post/delete" />?id=${jp.id}"
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
                    <td> ${companyService.getById(jp.company.id).name} </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>