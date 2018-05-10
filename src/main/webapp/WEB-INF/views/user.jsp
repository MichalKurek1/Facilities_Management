<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
User nazywa się: <sec:authentication property="principal.username" /> !

<sec:authorize access="hasRole('supervisor')">

    To zobaczy tylko twój nadzorca

</sec:authorize>


<sec:authorize url="/admin">

    To możesz zobaczyć tylko jak masz dostęp do strony /admin

</sec:authorize>


</body>
</html>