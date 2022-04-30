<%--
  Created by IntelliJ IDEA.
  User: Lightning
  Date: 10/04/2022
  Time: 3:19 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 class="text-center text-success">THÔNG TIN CÔNG TY</h1>
<div class="container mt-4">
    <table class="table table-striped">
        <tbody>
        <tr>
            <th style="width: 30%" scope="row">ID</th>
            <td class="border-left">${company.id}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Tên công ty</th>
            <td class="border-left">${company.name}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Mô tả</th>
            <td class="border-left">${company.description}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Địa điểm</th>
            <td class="border-left">${company.location}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Liên hệ</th>
            <td class="border-left">${company.contact}</td>
        </tr>
        <tr>
            <th style="width: 30%" scope="row">Trang web</th>
            <td class="border-left">${company.website}</td>
        </tr>
        </tbody>
    </table>
</div>
