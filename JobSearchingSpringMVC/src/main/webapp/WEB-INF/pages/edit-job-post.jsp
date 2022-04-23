<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-success">CHỈNH SỬA THÔNG TIN BÀI ĐĂNG</h1>

<c:url value="/admin/job-post/edit" var="action"/>

<form:form action="${action}" method="post" modelAttribute="jobPost">
    <div class="form-group" style="display: none">
        <form:input path="id" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Tên</label>
        <form:input path="title" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Mô tả</label>
        <form:input path="description" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Lương tối thiểu</label>
        <form:input path="beginningSalary" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Lương tối đa</label>
        <form:input path="endingSalary" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Địa chỉ</label>
        <form:input path="location" class="form-control"/>
    </div>
    <%--    <div class="form-group">--%>
    <%--        <label>Ngày tạo</label>--%>
    <%--        <form:input type="date" path="createdDate" class="form-control"/>--%>
    <%--    </div>--%>
    <%--    <div class="form-group">--%>
    <%--        <label>Ngày hết hạn</label>--%>
    <%--        <form:input type="date" path="expiredDate" class="form-control"/>--%>
    <%--    </div>--%>
    <div class="form-group">
        <label>Đăng bởi người dùng</label>
        <form:select path="postedByUserId" class="custom-select">
            <c:forEach items="${users}" var="user">
                <c:if test="${user.id == jobPost.postedByUser.id}">
                    <option value="${user.id}" selected>${user.username}</option>
                </c:if>

                <c:if test="${user.id != jobPost.postedByUser.id}">
                    <option value="${user.id}">${user.username}</option>
                </c:if>
            </c:forEach>
        </form:select>
    </div>
    <div class=" form-group
        ">
        <label>Loại công việc</label>
        <form:select path="jobTypeId" class="custom-select">
            <c:forEach items="${jobTypes}" var="jobType">
                <form:option value="${jobType.id}" label="${jobType.name}"/>
            </c:forEach>
        </form:select>
    </div>
    <div class="form-group">
        <label>Công ty</label>
        <form:select path="companyId" class="custom-select">
            <c:forEach items="${companies}" var="company">
                <form:option value="${company.id}" label="${company.name}"/>
            </c:forEach>
        </form:select>
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-primary">Chỉnh sửa</button>
    </div>
</form:form>
