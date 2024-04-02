<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>用户管理</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f0f0f0;
        }
        h1 {
            color: #4CAF50; /* 设置标题颜色 */
            text-align: center; /* 标题居中 */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #ffffff; /* 为表格添加白色背景 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
            white-space: nowrap;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 5px;
        }
        button:hover {
            opacity: 0.8;
        }
        /* 弹出层样式 */
        .modal {
            display: none; /* 默认隐藏 */
            position: fixed; /* 固定定位 */
            z-index: 1; /* 在顶层 */
            left: 0;
            top: 0;
            width: 100%; /* 宽度为全屏 */
            height: 100%; /* 高度为全屏 */
            background-color: rgba(0,0,0,0.4); /* 半透明背景 */

        }

        /* 弹出内容的样式 */
        .modal-content {
            background-color: #fefefe;
            width: 30%; /* 更小的宽度 */
            padding: 20px;
            border-radius: 5px;
            margin: 10% auto; /* 更大的顶部边距和自动左右边距，用于居中 */
        }

        /* 表单样式 */
        #addUserForm {
            display: flex;
            flex-direction: column; /* 使表单项垂直排列 */
            align-items: center; /* 水平居中对齐 */
        }
        /* 表单样式 */
        #addUserForm {
            display: flex;
            flex-direction: column; /* 使表单项垂直排列 */
            align-items: center; /* 水平居中对齐 */
        }

        /* 表单项的容器不再使用弹性布局，以确保所有表单项对齐 */
        #addUserForm div {
            display: block; /* 使得每个表单项都在新行上 */
            justify-content: space-between; /* 在项目之间添加空间 */
            align-items: center; /* 居中对齐 */
            margin-bottom: 10px;
        }

        #addUserForm label {
            margin: 0;
            flex-basis: 40%; /* 标签占据 40% 的宽度 */
        }


        #addUserForm input[type="text"],
        #addUserForm input[type="password"],
        #addUserForm input[type="date"],
        #addUserForm input[type="number"],
        #addUserForm input[type="tel"],
        #addUserForm select {
            width: 200px; /* 或者您希望的任何固定宽度 */
            padding: 8px;
            margin-left: 10px; /* 确保在标签之后有一些间隔 */
        }
        #addUserForm button {
            width: 90%; /* 输入框和按钮宽度 */
            padding: 10px;
            margin-top: 10px; /* 调整间距 */
            border: 1px solid #ddd; /* 边框 */
            border-radius: 5px; /* 圆角边框 */
        }

        #addUserForm button {
            background-color: #4CAF50; /* 按钮背景颜色 */
            color: white; /* 按钮文字颜色 */
            cursor: pointer; /* 鼠标样式 */
            margin-top: 20px; /* 与上一个表单项的间距 */
        }

        #addUserForm button:hover {
            background-color: #45a049; /* 鼠标悬停时的背景颜色 */
        }
        #addUserForm button {
            width: auto; /* 自动根据内容调整宽度 */
            padding: 10px 15px; /* 水平和垂直内边距 */
            font-size: 16px; /* 字体大小 */
            font-weight: bold; /* 字体粗细 */
            color: white; /* 字体颜色 */
            background: #4CAF50; /* 背景颜色 */
            border: none; /* 去除边框 */
            border-radius: 5px; /* 圆角边框 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 添加阴影效果 */
            cursor: pointer; /* 鼠标样式 */
            transition: all 0.3s ease; /* 添加过渡动画 */
            outline: none; /* 去除点击时的轮廓线 */
        }

        #addUserForm button:hover {
            background: #45a049; /* 鼠标悬停时的背景颜色 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* 悬停时的阴影效果 */
            transform: translateY(-2px); /* 轻微的向上移动效果 */
        }

        #addUserForm button:active {
            transform: translateY(1px); /* 按下去时的向下移动效果 */
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2); /* 按下去时的阴影效果 */
        }
        /* 关闭按钮样式 */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>用户管理</h1>
<button onclick="document.getElementById('myModal').style.display='block'">新增</button>


<!-- 编辑用户的模态框 -->
<div id="editModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="document.getElementById('editModal').style.display='none'">&times;</span>
        <h2>编辑用户</h2>
        <form id="editUserForm">
            <input type="hidden" id="editUserId" name="user.userId" value="">
            <div>
                <label for="editName">姓名：</label>
                <input type="text" id="editName" name="user.name" required>
            </div>
            <div>
                <label for="editUsername">账号：</label>
                <input type="text" id="editUsername" name="user.userName" required>
            </div>
            <div>
                <label for="editPassword">密码：</label>
                <input type="password" id="editPassword" name="user.passWord">
            </div>
            <div>
                <label for="editBirthDate">生日：</label>
                <input type="date" id="editBirthDate" name="user.birthDate" required>
            </div>
            <div>
                <label for="editRole">角色：</label>
                <select id="editRole" name="user.roleId" required>
                    <option value="1">管理员</option>
                    <option value="2">普通用户</option>
                </select>
            </div>
            <div>
                <label for="editHeight">身高：</label>
                <input type="number" id="editHeight" name="user.height" required>
            </div>
            <div>
                <label for="editGender">性别：</label>
                <select id="editGender" name="user.gender" required>
                    <option value="M">男</option>
                    <option value="F">女</option>
                </select>
            </div>
            <div>
                <label for="editAddress">地址：</label>
                <input type="text" id="editAddress" name="user.address" required>
            </div>
            <div>
                <label for="editPhoneNumber">电话：</label>
                <input type="tel" id="editPhoneNumber" name="user.phoneNumber" required>
            </div>
            <div>
                <button type="submit">提交</button>
            </div>
        </form>
    </div>
</div>


<!-- 弹出层 新增 -->
<div id="myModal" class="modal">
    <!-- 弹出内容 -->
    <div class="modal-content">
        <span class="close" onclick="document.getElementById('myModal').style.display='none'">&times;</span>
        <h2>新增用户</h2>
        <!-- 表单开始 -->
        <form id="addUserForm" onsubmit="event.preventDefault();">
            <div>
                <label for="name">姓名：</label>
                <input type="text" id="name" name="user.name" required>
            </div>
            <div>
                <label for="username">账号：</label>
                <input type="text" id="username" name="user.userName" required>
            </div>
            <div>
                <label for="password">密码：</label>
                <input type="password" id="password" name="user.passWord" required>
            </div>
            <div>
                <label for="birthDate">生日：</label>
                <input type="date" id="birthDate" name="user.birthDate" required>
            </div>
            <div>
                <label for="role">角色：</label>
                <select id="role" name="user.roleId" required>
                    <option value="1">管理员</option>
                    <option value="2">普通用户</option>
                </select>
            </div>
            <div>
                <label for="height">身高：</label>
                <input type="number" id="height" name="user.height" required>
            </div>
            <div>
                <label for="gender">性别：</label>
                <select id="gender" name="user.gender" required>
                    <option value="male">男</option>
                    <option value="female">女</option>
                </select>
            </div>
            <div>
                <label for="address">地址：</label>
                <input type="text" id="address" name="user.address" required>
            </div>
            <div>
                <label for="phoneNumber">电话：</label>
                <input type="tel" id="phoneNumber" name="user.phoneNumber" required>
            </div>
            <div>
                <button type="submit">提交</button>
            </div>
        </form>
        <!-- 表单结束 -->
    </div>


</div>
<table>
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
            <td><s:property value="#user.userId"/></td>
            <td><s:property value="#user.name"/></td>
            <td><s:property value="#user.userName"/></td>
            <td><s:date name="#user.birthDate" format="yyyy-MM-dd"/></td>
            <td>
                <s:if test="#user.roleId == 1">超级管理员</s:if>
                <s:if test="#user.roleId == 2">普通管理员</s:if>
            </td>
            <td><s:property value="#user.height"/></td>
            <td>
                <s:property value="#user.gender"/> <!-- 这应该显示 'M' 或 'F' -->
                <s:if test="#user.gender == 'M'">男</s:if>
                <s:if test="#user.gender == 'F'">女</s:if>
            </td>
            <td><s:property value="#user.address"/></td>
            <td><s:property value="#user.phoneNumber"/></td>
            <td>
                <button id="edit" class="edit" onclick="editUser(this.getAttribute('data-user-id'))" data-userid="<s:property value='#user.userId'/>">编辑</button>
                <button id="delete" class="delete" onclick="deleteUser(this.getAttribute('data-user-id'))" data-user-id="<s:property value='#user.userId'/>">删除</button>
            </td>
        </tr>
    </s:iterator>
</table>
</body>
<script>
    // 确保这些函数在全局作用域中定义
    function editUser() {
        $('table').on('click', 'button.edit', function() {
            var userId = $(this).data('userid');
            var row = $(this).closest('tr');


            // 获取数据
            var name = row.find('td:nth-child(2)').text();
            var username = row.find('td:nth-child(3)').text();
            var birthDate = row.find('td:nth-child(4)').text();
            var role = row.find('td:nth-child(5)').text(); // 这可能需要转换为角色ID
            var height = row.find('td:nth-child(6)').text();
            var gender = row.find('td:nth-child(7)').text(); // 这可能需要转换为 'male' 或 'female'
            var address = row.find('td:nth-child(8)').text();
            var phoneNumber = row.find('td:nth-child(9)').text();

            // 填充编辑表单
            $('#editUserId').val(userId);
            $('#editName').val(name);
            $('#editUsername').val(username);
            $('#editBirthDate').val(birthDate);
            $('#editHeight').val(height);
            $('#editAddress').val(address);
            $('#editPhoneNumber').val(phoneNumber);

            // 根据性别和角色设置下拉菜单的选中项
            $('#editGender').val(gender === '男' ? 'M' : 'F');
            $('#editRole').val(role === '超级管理员' ? 1 : 2);

            // 清空密码字段，以便用户输入新密码（如果需要）
            $('#editPassword').val('');

            // 显示编辑模态框
            $('#editModal').show();
        });
    }


    /*
    * 修改页面的提交按钮
    * */
    $('#editUserForm').on('submit', function(event) {
        event.preventDefault();

        // 直接从隐藏的输入字段中获取 userId
        var userId = $('#editUserId').val();
        console.log(userId);

        let formData = new FormData(this);

        formData.append('userId', userId); // 确保后端可以获取 userId

        fetch('editUser', { // 'editUser' 是处理编辑请求的服务器端URL
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('网络请求错误');
                }
                // 如果请求成功，关闭弹框
                document.getElementById('editModal').style.display='none'
                // 重新加载信息
                reloadUserInfo(); // 假设reloadUserInfo是重新加载信息的函数
            })
            .catch(error => {
                console.error('请求失败:', error);
            });
    });
    
    /* 刷新页面请求  */
    function reloadUserInfo() {
        $.get('/get_user_list', function(response) {
            // 这里的 '/get_user_list' 是服务器上获取用户列表的API地址
            // response 是服务器返回的用户列表数据

            $('#user-list-div').html(''); // 清空现有的用户列表
            response.forEach(function(user) {
                // 遍历用户数据，更新到页面中
                $('#user-list-div').append('<p>' + user.name + '</p>');
            });
        });
    }


    function deleteUser(userId) {
        console.log(userId);
        if (confirm('确定要删除吗?')) {
            var formData = new FormData();
            formData.append('userId', userId);

            fetch('deleteUser', {
                method: 'POST',
                body: formData
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('删除失败');
                    }
                    alert('删除成功');
                    location.reload(); // 刷新页面以更新表格
                })
                .catch(error => {
                    console.error('删除用户出错:', error);
                    alert('删除出错');
                });
        }
    }





    document.getElementById('addUserForm').addEventListener('submit', function(e) {
        e.preventDefault(); // 阻止表单的默认提交行为

        let formData = new FormData(this); // 使用FormData对象收集数据

        fetch('addUser', { // 'addUser'是服务器端的URL
            method: 'POST', // 请求方式
            body: formData // 发送到服务器的数据
        })
            .then(response => {
                if (response.ok) {
                    alert('添加成功'); // 如果请求成功（通常是HTTP状态码200）
                    // 发送另一个请求来获取更新后的数据
                    return fetch('goUserPage'); // 假设'getUserData'是获取用户数据的服务器端URL
                } else {
                    throw new Error('添加失败'); // 如果请求失败，则抛出错误
                }
            })
            .catch(error => {
                alert(error.message); // 捕获错误，并显示失败的消息
            })
            .finally(() => {
                document.getElementById('myModal').style.display = 'none'; // 关闭模态框
                window.location.reload(); // 刷新页面
            });
    });





</script>
</html>
