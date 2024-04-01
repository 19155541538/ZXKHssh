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
            width: 20%;
            background-color: #333;
            padding: 20px;
            box-sizing: border-box;
            height: 100vh;
            float: left;
            box-shadow: 4px 0 10px rgba(0,0,0,0.2);
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        nav ul li {
            margin-bottom: 10px;
            padding: 10px;
            background-color: #f4f4f4;
            border-radius: 5px;
        }

        nav ul li:hover {
            background-color: #ddd;
        }

        nav ul li a {
            text-decoration: none;
            color: #333;
            display: block;
        }

        nav ul li a:hover {
            color: #000;
            text-decoration: underline;
        }
        ul {
            list-style-type: none; /* 移除列表标记 */
            padding: 0; /* 移除默认的内边距 */
            margin: 0; /* 移除默认的外边距 */
            width: 100%; /* 或者你可以设置为具体的宽度，例如200px */
        }

        ul li {
            margin-bottom: 10px; /* 列表项之间的间距 */
            background-color: #f4f4f4; /* 背景色 */
            border-radius: 5px; /* 圆角边框 */
        }

        ul li a {
            display: block; /* 使链接填满整个列表项 */
            text-decoration: none; /* 去除下划线 */
            color: #333; /* 文字颜色 */
            text-align: center; /* 文字居中 */
            padding: 10px; /* 文字周围的空间 */
        }

        ul li:hover {
            background-color: #ddd; /* 鼠标悬停时的背景色 */
        }

        ul li a:hover {
            color: #000; /* 鼠标悬停时的文字颜色 */
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
            <li><a href="#" onclick="loadContent('${menuUrl}')">${menuName}</a></li>
        </s:iterator>
    </ul>
</nav>

<div class="content">

</div>

<%--<footer>
    底部固定区域
</footer>--%>
</body>

<script>
    function loadContent(menuPage) {
        // 发送Ajax请求
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 将获取到的内容渲染到页面中
                document.querySelector('.content').innerHTML = xhr.responseText;
            }
        };
        xhr.open('GET', menuPage, true);
        xhr.send();
    }
</script>
</html>

