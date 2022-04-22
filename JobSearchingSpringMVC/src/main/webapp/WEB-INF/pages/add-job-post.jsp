<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-success">THÊM BÀI VIẾT</h1>
<h3 class="text-center text-success">${title}</h3>
<h3 class="text-center text-success">${description}</h3>
<h3 class="text-center text-success">${postByUserId}</h3>
<h3 class="text-center text-success">${jobTypeId}</h3>
<h3 class="text-center text-success">${companyId}</h3>

<c:url value="/admin/job-post/add" var="action"/>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
            ${errMsg}
    </div>
</c:if>

<form:form action="${action}" method="post" modelAttribute="jobPost">
    <div class="form-group">
        <label>Tiêu đề</label>
        <form:input path="title" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Mô tả</label>
        <form:input path="description" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Đăng bởi người dùng</label>
        <form:select path="postedByUserId" class="custom-select">
            <c:forEach items="${users}" var="user">
                <form:option value="${user.id}" label="${user.username}"/>
            </c:forEach>
        </form:select>
    </div>
    <div class="form-group">
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
        <button type="submit" class="btn btn-primary">Thêm</button>
    </div>
</form:form>
