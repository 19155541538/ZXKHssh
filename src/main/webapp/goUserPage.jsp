<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>用户管理</title>
</head>
<body>
<h1>用户管理</h1>
<table border="1">
    <tr>
        <th>用户ID</th>
        <th>姓名</th>
        <th>用户名</th>
        <th>出生日期</th>
        <th>角色ID</th>
        <th>身高</th>
        <th>性别</th>
        <th>地址</th>
        <th>电话号码</th>
        <th>操作</th>
    </tr>
    <s:iterator value="userList" var="user">
        <tr>
            <td></td>
            <td><s:property value="#user.userId"/></td>
            <td><s:property value="#user.name"/></td>
            <td><s:property value="#user.userName"/></td>
            <td><s:date name="#user.birthDate" format="yyyy-MM-dd"/></td>
            <td><s:property value="#user.roleId"/></td>
            <td><s:property value="#user.height"/></td>
            <td><s:property value="#user.gender"/></td>
            <td><s:property value="#user.address"/></td>
            <td><s:property value="#user.phoneNumber"/></td>
            <td>
                <button onclick="editUser('<s:property value="#user.userId"/>')">编辑</button>
                <button onclick="deleteUser('<s:property value="#user.userId"/>')">删除</button>
            </td>
        </tr>
    </s:iterator>
</table>


<script>
    function editUser(userId) {
        window.location.href = 'editUser.action?userId=' + userId; // 假设这是编辑用户的URL
    }

    function deleteUser(userId) {
        if (confirm('确定要删除用户吗?')) {
            window.location.href = 'deleteUser.action?userId=' + userId; // 假设这是删除用户的URL
        }
    }
</script>
</body>
</html>
