<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="/resources/header/navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <title>Jump Arena</title>

</head>

<body>


<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="container col-12">

    <button type="button" class="btn btn-success btn-arrow-left" id="lewy">&laquo;</button>
    <span id="current"></span>
    <button type="button" class="btn btn-success btn-arrow-right" id="prawy">&raquo;</button>

    <%--@elvariable id="propositionListCmd" type="pl.coderslab.model.Proposition"--%>
    <form:form method="post" modelAttribute="propositionListCmd">

        <table class="table table-responsive">
            <thead>
            <tr class="no-border">
                <td>
                    <label for="pon"><b>PONIEDZIAŁEK</b></label>
                    <input class="form-control" id="pon" readonly="true" value=""/>
                </td>
            </tr>
            <tr class="table-thead-schedule">
                <td style="width: 10%">Procownik</td>
                <td style="width: 20%">Dostępność</td>
                <td style="width: 20%">Grafik</td>
                <td style="width: 50%"></td>
            </tr>
            </thead>
            <tbody class="table-schedule">
            <c:forEach items="${proposition}" var="proposition" varStatus="loop">
                <c:choose>
                    <c:when test="${not empty proposition.ponStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">

                                <form:hidden path="propositionList[${vs.index}].id"
                                             name="propositionList[${vs.index}].id"/>
                                <form:hidden path="propositionList[${vs.index}].week"
                                             name="propositionList[${vs.index}].week"/>
                                <form:hidden path="propositionList[${vs.index}].pon"
                                             name="propositionList[${vs.index}].pon"/>

                                <tr class="table-schedule">
                                    <td align="center"><form:input path="propositionList[${vs.index}].user"
                                                    name="propositionList[${vs.index}].user" class="form-control"
                                                    readonly="true"/></td>
                                    <td align="center">
                                        <div class="form-group row" >
                                            <div class="col-lg-4" >
                                                <form:input path="propositionList[${vs.index}].ponStart"
                                                            name="propositionList[${vs.index}].ponStart"
                                                            class="form-control"
                                                            readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4">
                                                <form:input path="propositionList[${vs.index}].ponEnd"
                                                            class="form-control"
                                                            name="propositionList[${vs.index}].ponEnd"
                                                            readonly="true"/>
                                            </div>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].ponStartFinal"
                                                            class="slider-timePON${vs.index} form-control"
                                                            name="start" readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].ponEndFinal"
                                                            class="slider-time2PON${vs.index} form-control"
                                                            name="end" readonly="true"/>
                                            </div>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="sliders_step1">
                                            <div id="slider-rangePON${vs.index}"></div>
                                        </div>
                                    </td>

                                </tr>
                            </c:if>
                        </c:forEach>

                    </c:when>
                    <c:when test="${empty proposition.ponStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].pon"
                                             name="propositionList[${vs.index}].pon"/>
                                <form:hidden path="propositionList[${vs.index}].week"
                                             name="propositionList[${vs.index}].week"/>
                            </c:if>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </c:forEach>
            </tbody>
        </table>
        <table class="table table-responsive">
            <thead>
            <tr class="no-border">
                <td>
                    <label for="wt"><b>WTOREK</b></label>
                    <input class="form-control" id="wt" readonly="true" value=""/>
                </td>
            </tr>
            <tr class="table-thead-schedule">
                <td style="width: 10%">Procownik</td>
                <td style="width: 20%">Dostępność</td>
                <td style="width: 20%">Grafik</td>
                <td style="width: 50%"></td>
            </tr>
            </thead>
            <tbody class="table-schedule">
            <c:forEach items="${proposition}" var="proposition" varStatus="loop">
                <c:choose>
                    <c:when test="${not empty proposition.wtStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].id"
                                             name="propositionList[${vs.index}].id"/>
                                <%--<form:hidden	path="propositionList[${vs.index}].week" name="propositionList[${vs.index}].week"/>--%>
                                <form:hidden path="propositionList[${vs.index}].wt"
                                             name="propositionList[${vs.index}].wt"/>

                                <tr>
                                    <td><form:input path="propositionList[${vs.index}].user"
                                                    name="propositionList[${vs.index}].user" class="form-control"
                                                    readonly="true"/></td>
                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].wtStart"
                                                            name="propositionList[${vs.index}].wtStart"
                                                            class="form-control"
                                                            readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].wtEnd"
                                                            class="form-control"
                                                            name="propositionList[${vs.index}].wtEnd"
                                                            readonly="true"/>
                                            </div>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].wtStartFinal"
                                                            class="slider-timeWT${vs.index} form-control"
                                                            name="start" readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].wtEndFinal"
                                                            class="slider-time2WT${vs.index} form-control"
                                                            name="end" readonly="true"/>
                                            </div>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="sliders_step1">
                                            <div id="slider-rangeWT${vs.index}"></div>
                                        </div>
                                    </td>
                                </tr>

                            </c:if>
                        </c:forEach>

                    </c:when>
                    <c:when test="${empty proposition.wtStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].wt"
                                             name="propositionList[${vs.index}].wt"/>
                            </c:if>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </c:forEach>
            </tbody>
        </table>
        <table class="table table-responsive">
                <thead>
                <tr class="no-border">
                    <td>
                        <label for="sr"><b>ŚRODA</b></label>
                        <input class="form-control" id="sr" readonly="true" value=""/>
                    </td>
                </tr>
                <tr class="table-thead-schedule">
                    <td style="width: 10%">Procownik</td>
                    <td style="width: 20%">Dostępność</td>
                    <td style="width: 20%">Grafik</td>
                    <td style="width: 50%"></td>
                </tr>
                </thead>
                <tbody class="table-schedule">
            <c:forEach items="${proposition}" var="proposition" varStatus="loop">
                <c:choose>
                    <c:when test="${not empty proposition.srStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].id"
                                             name="propositionList[${vs.index}].id"/>
                                <form:hidden path="propositionList[${vs.index}].sr"
                                             name="propositionList[${vs.index}].sr"/>
                                <tr>
                                    <td>
                                        <form:input path="propositionList[${vs.index}].user"
                                                    name="propositionList[${vs.index}].user"
                                                    readonly="true" class="form-control"/>
                                    </td>

                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].srStart"
                                                            name="propositionList[${vs.index}].srStart"
                                                            class="form-control"
                                                            readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].srEnd"
                                                            class="form-control"
                                                            name="propositionList[${vs.index}].srEnd"
                                                            readonly="true"/>
                                            </div>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].srStartFinal"
                                                            class="slider-timeSR${vs.index} form-control"
                                                            name="start" readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].srEndFinal"
                                                            class="slider-time2SR${vs.index} form-control"
                                                            name="end" readonly="true"/>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="sliders_step1">
                                            <div id="slider-rangeSR${vs.index}"></div>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:when>
                    <c:when test="${empty proposition.srStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].sr"
                                             name="propositionList[${vs.index}].sr"/>
                            </c:if>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </c:forEach>
            </tbody>
        </table>
        <table class="table table-responsive">
            <thead>
            <tr class="no-border">
                <td>
                    <label for="czw"><b>CZWARTEK</b></label>
                    <input class="form-control" id="czw" readonly="true" value=""/>
                </td>
            </tr>
            <tr class="table-thead-schedule">
                <td style="width: 10%">Procownik</td>
                <td style="width: 20%">Dostępność</td>
                <td style="width: 20%">Grafik</td>
                <td style="width: 50%"></td>
            </tr>
            </thead>
            <tbody class="table-schedule">
            <c:forEach items="${proposition}" var="proposition" varStatus="loop">
                <c:choose>
                    <c:when test="${not empty proposition.czwStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].id"
                                             name="propositionList[${vs.index}].id"/>
                                <form:hidden path="propositionList[${vs.index}].czw"
                                             name="propositionList[${vs.index}].czw"/>
                                <tr>
                                    <td>
                                        <form:input path="propositionList[${vs.index}].user"
                                                    name="propositionList[${vs.index}].user"
                                                    readonly="true" class="form-control"/>
                                    </td>

                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].czwStart"
                                                            name="propositionList[${vs.index}].czwStart"
                                                            class="form-control"
                                                            readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].czwEnd"
                                                            class="form-control"
                                                            name="propositionList[${vs.index}].czwEnd"
                                                            readonly="true"/>
                                            </div>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].czwStartFinal"
                                                            class="slider-timeCZW${vs.index} form-control"
                                                            name="start" readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].czwEndFinal"
                                                            class="slider-time2CZW${vs.index} form-control"
                                                            name="end" readonly="true"/>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="sliders_step1">
                                            <div id="slider-rangeCZW${vs.index}"></div>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>

                    </c:when>
                    <c:when test="${empty proposition.czwStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].czw"
                                             name="propositionList[${vs.index}].czw"/>
                            </c:if>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </c:forEach>
            </tbody>
        </table>
        <table class="table table-responsive">
            <thead>
            <tr class="no-border">
                <td>
                    <label for="pt"><b>PIĄTEK</b></label>
                    <input class="form-control" id="pt" readonly="true" value=""/>
                </td>
            </tr>
            <tr class="table-thead-schedule">
                <td style="width: 10%">Procownik</td>
                <td style="width: 20%">Dostępność</td>
                <td style="width: 20%">Grafik</td>
                <td style="width: 50%"></td>
            </tr>
            </thead>
            <tbody class="table-schedule">
            <c:forEach items="${proposition}" var="proposition" varStatus="loop">
                <c:choose>
                    <c:when test="${not empty proposition.ptStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].id"
                                             name="propositionList[${vs.index}].id"/>
                                <form:hidden path="propositionList[${vs.index}].pt"
                                             name="propositionList[${vs.index}].pt"/>
                                <tr>
                                    <td>
                                        <form:input path="propositionList[${vs.index}].user"
                                                    name="propositionList[${vs.index}].user"
                                                    readonly="true" class="form-control"/>
                                    </td>

                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].ptStart"
                                                            name="propositionList[${vs.index}].ptStart"
                                                            class="form-control"
                                                            readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].ptEnd"
                                                            class="form-control"
                                                            name="propositionList[${vs.index}].ptEnd"
                                                            readonly="true"/>
                                            </div>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].ptStartFinal"
                                                            class="slider-timePT${vs.index} form-control"
                                                            name="start" readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].ptEndFinal"
                                                            class="slider-time2PT${vs.index} form-control"
                                                            name="end" readonly="true"/>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="sliders_step1">
                                            <div id="slider-rangePT${vs.index}"></div>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>

                    </c:when>
                    <c:when test="${empty proposition.ptStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].pt"
                                             name="propositionList[${vs.index}].pt"/>
                            </c:if>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </c:forEach>
            </tbody>
        </table>
        <table class="table table-responsive">
            <thead>
            <tr class="no-border">
                <td>
                    <label for="sb"><b>SOBOTA</b></label>
                    <input class="form-control" id="sb" readonly="true" value=""/>
                </td>
            </tr>
            <tr class="table-thead-schedule">
                <td style="width: 10%">Procownik</td>
                <td style="width: 20%">Dostępność</td>
                <td style="width: 20%">Grafik</td>
                <td style="width: 50%"></td>
            </tr>
            </thead>
            <tbody class="table-schedule">
            <c:forEach items="${proposition}" var="proposition" varStatus="loop">
                <c:choose>
                    <c:when test="${not empty proposition.sbStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].id"
                                             name="propositionList[${vs.index}].id"/>
                                <form:hidden path="propositionList[${vs.index}].sb"
                                             name="propositionList[${vs.index}].sb"/>

                                <tr>
                                    <td>
                                        <form:input path="propositionList[${vs.index}].user"
                                                    name="propositionList[${vs.index}].user"
                                                    readonly="true" class="form-control"/>
                                    </td>

                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].sbStart"
                                                            name="propositionList[${vs.index}].sbStart"
                                                            class="form-control"
                                                            readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].sbEnd"
                                                            class="form-control"
                                                            name="propositionList[${vs.index}].sbEnd"
                                                            readonly="true"/>
                                            </div>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].sbStartFinal"
                                                            class="slider-timeSB${vs.index} form-control"
                                                            name="start" readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].sbEndFinal"
                                                            class="slider-time2SB${vs.index} form-control"
                                                            name="end" readonly="true"/>
                                            </div>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="sliders_step1">
                                            <div id="slider-rangeSB${vs.index}"></div>
                                        </div>
                                    </td>

                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:when>
                    <c:when test="${empty proposition.sbStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].sb"
                                             name="propositionList[${vs.index}].sb"/>
                            </c:if>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </c:forEach>
            </tbody>
        </table>
        <table class="table table-responsive">
            <thead>
            <tr class="no-border">
                <td>
                    <label for="nd"><b>NIEDZIELA</b></label>
                    <input class="form-control" id="nd" readonly="true" value=""/>
                </td>
            </tr>
            <tr class="table-thead-schedule">
                <td style="width: 10%">Procownik</td>
                <td style="width: 20%">Dostępność</td>
                <td style="width: 20%">Grafik</td>
                <td style="width: 50%"></td>
            </tr>
            </thead>
            <tbody class="table-schedule">
            <c:forEach items="${proposition}" var="proposition" varStatus="loop">
                <c:choose>
                    <c:when test="${not empty proposition.ndStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].id"
                                             name="propositionList[${vs.index}].id"/>

                                <form:hidden path="propositionList[${vs.index}].nd"
                                             name="propositionList[${vs.index}].nd"/>
                                <tr>
                                    <td>
                                        <form:input path="propositionList[${vs.index}].user"
                                                    name="propositionList[${vs.index}].user"
                                                    readonly="true" class="form-control"/>
                                    </td>
                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].ndStart"
                                                            name="propositionList[${vs.index}].ndStart"
                                                            class="form-control"
                                                            readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].ndEnd"
                                                            class="form-control"
                                                            name="propositionList[${vs.index}].ndEnd"
                                                            readonly="true"/>
                                            </div>
                                        </div>

                                    </td>
                                    <td>
                                        <div class="form-group row">
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].ndStartFinal"
                                                            class="slider-timeND${vs.index} form-control"
                                                            name="start" readonly="true"/>
                                            </div>
                                            -
                                            <div class="col-lg-4 ">
                                                <form:input path="propositionList[${vs.index}].ndEndFinal"
                                                            class="slider-time2ND${vs.index} form-control"
                                                            name="end" readonly="true"/>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="sliders_step1">
                                            <div id="slider-rangeND${vs.index}"></div>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>

                    </c:when>
                    <c:when test="${empty proposition.ndStart}">
                        <c:forEach items="${propositionListCmd.propositionList}" varStatus="vs">
                            <c:if test="${vs.index ==loop.index}">
                                <form:hidden path="propositionList[${vs.index}].nd"
                                             name="propositionList[${vs.index}].nd"/>
                            </c:if>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </c:forEach>
            </tbody>
        </table>

        <button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
    </form:form>

</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/bower_components/moment/moment.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<script>

    $(function () {


        //wersja na dni
        // var current=$('#current');
        //
        // function getParameterByName() {
        //     var url = window.location.href;
        //     var name = url.split("=");
        //     if (name !== null) {
        //         return name[1];
        //     }
        // }
        //
        // var param = getParameterByName();
        //
        // if(typeof param == "undefined"){
        //     var day = moment().format("DD-MM-YYYY");
        //     // current.text(day);
        // }else{
        //     var day = param;
        // }
        //
        // current.text(day);
        //
        // var btns1=$('#lewy');
        // var btns2=$('#prawy');
        //
        //
        // $("#slider-range").slider({
        //     range: true,
        //     min: 480,
        //     max: 1260,
        //     step:30,
        //     values: [600, 720],
        //     slide: function (e, ui) {
        //         var hours1 = Math.floor(ui.values[0] / 60);
        //         var minutes1 = ui.values[0] - (hours1 * 60);
        //
        //         if (hours1.length == 1) hours1 = '0' + hours1;
        //         if (minutes1.length == 1) minutes1 = '0' + minutes1;
        //         if (minutes1 == 0) minutes1 = '00';
        //
        //         $('.slider-time').html(hours1 + ':' + minutes1);
        //
        //         var hours2 = Math.floor(ui.values[1] / 60);
        //         var minutes2 = ui.values[1] - (hours2 * 60);
        //
        //         if (hours2.length == 1) hours2 = '0' + hours2;
        //         if (minutes2.length == 1) minutes2 = '0' + minutes2;
        //         if (minutes2 == 0) minutes2 = '00';
        //
        //         $('.slider-time2').html(hours2 + ':' + minutes2);
        //     }
        // });
        //
        //
        // btns1.on('click', function ()	{
        //     var kill = moment(moment($('#current').text(), "DD-MM-YYYY").subtract(1, 'day')).format("DD-MM-YYYY");
        //     current.text(kill);
        //     window.location.href = '/man/create/date='+current.text();
        //
        // });
        //
        // btns2.on('click', function ()	{
        //     var kill = moment(moment($('#current').text(), "DD-MM-YYYY").add(1, 'day')).format("DD-MM-YYYY");
        //     current.text(kill);
        //     window.location.href = '/man/create/date='+current.text();
        // });


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

        <%--@elvariable id="proposition" type="pl.coderslab.arenaboot.model.Proposition"--%>

        <c:forEach items="${proposition}" var="proposition" varStatus="loop">

        var hmsPon = "${proposition.ponStartFinal}";   // your input string
        if (hmsPon != "") {
            $('.slider-timePON${loop.index}').val(hmsPon);
            var aPon = hmsPon.split(':'); // split it at the colons
            var minPon = (+aPon[0]) * 60 + (+aPon[1]);
        } else {
            var minPon = 480;
        }
        var hms1Pon = "${proposition.ponEndFinal}";   // your input string
        if (hms1Pon != "") {
            $('.slider-time2PON${loop.index}').val(hms1Pon);
            var a1Pon = hms1Pon.split(':'); // split it at the colons
            var maxPon = (+a1Pon[0]) * 60 + (+a1Pon[1]);
        } else {
            var maxPon = 480;
        }


        var hmsWt = "${proposition.wtStartFinal}";   // your input string
        if (hmsWt != "") {
            $('.slider-timeWT${loop.index}').val(hmsWt);
            var aWt = hmsWt.split(':'); // split it at the colons
            var minWt = (+aWt[0]) * 60 + (+aWt[1]);
        } else {
            var minWt = 480;
        }
        var hms1Wt = "${proposition.wtEndFinal}";   // your input string
        if (hms1Wt != "") {
            $('.slider-time2WT${loop.index}').val(hms1Wt);
            var a1Wt = hms1Wt.split(':'); // split it at the colons
            var maxWt = (+a1Wt[0]) * 60 + (+a1Wt[1]);
        } else {
            var maxWt = 480;
        }


        var hmsSr = "${proposition.srStartFinal}";   // your input string
        if (hmsSr != "") {
            $('.slider-timeSR${loop.index}').val(hmsSr);
            var aSr = hmsSr.split(':'); // split it at the colons
            var minSr = (+aSr[0]) * 60 + (+aSr[1]);
        } else {
            var minSr = 480;
        }
        var hms1Sr = "${proposition.srEndFinal}";   // your input string
        if (hms1Sr != "") {
            $('.slider-time2SR${loop.index}').val(hms1Sr);
            var a1Sr = hms1Sr.split(':'); // split it at the colons
            var maxSr = (+a1Sr[0]) * 60 + (+a1Sr[1]);
        } else {
            var maxSr = 480;
        }


        var hmsCzw = "${proposition.czwStartFinal}";
        if (hmsCzw != "") {
            $('.slider-timeCZW${loop.index}').val(hmsCzw);
            var aCzw = hmsCzw.split(':');
            var minCzw = (+aCzw[0]) * 60 + (+aCzw[1]);
        } else {
            var minCzw = 480;
        }
        var hms1Czw = "${proposition.czwEndFinal}";
        if (hms1Czw != "") {
            $('.slider-time2CZW${loop.index}').val(hms1Czw);
            var a1Czw = hms1Czw.split(':');
            var maxCzw = (+a1Czw[0]) * 60 + (+a1Czw[1]);
        } else {
            var maxCzw = 480;
        }


        var hmsPt = "${proposition.ptStartFinal}";
        if (hmsPt != "") {
            $('.slider-timePT${loop.index}').val(hmsPt);
            var aPt = hmsPt.split(':'); // split it at the colons
            var minPt = (+aPt[0]) * 60 + (+aPt[1]);
        } else {
            var minPt = 480;
        }
        var hms1Pt = "${proposition.ptEndFinal}";
        if (hms1Pt != "") {
            $('.slider-time2PT${loop.index}').val(hms1Pt);
            var a1Pt = hms1Pt.split(':');
            var maxPt = (+a1Pt[0]) * 60 + (+a1Pt[1]);
        } else {
            var maxPt = 480;
        }


        var hmsSb = "${proposition.sbStartFinal}";
        if (hmsSb != "") {
            $('.slider-timeSB${loop.index}').val(hmsSb);
            var aSb = hmsSb.split(':'); // split it at the colons
            var minSb = (+aSb[0]) * 60 + (+aSb[1]);
        } else {
            var minSb = 480;
        }
        var hms1Sb = "${proposition.sbEndFinal}";
        if (hms1Sb != "") {
            $('.slider-time2SB${loop.index}').val(hms1Sb);
            var a1Sb = hms1Sb.split(':');
            var maxSb = (+a1Sb[0]) * 60 + (+a1Sb[1]);
        } else {
            var maxSb = 480;
        }

        var hmsNd = "${proposition.ndStartFinal}";
        if (hmsNd != "") {
            $('.slider-timeND${loop.index}').val(hmsNd);
            var aNd = hmsNd.split(':'); // split it at the colons
            var minNd = (+aNd[0]) * 60 + (+aNd[1]);
        } else {
            var minNd = 480;
        }
        var hms1Nd = "${proposition.ndEndFinal}";
        if (hms1Nd != "") {
            $('.slider-time2ND${loop.index}').val(hms1Nd);
            var a1Nd = hms1Nd.split(':'); // split it at the colons
            var maxNd = (+a1Nd[0]) * 60 + (+a1Nd[1]);
        } else {
            var maxNd = 480;
        }

        $("#slider-rangePON${loop.index}").slider({

            range: true,
            min: 480,
            max: 1260,
            step: 30,
            values: [minPon, maxPon],

            slide: function (e, ui) {
                var hours1 = Math.floor(ui.values[0] / 60);
                var minutes1 = ui.values[0] - (hours1 * 60);

                if (hours1.length == 1) hours1 = '0' + hours1;
                if (minutes1.length == 1) minutes1 = '0' + minutes1;
                if (minutes1 == 0) minutes1 = '00';

                $('.slider-timePON${loop.index}').val(hours1 + ':' + minutes1);

                var hours2 = Math.floor(ui.values[1] / 60);
                var minutes2 = ui.values[1] - (hours2 * 60);

                if (hours2.length == 1) hours2 = '0' + hours2;
                if (minutes2.length == 1) minutes2 = '0' + minutes2;
                if (minutes2 == 0) minutes2 = '00';

                $('.slider-time2PON${loop.index}').val(hours2 + ':' + minutes2);
            }
        });
        $("#slider-rangeWT${loop.index}").slider({
            range: true,
            min: 480,
            max: 1260,
            step: 30,
            values: [minWt, maxWt],
            slide: function (e, ui) {
                var hours1 = Math.floor(ui.values[0] / 60);
                var minutes1 = ui.values[0] - (hours1 * 60);

                if (hours1.length == 1) hours1 = '0' + hours1;
                if (minutes1.length == 1) minutes1 = '0' + minutes1;
                if (minutes1 == 0) minutes1 = '00';

                $('.slider-timeWT${loop.index}').val(hours1 + ':' + minutes1);

                var hours2 = Math.floor(ui.values[1] / 60);
                var minutes2 = ui.values[1] - (hours2 * 60);

                if (hours2.length == 1) hours2 = '0' + hours2;
                if (minutes2.length == 1) minutes2 = '0' + minutes2;
                if (minutes2 == 0) minutes2 = '00';

                $('.slider-time2WT${loop.index}').val(hours2 + ':' + minutes2);
            }
        });
        $("#slider-rangeSR${loop.index}").slider({
            range: true,
            min: 480,
            max: 1260,
            step: 30,
            values: [minSr, maxSr],
            slide: function (e, ui) {
                var hours1 = Math.floor(ui.values[0] / 60);
                var minutes1 = ui.values[0] - (hours1 * 60);

                if (hours1.length == 1) hours1 = '0' + hours1;
                if (minutes1.length == 1) minutes1 = '0' + minutes1;
                if (minutes1 == 0) minutes1 = '00';

                $('.slider-timeSR${loop.index}').val(hours1 + ':' + minutes1);

                var hours2 = Math.floor(ui.values[1] / 60);
                var minutes2 = ui.values[1] - (hours2 * 60);

                if (hours2.length == 1) hours2 = '0' + hours2;
                if (minutes2.length == 1) minutes2 = '0' + minutes2;
                if (minutes2 == 0) minutes2 = '00';

                $('.slider-time2SR${loop.index}').val(hours2 + ':' + minutes2);
            }
        });
        $("#slider-rangeCZW${loop.index}").slider({
            range: true,
            min: 480,
            max: 1260,
            step: 30,
            values: [minCzw, maxCzw],
            slide: function (e, ui) {
                var hours1 = Math.floor(ui.values[0] / 60);
                var minutes1 = ui.values[0] - (hours1 * 60);

                if (hours1.length == 1) hours1 = '0' + hours1;
                if (minutes1.length == 1) minutes1 = '0' + minutes1;
                if (minutes1 == 0) minutes1 = '00';

                $('.slider-timeCZW${loop.index}').val(hours1 + ':' + minutes1);

                var hours2 = Math.floor(ui.values[1] / 60);
                var minutes2 = ui.values[1] - (hours2 * 60);

                if (hours2.length == 1) hours2 = '0' + hours2;
                if (minutes2.length == 1) minutes2 = '0' + minutes2;
                if (minutes2 == 0) minutes2 = '00';

                $('.slider-time2CZW${loop.index}').val(hours2 + ':' + minutes2);
            }
        });
        $("#slider-rangePT${loop.index}").slider({
            range: true,
            min: 480,
            max: 1260,
            step: 30,
            values: [minPt, maxPt],
            slide: function (e, ui) {
                var hours1 = Math.floor(ui.values[0] / 60);
                var minutes1 = ui.values[0] - (hours1 * 60);

                if (hours1.length == 1) hours1 = '0' + hours1;
                if (minutes1.length == 1) minutes1 = '0' + minutes1;
                if (minutes1 == 0) minutes1 = '00';

                $('.slider-timePT${loop.index}').val(hours1 + ':' + minutes1);

                var hours2 = Math.floor(ui.values[1] / 60);
                var minutes2 = ui.values[1] - (hours2 * 60);

                if (hours2.length == 1) hours2 = '0' + hours2;
                if (minutes2.length == 1) minutes2 = '0' + minutes2;
                if (minutes2 == 0) minutes2 = '00';

                $('.slider-time2PT${loop.index}').val(hours2 + ':' + minutes2);
            }
        });
        $("#slider-rangeSB${loop.index}").slider({
            range: true,
            min: 480,
            max: 1260,
            step: 30,
            values: [minSb, maxSb],
            slide: function (e, ui) {
                var hours1 = Math.floor(ui.values[0] / 60);
                var minutes1 = ui.values[0] - (hours1 * 60);

                if (hours1.length == 1) hours1 = '0' + hours1;
                if (minutes1.length == 1) minutes1 = '0' + minutes1;
                if (minutes1 == 0) minutes1 = '00';

                $('.slider-timeSB${loop.index}').val(hours1 + ':' + minutes1);

                var hours2 = Math.floor(ui.values[1] / 60);
                var minutes2 = ui.values[1] - (hours2 * 60);

                if (hours2.length == 1) hours2 = '0' + hours2;
                if (minutes2.length == 1) minutes2 = '0' + minutes2;
                if (minutes2 == 0) minutes2 = '00';

                $('.slider-time2SB${loop.index}').val(hours2 + ':' + minutes2);
            }
        });
        $("#slider-rangeND${loop.index}").slider({
            range: true,
            min: 480,
            max: 1260,
            step: 30,
            values: [minNd, maxNd],
            slide: function (e, ui) {
                var hours1 = Math.floor(ui.values[0] / 60);
                var minutes1 = ui.values[0] - (hours1 * 60);

                if (hours1.length == 1) hours1 = '0' + hours1;
                if (minutes1.length == 1) minutes1 = '0' + minutes1;
                if (minutes1 == 0) minutes1 = '00';

                $('.slider-timeND${loop.index}').val(hours1 + ':' + minutes1);

                var hours2 = Math.floor(ui.values[1] / 60);
                var minutes2 = ui.values[1] - (hours2 * 60);

                if (hours2.length == 1) hours2 = '0' + hours2;
                if (minutes2.length == 1) minutes2 = '0' + minutes2;
                if (minutes2 == 0) minutes2 = '00';

                $('.slider-time2ND${loop.index}').val(hours2 + ':' + minutes2);
            }
        });

        </c:forEach>

        btns1.on('click', function () {

            var name = current.text().split("T");

            if (parseInt(name[1]) > 1) {
                var kill = parseInt(name[1]) - 1;
                current.text(year + "T" + kill);
                window.location.href = '/man/createSchedule/week=' + current.text();
            }
        });

        btns2.on('click', function () {

            var name = current.text().split("T");

            if (parseInt(name[1]) <= 53) {
                var kill = parseInt(name[1]) + 1;
                current.text(year + "T" + kill);
                window.location.href = '/man/createSchedule/week=' + current.text();
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
