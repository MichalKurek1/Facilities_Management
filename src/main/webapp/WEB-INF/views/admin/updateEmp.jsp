<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="/resources/header/navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <title>Zmień dane</title>

</head>
<body>

<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="col-md-3 col-md-offset-3">
    <div class="table-title">Dodaj pracownika</div>
    <div class="box box-warning">
        <div class="box-body">
            <%--@elvariable id="user" type="user"--%>
            <form:form role="form" method="post" modelAttribute="user">
                <div class="form-group">
                    <label>Imię</label>
                    <form:input class="form-control" path="firstName" name="firstName"/>
                    <form:errors class="alert alert-danger" path="firstName"/>
                </div>

                <div class="form-group">
                    <label>Nazwisko</label>
                    <form:input class="form-control" path="lastName" name="lastName"/>
                    <form:errors class="alert alert-danger" path="lastName"/>
                </div>

                <div class="form-group">
                    <label>Nazwa użytkownika</label>
                    <form:input class="form-control" path="username" name="username" readonly="true"/>
                    <form:errors class="alert alert-danger" path="username"/>
                </div>

                <div class="form-group">
                    <label>Hasło</label>
                    <form:input class="form-control" type="password" path="password" name="password"/>
                    <form:errors class="alert alert-danger" path="password"/>
                </div>

                <div class="form-group">
                    <label>E-mail</label>
                    <form:input class="form-control" type="email" path="email" name="email" />
                    <form:errors class="alert alert-danger" path="email"/>
                </div>

                <div class="form-group">
                    <label>Numer</label>
                    <form:input class="form-control" type="tel" path="number" name="number"/>
                    <form:errors class="alert alert-danger" path="number"/>
                </div>

                <div>
                    <label>Lokalizacja</label>
                    <form:select class="form-control" path="location" items="${location}" itemValue="location"
                                 itemLabel="location"/>
                    <br><form:errors class="alert alert-danger" path="location"/>
                </div>

                <div>
                    <label>Stawka godzinowa</label>
                    <form:input class="form-control" type="number" path="hourRate" name="hourRate" min="1" step="0.01"/>
                    <br><form:errors class="alert alert-danger" path="hourRate"/>
                </div>
                <form:hidden  path="enabled" name="hourRate" min="1" step="0.01"/>


                <button type="submit" class="form-control btn-success">Submit</button>
            </form:form>
        </div>
    </div>
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
<script src="/resources/bower_components/moment/moment.js"></script>

</body>
</html>
