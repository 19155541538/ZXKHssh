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
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            /* 确保header高度足够 */
            height: 60px; /* 或根据实际情况调整 */
        }

        nav {
            width: 20%;
            background-color: #333;
            padding: 20px;
            box-sizing: border-box;
            height: calc(100vh - 60px); /* 减去header的高度 */
            position: fixed;
            top: 60px; /* 从header的底部开始 */
            left: 0;
            z-index: 500;
            overflow-y: auto; /* 如果内容超过视窗高度，允许滚动 */
        }

        .content {
            margin-left: 20%; /* Adjust based on nav width */
            margin-top: 60px; /* Adjust based on header height, ensure it's the same as header's height */
            padding: 20px;
            box-sizing: border-box;
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

        footer {
            clear: both;
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
        }

        /*   退出登录样式  */
        .logout-button {
            display: inline-block;
            background-color: #f44336; /* 红色背景 */
            color: white; /* 白色文字 */
            text-align: center;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            position: absolute;
            right: 10px;
            top: 10px;
        }

        .logout-button:hover {
            background-color: #d32f2f; /* 鼠标悬停时更深的红色 */
        }

    </style>
</head>
<body>
<header>
    <h1>你好，<s:property value="userName" />!</h1>
    <a href="#" onclick="logout()" class="logout-button">退出登录</a>
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
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<script type="text/javascript" charset="UTF-8">
    if(typeof jQuery!='undefined'){
        console.log("jquery加载成功");
    }else {
        console.log("jquery加载失败");
    }
</script>
<script>
    function loadContent(menuPage) {
        $('.content').load(menuPage);
    }

    function logout() {
        fetch('logout', { method: 'POST' })
            .then(response => {
                if (response.ok) {
                    alert('已退出');
                    window.location.href = 'index.jsp'; // 重定向到 index.jsp
                } else {
                    alert('退出登录失败，请重试。');
                }
            })
            .catch(error => {
                console.error('请求失败:', error);
            });
    }
</script>
</html>

