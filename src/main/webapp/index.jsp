<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #ffffff;
            padding: 100px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-group input[type="submit"] {
            background-color: #5c6bc0;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }
        .form-group input[type="submit"]:hover {
            background-color: #3f51b5;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>欢迎光临，请登录</h2>
    <form action="login" method="post">
        <div class="form-group">
            <label for="userName">账号:</label>
            <input type="text" id="userName" name="userName" required />
        </div>
        <div class="form-group">
            <label for="passWord">密码:</label>
            <input type="passWord" id="passWord" name="passWord" required />
        </div>
        <div class="form-group">
            <input type="submit" value="登陆" />
        </div>
        <% if (request.getAttribute("errorMessage") != null) { %>
        <script>alert('<%= request.getAttribute("errorMessage") %>');</script>
        <% } %>
    </form>
</div>
</body>
</html>


