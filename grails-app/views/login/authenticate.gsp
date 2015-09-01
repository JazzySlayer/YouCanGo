<%--
  Created by IntelliJ IDEA.
  User: Sushant
  Date: 7/22/2015
  Time: 5:58 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <r:require modules="jquery"/>
    <r:require modules="jquery-ui"/>
    <style>

        .message{
            text-decoration-color: red;
            display: table-row;
        }
        .form-control{
            width:25%;
        }
        .form-horizontal{
            margin:auto;
            text-align:center;
            background-color:#0FF;
        }
    </style>
    %{--<script src="${resource(dir: 'js', file: 'jquery-1.11.3.js')}"></script>
    <script>
        function deleteMessage(){
            $(".message").html(" ");
        }
    </script>--}%
</head>

<body>
    <div class="form">
        <g:if test="${flash.message}"/>
        <div class = "message">
            ${flash.message}<br>
        </div>

        <g:form controller="login" action="authenticate">
            <input type="hidden" name="action" value="login">
            <input type="hidden" name="hide" value="">
            <table class='center'>
                <tr><td>Login:</td><td><input type="text" name="login" id="username"></td></tr>
                <tr><td>Password:</td><td><g:passwordField name="password" id="password" /></td></tr>
                <tr><td>&nbsp;</td><td><g:submitButton name="submit" value="Login" /></td></tr>
                <tr><td colspan=2>&nbsp;</td></tr>
            </table>
        </g:form>
        <g:link controller="member" action="create">Sign Up</g:link>
    </div>
</body>
</html>