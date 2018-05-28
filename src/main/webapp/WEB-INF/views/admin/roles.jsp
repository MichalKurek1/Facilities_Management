<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="/resources/header/navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <title>Role</title>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="table-responsive col-lg-4">
    <table class="table table-hover">
        <thead class="table-thead">
        <tr>
            <th>UŻYTKOWNIK</th>
            <th>ROLA</th>
        </tr>
        </thead>
        <tbody>
        <%--@elvariable id="list" type="pl.coderslab.model.UserRole"--%>
        <form:form method="post" modelAttribute="list">
            <c:forEach items="${list.userRoleList}" varStatus="vs">
                <tr>
                    <td><form:input path="userRoleList[${vs.index}].username"
                                     name="userRoleList[${vs.index}].username" readonly="true"/>
                    </td>
                    <td><form:select path="userRoleList[${vs.index}].authority"
                                    name="userRoleList[${vs.index}].authority" items="${roles}"/></td>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <button type="submit" class="btn btn-success btn-lg btn-block">Submit</button>
    </form:form>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="/resources/bower_components/moment/moment.js"/>

</body>
</html>
