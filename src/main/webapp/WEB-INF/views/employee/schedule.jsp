<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="/resources/header/navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

    <title>Grafik</title>

</head>

<body>

<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="container col-lg-10">


    <button type="button" class="btn btn-success " id="lewy">&laquo;</button>
    <span id="current"></span>
    <button type="button" class="btn btn-success " id="prawy">&raquo;</button>

    <div class="table-title">Grafik dla użytkownika</div>

    <%--@elvariable id="schedule" type="pl.coderslab.arenaboot.model.Proposition"--%>
    <table class="table table-hover table-responsive">
        <thead class="table-thead">

        <tr>
            <td>Użytkownik</td>
            <td colspan="2">Pon. ${schedule.pon}</td>
            <td colspan="2">Wt. ${schedule.wt}</td>
            <td colspan="2">Śr. ${schedule.sr}</td>
            <td colspan="2">Czw. ${schedule.czw}</td>
            <td colspan="2">Pt. ${schedule.pt}</td>
            <td colspan="2">Sb. ${schedule.sb}</td>
            <td colspan="2">Nd. ${schedule.nd}</td>
            <td>Liczba godz<br></td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${schedule.user.username}</td>
            <td colspan="2">${schedule.ponStartFinal} - ${schedule.ponEndFinal}</td>
            <td colspan="2">${schedule.wtStartFinal} - ${schedule.wtEndFinal}</td>
            <td colspan="2">${schedule.srStartFinal} - ${schedule.srEndFinal}</td>
            <td colspan="2">${schedule.czwStartFinal} - ${schedule.czwEndFinal}</td>
            <td colspan="2">${schedule.ptStartFinal} - ${schedule.ptEndFinal}</td>
            <td colspan="2">${schedule.sbStartFinal} - ${schedule.sbEndFinal}</td>
            <td colspan="2">${schedule.ndStartFinal} - ${schedule.ndEndFinal}</td>
            <td>${schedule.weekHours}</td>
        </tr>

        </tbody>

    </table>

    <div class="table-title">Grafik dla obiektu</div>
    <%--@elvariable id="scheduleLocation" type="pl.coderslab.arenaboot.model.Proposition"--%>
    <table class="table table-hover table-responsive">
        <thead class="table-thead">

        <tr>
            <td>Użytkownik</td>
            <td colspan="2">Pon. ${schedule.pon}</td>
            <td colspan="2">Wt. ${schedule.wt}</td>
            <td colspan="2">Śr. ${schedule.sr}</td>
            <td colspan="2">Czw. ${schedule.czw}</td>
            <td colspan="2">Pt. ${schedule.pt}</td>
            <td colspan="2">Sb. ${schedule.sb}</td>
            <td colspan="2">Nd. ${schedule.nd}</td>
            <td>Liczba godz<br></td>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${scheduleLocation}" var="scheduleLocation" varStatus="vs">

            <tr>
                <td>${scheduleLocation.user.username}</td>
                <td colspan="2">${scheduleLocation.ponStartFinal} - ${scheduleLocation.ponEndFinal}</td>
                <td colspan="2">${scheduleLocation.wtStartFinal} - ${scheduleLocation.wtEndFinal}</td>
                <td colspan="2">${scheduleLocation.srStartFinal} - ${scheduleLocation.srEndFinal}</td>
                <td colspan="2">${scheduleLocation.czwStartFinal} - ${scheduleLocation.czwEndFinal}</td>
                <td colspan="2">${scheduleLocation.ptStartFinal} - ${scheduleLocation.ptEndFinal}</td>
                <td colspan="2">${scheduleLocation.sbStartFinal} - ${scheduleLocation.sbEndFinal}</td>
                <td colspan="2">${scheduleLocation.ndStartFinal} - ${scheduleLocation.ndEndFinal}</td>
                <td>${scheduleLocation.weekHours}</td>
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
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="/resources/bower_components/moment/moment.js"></script>

<script>

    $(function () {


        var current = $('#current');

        function getParameterByName() {
            var url = window.location.href;
            var name = url.split("T");
            if (name !== null) {
                return name[1];
            }
        }

        var param = getParameterByName();

        if (typeof param == "undefined") {
            var week = moment().week();
            // current.text(day);
        } else {
            var week = param;
        }
        var year = moment().year();
        var path = year + "T" + week;

        current.text(path);

        var btns1 = $('#lewy');
        var btns2 = $('#prawy');


        btns1.on('click', function () {
            var name = current.text().split("T");

            if (parseInt(name[1]) > 1) {
                var kill = parseInt(name[1]) - 1;
                current.text(year + "T" + kill)
                window.location.href = '/employee/schedule/week=' + current.text();
            }
        });

        btns2.on('click', function () {
            var name = current.text().split("T");

            if (parseInt(name[1]) <= 53) {
                var kill = parseInt(name[1]) + 1;
                current.text(year + "T" + kill);
                window.location.href = '/employee/schedule/week=' + current.text();
            }
        });

        var pon = $('#pon');
        var wt = $('#wt');
        var sr = $('#sr');
        var czw = $('#czw');
        var pt = $('#pt');
        var sb = $('#sb');
        var nd = $('#nd');

        var pon1 = $('.pon');
        var wt1 = $('.wt');
        var sr1 = $('.sr');
        var czw1 = $('.czw');
        var pt1 = $('.pt');
        var sb1 = $('.sb');
        var nd1 = $('.nd');

        pon.val(moment(moment().week(week).day(1)).format("DD-MM-YYYY"));
        wt.val(moment(moment().week(week).day(2)).format("DD-MM-YYYY"));
        sr.val(moment(moment().week(week).day(3)).format("DD-MM-YYYY"));
        czw.val(moment(moment().week(week).day(4)).format("DD-MM-YYYY"));
        pt.val(moment(moment().week(week).day(5)).format("DD-MM-YYYY"));
        sb.val(moment(moment().week(week).day(6)).format("DD-MM-YYYY"));
        nd.val(moment(moment().week(week).day(7)).format("DD-MM-YYYY"));
        nd1.text(moment(moment().week(week).day(0)).format("DD-MM-YYYY"));
        pon1.val(moment(moment().week(week).day(1)).format("DD-MM-YYYY"));
        wt1.val(moment(moment().week(week).day(2)).format("DD-MM-YYYY"));
        sr1.val(moment(moment().week(week).day(3)).format("DD-MM-YYYY"));
        czw1.val(moment(moment().week(week).day(4)).format("DD-MM-YYYY"));
        pt1.val(moment(moment().week(week).day(5)).format("DD-MM-YYYY"));
        sb1.val(moment(moment().week(week).day(6)).format("DD-MM-YYYY"));
        nd1.val(moment(moment().week(week).day(7)).format("DD-MM-YYYY"));
    })

</script>
</body>
</html>
