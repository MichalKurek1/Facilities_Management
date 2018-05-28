<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Login</title>
    <link href="/resources/login/login.css" rel="stylesheet">
</head>
<body>

<div class="login-page">
    <div class="form">

        <form class="login-form" name="f" action="/login" method="post" >
            <input type="text" placeholder="użytkownik" name="username"/>
            <input type="password" placeholder="hasło" name="password"/>
            <button type="submit">login</button>
        </form>
    </div>

</div>

</body>
</html>
