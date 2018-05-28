<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="/resources/header/navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <title>Lista pracowników</title>
</head>


<body>

<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="table-title">UŻYTKOWNICY AKTYWNI</div>
<div class="table-responsive">
    <table class="table table-hover">
        <thead class="table-thead">
        <tr>
            <th>Użytkownik</th>
            <th>Imię</th>
            <th>Nazwisko</th>
            <th>Email</th>
            <th>Telefon</th>
            <th>Lokalizacja</th>
            <th>Stawka godzinowa</th>
            <th colspan="2">Akcje</th>
        </tr>
        </thead>

        <tbody>
        <%--@elvariable id="user" type="pl.coderslab.model.User"--%>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.userName}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.email}</td>
                <td>${user.number}</td>
                <td>${user.location}</td>
                <td>${user.hourRate}</td>
                <td><a href="/admin/update/${user.username}/">Popraw</a></td>
                <td><a href="/admin/delete/${user.username}/">Unieważnij dostęp</a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<div class="table-title">UŻYTKOWNICY NIEAKTYWNI</div>
<div class="table-responsive">
    <table class="table table-hover">
        <thead class="table-thead">
        <tr>
            <th>Użytkownik</th>
            <th>Imię</th>
            <th>Nazwisko</th>
            <th>Email</th>
            <th>Telefon</th>
            <th>Lokalizacja</th>
            <th colspan="2">Akcje</th>
        </tr>
        </thead>
        <tbody>
        <%--@elvariable id="user" type="pl.coderslab.model.User"--%>
        <c:forEach items="${disactiveUsers}" var="user">
            <tr>
                <td>${user.userName}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.email}</td>
                <td>${user.number}</td>
                <td>${user.location}</td>
                <td><a href="/admin/update/${user.username}/">Popraw</a></td>
                <td><a href="/admin/getback/${user.username}/">Przywróć dostęp</a></td>
            </tr>

        </c:forEach>

        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="/resources/bower_components/moment/moment.js"/>


</body>
</html>
