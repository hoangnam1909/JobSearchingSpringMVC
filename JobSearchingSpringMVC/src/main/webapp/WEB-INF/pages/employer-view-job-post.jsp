<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 class="text-center text-success">THÔNG TIN BÀI ĐĂNG</h1>

<div class="row">
    <div class="col-8">col-8</div>
    <div class="col-4">
        <div class="row">
            <dt class="col-sm-3 text-right">col1</dt>
            <dd class="col-sm-9 text-left">col2</dd>
        </div>
    </div>
</div>

<div class="container mt-4">
    <table class="table table-striped">
        <tbody>
        <tr>
            <th style="width: 30%" scope="row">ID</th>
            <td class="border-left">${jobPost.id}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Tiêu đề</th>
            <td class="border-left">${jobPost.title}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Mô tả</th>
            <td class="border-left">${jobPost.description}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Lương tối thiểu</th>
            <td class="border-left">${jobPost.beginningSalary}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Lương tối đa</th>
            <td class="border-left">${jobPost.endingSalary}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Địa điểm làm việc</th>
            <td class="border-left">${jobPost.location}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Ngày đăng</th>
            <td class="border-left">
                <fmt:formatDate pattern="dd/MM/yyyy" value="${jobPost.createdDate}"/>
            </td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Ngày hết hạn</th>
            <td class="border-left">
                <fmt:formatDate pattern="dd/MM/yyyy" value="${jobPost.expiredDate}"/>
            </td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Tài khoản đăng bài</th>
            <td class="border-left">${userService.getById(jobPost.postedByUser.id).username}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Loại công việc</th>
            <td class="border-left">${jobTypeService.getById(jobPost.jobType.id).name}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Công ty</th>
            <td class="border-left">${companyService.getById(jobPost.company.id).name}</td>
        </tr>
        </tbody>
    </table>
</div>
