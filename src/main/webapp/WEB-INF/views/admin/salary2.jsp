<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="/resources/header/navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <title>Suma przepracowanych godz</title>

</head>

<body>

<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="container col-12">


    <form method="post">
        <input type="month" name="month">
        <select name="location">
            <c:forEach items="${locationList}" var="locationList">
                <option>${locationList.location}</option>
            </c:forEach>
        </select>
        <input type="submit" class="btn-success" value="Generuj raport">
    </form>


    <table class="table table-bordered table-salary" id="printTable">
        <%--@elvariable id="proposition" type="pl.coderslab.arenaboot.model.Proposition"--%>
        <c:forEach items="${list}" var="item" varStatus="vs">

            <thead class="table-thead">
            <tr>
                <th scope="col">Użytkownik</th>
                <th scope="col">Tydzień</th>
                <th scope="col" colspan="7">DNI</th>
                <th scope="col">Godziny</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${month}" var="month" varStatus="index">
                <c:if test="${item == month.user.username}">

                    <tr scope="row">
                        <td rowspan="2" class="table-title">${month.user.username}</td>
                        <td rowspan="2" class="table-title">${month.week}</td>
                        <td class="schedule-line">${month.pon}</td>
                        <td class="schedule-line">${month.wt}</td>
                        <td class="schedule-line">${month.sr}</td>
                        <td class="schedule-line">${month.czw}</td>
                        <td class="schedule-line">${month.pt}</td>
                        <td class="schedule-line">${month.sb}</td>
                        <td class="schedule-line">${month.nd}</td>
                        <td rowspan="2" class="table-title"
                            id="${month.user.username}${month.week}">${month.weekHours}</td>
                    </tr>

                    <tr>
                        <td>${month.ponStartFinal}-${month.ponEndFinal}</td>
                        <td>${month.wtStartFinal}-${month.wtEndFinal}</td>
                        <td>${month.srStartFinal}-${month.srEndFinal}</td>
                        <td>${month.czwStartFinal}-${month.czwEndFinal}</td>
                        <td>${month.ptStartFinal}-${month.ptEndFinal}</td>
                        <td>${month.sbStartFinal}-${month.sbEndFinal}</td>
                        <td>${month.ndStartFinal}-${month.ndEndFinal}</td>
                    </tr>

                </c:if>
            </c:forEach>
            <tr>
                <td colspan="9"></td>
                <td id="${item}"></td>
            </tr>
            </tbody>
        </c:forEach>

    </table>
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<script>

    $(function () {

        <%--@elvariable id="proposition" type="pl.coderslab.arenaboot.model.Proposition"--%>
        <c:forEach items="${list}" var="item" varStatus="vs">

        var user = $('#${item}');
        console.log(user)
        var sum =0;
        var rate = 0;
        var result =0;
        <c:forEach items="${month}" var="month" varStatus="index">
        <c:if test="${item == month.user.username}">
        var hoursString = $('#${month.user.username}${month.week}').text();
        console.log(hoursString)

        var hoursFloat = parseFloat(hoursString);
        sum += hoursFloat;
        rate = ${month.user.hourRate};
        result = sum*rate;
        </c:if>
        </c:forEach>
        user.text(sum+" x "+rate+" = "+ result+"zł");
        </c:forEach>

    })

</script>

</body>
</html>
