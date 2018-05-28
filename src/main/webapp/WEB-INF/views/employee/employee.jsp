<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="/resources/header/navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <title>Podaj swoją dostępność</title>

</head>
<body>

<%@ include file="/WEB-INF/views/header.jsp" %>


<%--@elvariable id="proposition" type="pl.coderslab.model.Proposition"--%>

<c:choose>
    <c:when test="${proposition.week==null}">
        <div class="box col-lg-6">
            <div class="box-body">
                <table class="table table-bordered" id="timesheet">
                    <form:form method="post" modelAttribute="proposition">
                    <thead>
                    <div class="col-lg-6">
                        <tr>
                            <td>
                                <span class="box-title head-date-in">TYDZIEŃ</span>
                            </td>
                            <td>
                                <span class="box-title head-date-in">UŻYTKOWNIK</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form:input id="weeknum" path="week" value="" readonly="true" class="form-control"/>
                                <form:errors class="alert alert-danger" path="nd"/>

                            </td>
                            <td>
                                <form:input path="user" value="${user.username}" class="form-control" readonly="true"/>
                                <form:errors class="alert alert-danger" path="user"/>
                            </td>
                            <td>
                                <button type="button" class="btn btn-success btn-arrow-left" id="lewy">&laquo;</button>
                                <span>   </span>
                                <button type="button" class="btn btn-success btn-arrow-right" id="prawy">&raquo;</button>
                            </td>
                        </tr>
                    </div>
                    </thead>
                    <thead>
                    <tr>
                        <th>DATA</th>
                        <th>DZIEŃ</th>
                        <th>POCZĄTEK</th>
                        <th>KONIEC</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <form:input path="pon" value="" readonly="true" id="pon" class="form-control"/>
                            <form:errors class="alert alert-danger" path="pon"/>
                        </td>
                        <td>Pon.</td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="ponStart"
                                        name="ponStart"/>
                            <form:errors class="alert alert-danger" path="ponStart"/>
                        </td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="ponEnd"
                                        name="ponEnd"/>
                            <form:errors class="alert alert-danger" path="ponEnd"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:input path="wt" value="" readonly="true" id="wt" class="form-control"/>
                            <form:errors class="alert alert-danger" path="wt"/>
                        </td>

                        <td>Wt.</td>

                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="wtStart"/>
                            <form:errors class="alert alert-danger" path="wtStart"/>
                        </td>

                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="wtEnd"/>
                            <form:errors class="alert alert-danger" path="wtEnd"/>
                        </td>

                    </tr>

                    <tr>
                        <td>
                            <form:input path="sr" value="" readonly="true" id="sr" class="form-control"/>
                            <form:errors class="alert alert-danger" path="sr"/>
                        </td>

                        <td>Śr.</td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="srStart"/>
                            <form:errors class="alert alert-danger" path="srStart"/>
                        </td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="srEnd"/>
                            <form:errors class="alert alert-danger" path="srEnd"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:input path="czw" value="" readonly="true" id="czw" class="form-control"/>
                            <form:errors class="alert alert-danger" path="czw"/>
                        </td>
                        <td>Czw.</td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="czwStart"/>
                            <form:errors class="alert alert-danger" path="czwStart"/>
                        </td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="czwEnd"/>
                            <form:errors class="alert alert-danger" path="czwEnd"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:input path="pt" value="" readonly="true" id="pt" class="form-control"/>
                            <form:errors class="alert alert-danger" path="pt"/>
                        </td>
                        <td>Pt.</td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="ptStart"/>
                            <form:errors class="alert alert-danger" path="ptStart"/>
                        </td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="ptEnd"/>
                            <form:errors class="alert alert-danger" path="ptEnd"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:input path="sb" value="" readonly="true" id="sb" class="form-control"/>
                            <form:errors class="alert alert-danger" path="sb"/>
                        </td>
                        <td>Sb.</td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="sbStart"/>
                            <form:errors class="alert alert-danger" path="sbStart"/>
                        </td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="sbEnd"/>
                            <form:errors class="alert alert-danger" path="sbEnd"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:input path="nd" value="" readonly="true" id="nd" class="form-control"/>
                            <form:errors class="alert alert-danger" path="nd"/>
                        </td>

                        <td>Nd.</td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="ndStart"/>
                            <form:errors class="alert alert-danger" path="ndStart"/>
                        </td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="ndEnd"/>
                            <form:errors class="alert alert-danger" path="ndEnd"/>
                        </td>
                    </tr>

                    </thead>
                </table>
                <button type="submit" class="form-control btn-success">Submit</button>
                </form:form>


            </div>

        </div>

    </c:when>
    <c:otherwise>

        <div class="box col-lg-6">
            <div class="box-body">
                <table class="table table-bordered" id="timesheet">
                    <form:form method="post" modelAttribute="proposition">
                    <thead>
                    <div class="col-lg-6">
                        <tr>
                            <td>
                                <span class="box-title head-date-in">TYDZIEŃ</span>
                            </td>
                            <td>
                                <span class="box-title head-date-in">UŻYTKOWNIK</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form:hidden path="id" name="id"/>
                                <form:input id="weeknum" path="week" value="" readonly="true" class="form-control"/>
                                <form:errors class="alert alert-danger" path="week"/>

                            </td>
                            <td>
                                <form:input path="user" value="${user.username}" class="form-control" readonly="true"/>
                                <form:errors class="alert alert-danger" path="user"/>
                            </td>
                            <td>
                                <button type="button" class="btn btn-success btn-arrow-left" id="lewy">&laquo;</button>
                                <span>   </span>
                                <button type="button" class="btn btn-success btn-arrow-right" id="prawy">&raquo;</button>
                            </td>
                        </tr>
                    </div>
                    </thead>
                    <thead>
                    <tr>
                        <th>DATA</th>
                        <th>DZIEŃ</th>
                        <th>POCZĄTEK</th>
                        <th>KONIEC</th>
                    </tr>
                    </thead>
                    <tr>
                        <td>
                            <form:input path="pon" value="" readonly="true" id="pon" class="form-control"/>
                            <form:errors class="alert alert-danger" path="pon"/>
                        </td>
                        <td>Pon.</td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="ponStart"
                                        name="ponStart"/>
                            <form:errors class="alert alert-danger" path="ponStart"/>
                        </td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="ponEnd"
                                        name="ponEnd"/>
                            <form:errors class="alert alert-danger" path="ponEnd"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:input path="wt" value="" readonly="true" id="wt" class="form-control"/>
                            <form:errors class="alert alert-danger" path="wt"/>
                        </td>

                        <td>Wt.</td>

                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="wtStart"/>
                            <form:errors class="alert alert-danger" path="wtStart"/>
                        </td>

                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="wtEnd"/>
                            <form:errors class="alert alert-danger" path="wtEnd"/>
                        </td>

                    </tr>

                    <tr>
                        <td>
                            <form:input path="sr" value="" readonly="true" id="sr" class="form-control"/>
                            <form:errors class="alert alert-danger" path="sr"/>
                        </td>

                        <td>Śr.</td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="srStart"/>
                            <form:errors class="alert alert-danger" path="srStart"/>
                        </td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="srEnd"/>
                            <form:errors class="alert alert-danger" path="srEnd"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:input path="czw" value="" readonly="true" id="czw" class="form-control"/>
                            <form:errors class="alert alert-danger" path="czw"/>
                        </td>
                        <td>Czw.</td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="czwStart"/>
                            <form:errors class="alert alert-danger" path="czwStart"/>
                        </td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="czwEnd"/>
                            <form:errors class="alert alert-danger" path="czwEnd"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:input path="pt" value="" readonly="true" id="pt" class="form-control"/>
                            <form:errors class="alert alert-danger" path="pt"/>
                        </td>
                        <td>Pt.</td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="ptStart"/>
                            <form:errors class="alert alert-danger" path="ptStart"/>
                        </td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="ptEnd"/>
                            <form:errors class="alert alert-danger" path="ptEnd"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:input path="sb" value="" readonly="true" id="sb" class="form-control"/>
                            <form:errors class="alert alert-danger" path="sb"/>
                        </td>
                        <td>Sb.</td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="sbStart"/>
                            <form:errors class="alert alert-danger" path="sbStart"/>
                        </td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="sbEnd"/>
                            <form:errors class="alert alert-danger" path="sbEnd"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:input path="nd" name="nd" readonly="true" id="nd" class="form-control"/>
                            <form:errors class="alert alert-danger" path="nd"/>
                        </td>

                        <td>Nd.</td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="ndStart"/>
                            <form:errors class="alert alert-danger" path="ndStart"/>
                        </td>
                        <td>
                            <form:input type="time" class="form-control timepicker" step="1800" path="ndEnd"/>
                            <form:errors class="alert alert-danger" path="ndEnd"/>
                        </td>
                    </tr>

                    <form:hidden path="ponStartFinal" name="ponStartFinal"/>
                    <form:hidden path="ponEndFinal" name="ponEndFinal"/>
                    <form:hidden path="wtStartFinal" name="wtStartFinal"/>
                    <form:hidden path="wtEndFinal" name="wtEndFinal"/>
                    <form:hidden path="srStartFinal" name="srStartFinal"/>
                    <form:hidden path="srEndFinal" name="srEndFinal"/>
                    <form:hidden path="czwStartFinal" name="czwStartFinal"/>
                    <form:hidden path="czwEndFinal" name="czwEndFinal"/>
                    <form:hidden path="ptStartFinal" name="ptStartFinal"/>
                    <form:hidden path="ptEndFinal" name="ptEndFinal"/>
                    <form:hidden path="sbStartFinal" name="sbStartFinal"/>
                    <form:hidden path="sbEndFinal" name="sbEndFinal"/>
                    <form:hidden path="ndStartFinal" name="ndStartFinal"/>
                    <form:hidden path="ndEndFinal" name="ndEndFinal"/>


                    </tbody>
                </table>

                <button type="submit" class="form-control btn-success">Submit</button>
                </form:form>

            </div>

        </div>
    </c:otherwise>
</c:choose>

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

        var weeknum = $('#weeknum');


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

        weeknum.val(path);


        var btns1 = $('#lewy');
        var btns2 = $('#prawy');
        var pon = $('#pon');
        var wt = $('#wt');
        var sr = $('#sr');
        var czw = $('#czw');
        var pt = $('#pt');
        var sb = $('#sb');
        var nd = $('#nd');


        var kill = parseInt(week);
        pon.val(moment(moment().week(kill).day(1)).format("DD-MM-YYYY"));
        wt.val(moment(moment().week(kill).day(2)).format("DD-MM-YYYY"));
        sr.val(moment(moment().week(kill).day(3)).format("DD-MM-YYYY"));
        czw.val(moment(moment().week(kill).day(4)).format("DD-MM-YYYY"));
        pt.val(moment(moment().week(kill).day(5)).format("DD-MM-YYYY"));
        sb.val(moment(moment().week(kill).day(6)).format("DD-MM-YYYY"));
        nd.val(moment(moment().week(kill).day(7)).format("DD-MM-YYYY"));


        btns1.on('click', function () {

            var name = weeknum.val().split("T");

            if (parseInt(name[1]) > 1) {


                var kill = parseInt(name[1]) - 1;
                weeknum.val(year + "T" + kill);

                pon.val(moment(moment().week(kill).day(1)).format("DD-MM-YYYY"));
                wt.val(moment(moment().week(kill).day(2)).format("DD-MM-YYYY"));
                sr.val(moment(moment().week(kill).day(3)).format("DD-MM-YYYY"));
                czw.val(moment(moment().week(kill).day(4)).format("DD-MM-YYYY"));
                pt.val(moment(moment().week(kill).day(5)).format("DD-MM-YYYY"));
                sb.val(moment(moment().week(kill).day(6)).format("DD-MM-YYYY"));
                nd.val(moment(moment().week(kill).day(7)).format("DD-MM-YYYY"));

                window.location.href = '/employee/add/week=' + year + "T" + kill;
            }
        });

        btns2.on('click', function () {

            var name = weeknum.val().split("T");

            if (parseInt(name[1]) < 53) {
                var kill = parseInt(name[1]) + 1;
                weeknum.val(year + "T" + kill);

                pon.val(moment(moment().week(kill).day(1)).format("DD-MM-YYYY"));
                wt.val(moment(moment().week(kill).day(2)).format("DD-MM-YYYY"));
                sr.val(moment(moment().week(kill).day(3)).format("DD-MM-YYYY"));
                czw.val(moment(moment().week(kill).day(4)).format("DD-MM-YYYY"));
                pt.val(moment(moment().week(kill).day(5)).format("DD-MM-YYYY"));
                sb.val(moment(moment().week(kill).day(6)).format("DD-MM-YYYY"));
                nd.val(moment(moment().week(kill).day(7)).format("DD-MM-YYYY"));

                window.location.href = '/employee/add/week=' + year + "T" + kill;
            }
        });

    });

</script>


</body>
</html>
