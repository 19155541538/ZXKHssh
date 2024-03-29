<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <h1>你好，<s:property value="userName" />!</h1>
</header>

<nav>
    <ul>
        <s:iterator var="menu" value="menuList">
            <s:set var="menuName" value="菜单名称" />
            <s:set var="menuUrl" value="菜单链接" />
            <li><a href="${menuUrl}">${menuName}</a></li>
        </s:iterator>

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

