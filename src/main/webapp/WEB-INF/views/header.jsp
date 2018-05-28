<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <a class="navbar-brand">Nazwa firmy</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04"
            aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExample04">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
            </li>
            <sec:authorize access="hasRole('USER')">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">Pracownik</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="/employee/add">Podaj dyspozycyjność</a>
                        <a class="dropdown-item" href="/employee/schedule">Grafik</a>
                    </div>
                </li>
            </sec:authorize>

            <sec:authorize access="hasRole('MANAGER')">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">Manager</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="/man/createSchedule">Stwórz grafik</a>
                        <a class="dropdown-item" href="/man/all">Lista pracowników</a>
                        <a class="dropdown-item" href="/man/addEmployee">Dodaj pracownika</a>
                        <a class="dropdown-item" href="/man/salary">Lista płac</a>
                    </div>
                </li>
            </sec:authorize>

            <sec:authorize access="hasAnyRole('USER', 'MANAGER')">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">Rezerwacje</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="">Dodaj</a>
                        <a class="dropdown-item" href="">Sprawdź</a>

                    </div>
                </li>
            </sec:authorize>

            <sec:authorize access="hasRole('ADMIN')">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">Admin</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="/admin/all">Lista użytkowników</a>
                        <a class="dropdown-item" href="/admin/roles">Role użytkowników</a>
                        <a class="dropdown-item" href="/admin/salary">List płac</a>
                    </div>
                </li>
            </sec:authorize>

            <li class="nav-item active">
                <a class="nav-link" href="/logout">Wyloguj<span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>


</nav>