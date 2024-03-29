<%--
  Created by IntelliJ IDEA.
  User: chenkai
  Date: 2024/3/29
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎光临</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        nav {
            float: left;
            width: 20%;
            background-color: #f2f2f2;
            padding: 20px;
            box-sizing: border-box;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
        }
        nav ul li {
            margin-bottom: 10px;
        }
        nav ul li a {
            text-decoration: none;
            color: #333;
        }
        .content {
            float: left;
            width: 60%;
            padding: 20px;
            box-sizing: border-box;
        }
        footer {
            clear: both;
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
        }
    </style>
</head>
<body>
<header>
    <h1>你好，${userName}!</h1>
</header>

<nav>
    <ul>
        <jsp:useBean id="menuList" scope="request" type="java.util.List"/>
        <c:forEach var="menu" items="${menuList}">
            <li><a href="${menu.menuUrl}">${menu.menuName}</a></li>
        </c:forEach>
    </ul>
</nav>

<div class="content">
    <h2>内容主体区域</h2>
    <p>这里是内容主体，您可以添加任何JSP内容。</p>
    <p>这是充数内容的一部分。</p>
    <p>这是充数内容的一部分。</p>
    <p>这是充数内容的一部分。</p>
    <p>这是充数内容的一部分。</p>
    <p>这是充数内容的一部分。</p>
    <p>这是充数内容的一部分。</p>
    <p>这是充数内容的一部分。</p>
    <p>这是充数内容的一部分。</p>
    <p>这是充数内容的一部分。</p>
    <p>这是充数内容的一部分。</p>
</div>

<footer>
    底部固定区域
</footer>
</body>
</html>

