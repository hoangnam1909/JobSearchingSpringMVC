<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:if test="${jobPost.id == 0}">
    <h1 class="text-center text-success">THÊM TÀI BÀI VIẾT</h1>
</c:if>
<c:if test="${jobPost.id > 0}">
    <h1 class="text-center text-success">CHỈNH SỬA THÔNG TIN BÀI VIẾT #${jobPost.id}</h1>
</c:if>

<c:url value="/admin/job-post/add-or-edit" var="action"/>

<form:form action="${action}" method="post" modelAttribute="jobPost">
    <div class="form-group" style="display: none">
        <form:input path="id" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Tiêu đề</label>
        <form:input path="title" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Mô tả</label>
        <form:input path="description" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Lương tối thiểu</label>
        <form:input id="currency" path="beginningSalary" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Lương tối đa</label>
        <form:input id="currency" path="endingSalary" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Địa chỉ</label>
        <form:input path="location" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Ngày đăng</label>
        <form:input type="date" path="createdDateStr" value="${jobPost.createdDate}" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Ngày hết hạn</label>
        <form:input type="date" path="expiredDateStr" value="${jobPost.expiredDate}" class="form-control"/>
    </div>
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

    <div class="form-group">
        <label>Loại công việc</label>
        <form:select path="jobTypeId" class="custom-select">
            <c:forEach items="${jobTypes}" var="jobType">
                <c:if test="${jobType.id == jobPost.jobType.id}">
                    <option value="${jobType.id}" selected>${jobType.name}</option>
                </c:if>

                <c:if test="${jobType.id != jobPost.jobType.id}">
                    <option value="${jobType.id}">${jobType.name}</option>
                </c:if>
            </c:forEach>
        </form:select>
    </div>

    <div class="form-group">
        <label>Công ty</label>
        <form:select path="companyId" class="custom-select">
            <c:forEach items="${companies}" var="company">
                <c:if test="${company.id == jobPost.company.id}">
                    <option value="${company.id}" selected>${company.name}</option>
                </c:if>

                <c:if test="${company.id != jobPost.company.id}">
                    <option value="${company.id}">${company.name}</option>
                </c:if>
            </c:forEach>
        </form:select>
    </div>
    <div class="form-group">
        <button type="submit" name="submit" value="submit" class="btn btn-primary">Thêm</button>
    </div>
</form:form>
