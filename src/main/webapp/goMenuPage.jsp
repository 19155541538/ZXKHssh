<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>菜单管理</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
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

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.4);
            overflow: auto; /* 添加滚动条 */
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 40%;
            border-radius: 10px; /* 圆角 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 阴影效果 */
        }

        .modal-content h2 {
            color: #333;
        }

        #addMenuForm div,
        #editMenuForm div {
            margin-bottom: 10px;
        }

        #addMenuForm label,
        #editMenuForm label {
            display: block;
            margin-bottom: 5px;
        }

        #addMenuForm input[type="text"],
        #addMenuForm select,
        #editMenuForm input[type="text"],
        #editMenuForm select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        #addMenuForm button[type="submit"],
        #editMenuForm button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #addMenuForm button[type="submit"]:hover,
        #editMenuForm button[type="submit"]:hover {
            background-color: #3e8e41;
        }

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

        /* 分页控件的样式 */
        .pagination {
            display: flex;
            justify-content: center;
            padding: 20px;
        }

        .pagination-link {
            margin: 0 5px;
            padding: 8px 16px;
            background-color: #f0f0f0;
            color: #333;
            text-decoration: none;
            border-radius: 5px;
            border: 1px solid #ddd;
            transition: background-color 0.3s;
        }

        .pagination-link.active,
        .pagination-link:hover {
            background-color: #4CAF50;
            color: white;
            border-color: #4CAF50;
        }

        .pagination-link:hover {
            background-color: #3e8e41;
        }

    </style>

</head>
<body>
<h1>菜单管理</h1>
<button onclick="document.getElementById('myModal').style.display='block'">新增</button>

<!-- 弹出层 -->
<div id="myModal" class="modal">
    <!-- 弹出内容 -->
    <div class="modal-content">
        <span class="close" onclick="document.getElementById('myModal').style.display='none'">&times;</span>
        <h2>新增菜单</h2>
        <!-- 表单开始 -->
        <form id="addMenuForm" onsubmit="event.preventDefault(); submitAddForm();">
            <div>
                <label for="menuName">菜单名称：</label>
                <input type="text" id="menuName" name="menu.menuName" required>
            </div>
            <div>
                <label for="roleId">角色ID：</label>
                <select id="roleId" name="menu.roleId" required>
                    <option value="1">管理员</option>
                    <option value="2">普通用户</option>
                </select>
            </div>
            <div>
                <label for="menuUrl">菜单URL：</label>
                <input type="text" id="menuUrl" name="menu.menuUrl" required>
            </div>
            <div>
                <button type="submit">提交</button>
            </div>
        </form>
        <!-- 表单结束 -->
    </div>

</div>


<!-- 编辑菜单的模态框 -->
<div id="editModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="document.getElementById('editModal').style.display='none'">&times;</span>
        <h2>编辑菜单</h2>
        <form id="editMenuForm" onsubmit="event.preventDefault(); submitEditForm();">
            <input type="hidden" id="editMenuId" name="menu.menuId">
            <div>
                <label for="editMenuName">菜单名称：</label>
                <input type="text" id="editMenuName" name="menu.menuName" required>
            </div>
            <div>
                <label for="editRoleId">角色：</label>
                <select id="editRoleId" name="menu.roleId">
                    <option value='1'>管理员</option>
                    <option value='2'>普通用户</option>
                </select>
            </div>
            <div>
                <label for="editMenuUrl">菜单URL：</label>
                <input type="text" id="editMenuUrl" name="menu.menuUrl" required>
            </div>
            <div>
                <button type="submit">提交</button>
            </div>
        </form>
    </div>
</div>



<table>
    <tr>
        <th>菜单ID</th>
        <th>菜单名称</th>
        <th>角色ID</th>
        <th>菜单URL</th>
        <th>操作</th>
    </tr>
    <s:iterator value="menuList" var="menu">
        <tr>
            <td><s:property value="#menu.menuId"/></td>
            <td><s:property value="#menu.menuName"/></td>
            <td>
                <s:if test="#menu.roleId == 1">管理员</s:if>
                <s:elseif test="#menu.roleId == 2">普通用户</s:elseif>
            </td>
            <td><s:property value="#menu.menuUrl"/></td>
            <td>
                <button onclick="editMenu(this.getAttribute('data-menu-id'))" data-menu-id="<s:property value="#menu.menuId"/>">编辑</button>
                <button onclick="deleteMenu(this.getAttribute('data-menu-id'))" data-menu-id="<s:property value="#menu.menuId"/>">删除</button>
            </td>
        </tr>
    </s:iterator>
</table>
<!-- 分页控件的HTML部分 -->
<div class="pagination">
    <a href="#" class="pagination-link">&laquo;</a> <!-- 上一页 -->
    <a href="#" class="pagination-link">1</a>
    <a href="#" class="pagination-link active">2</a> <!-- 当前页 -->
    <a href="#" class="pagination-link">3</a>
    <a href="#" class="pagination-link">4</a>
    <a href="#" class="pagination-link">5</a>
    <a href="#" class="pagination-link">&raquo;</a> <!-- 下一页 -->
</div>


<script>

    document.addEventListener('DOMContentLoaded', function() {
        var paginationLinks = document.querySelectorAll('.pagination-link');
        paginationLinks.forEach(function(link) {
            link.addEventListener('click', function(e) {
                e.preventDefault(); // 阻止链接的默认行为
                var page = this.getAttribute('data-page'); // 获取页码
                fetchPageData(page); // 调用函数发送Ajax请求
            });
        });
    });

    function fetchPageData(page) {
        // 使用fetch发送Ajax请求
        // 假设服务器端有一个名为 'getPageData' 的API，能接收页码参数
        fetch('getPageData?page=' + page, {
            method: 'GET',
            // 如果需要发送凭证（如cookies），可以设置 credentials: 'include'
        })
            .then(function(response) {
                return response.text(); // 或者 response.json() 如果服务器返回JSON
            })
            .then(function(html) {
                // 假设服务器返回新的分页内容的HTML
                document.querySelector('.content').innerHTML = html; // 更新页面内容
                // 更新分页导航的激活状态
                updatePaginationActiveState(page);
            })
            .catch(function(error) {
                console.error('请求失败:', error);
            });
    }

    function updatePaginationActiveState(activePage) {
        var paginationLinks = document.querySelectorAll('.pagination-link');
        paginationLinks.forEach(function(link) {
            if(link.getAttribute('data-page') === activePage) {
                link.classList.add('active');
            } else {
                link.classList.remove('active');
            }
        });
    }
    /*
    * 新增
    * */
    document.addEventListener('DOMContentLoaded', function() {
        var form = document.getElementById('addMenuForm');

        if (form) {
            form.addEventListener('submit', function(event) {
                event.preventDefault(); // 阻止表单的默认提交行为

                let formData = new FormData(this); // 获取表单数据

                fetch('addMenu', { // 请确保 'addMenu' 是你的服务器端处理URL
                    method: 'POST',
                    body: formData
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json(); // 假设服务器响应是JSON
                    })
                    .then(data => {
                        alert('添加成功');
                        document.getElementById('myModal').style.display = 'none'; // 关闭模态框
                        // 如果更新成功，局部更新页面
                        loadContent('goMenuPage'); // goMenuPage 是返回页面局部内容的action
                    })
                    .catch(error => {
                        console.error('请求失败:', error);
                        alert('添加失败');
                    });
            });
        } else {
            console.error('Form not found');
        }
    });

    function submitAddForm() {
        const formData = new FormData(document.getElementById('addMenuForm'));

        fetch('addMenu', { // 'addMenu' 是服务器端的URL
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (response.ok) {
                    alert('菜单添加成功');
                    // 如果更新成功，局部更新页面
                    loadContent('goMenuPage'); // goMenuPage 是返回页面局部内容的action
                    document.getElementById('myModal').style.display = 'none'; // 关闭模态框
                } else {
                    throw new Error('菜单添加失败');
                }
            })
            .catch(error => {
                alert('添加过程中出现错误');
                console.error('添加失败:', error);
            });
    }


    // 当用户点击模态框意外的区域，关闭它
    window.onclick = function(event) {
        var modal = document.getElementById('myModal');
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    var roleMap = {
        '管理员': 1,
        '普通用户': 2
    };
    // 编辑按钮点击事件
    function editMenu(menuId, menuName, menuUrl) {
        // 获取菜单的行元素
        var row = $('tr').find('[data-menu-id="' + menuId + '"]').closest('tr');

        // 获取菜单的数据
        var name = row.find('td:nth-child(2)').text();
        var roleName = row.find('td:nth-child(3)').text().trim(); // 获取角色名称
        var roleId = roleMap[roleName]; // 使用映射获取角色ID
        var url = row.find('td:nth-child(4)').text();

        console.log('角色ID：',roleId);
        // 填充编辑表单
        $('#editMenuId').val(menuId);
        $('#editMenuName').val(name);
        $('#editRoleId').val(roleId); // 确保这里的值与select中的option的value匹配
        $('#editMenuUrl').val(url);

        // 显示编辑模态框
        $('#editModal').show();
    }

    // 提交编辑表单
    function submitEditForm() {
        // 获取编辑框中的表单数据
        const formData = new FormData(document.getElementById('editMenuForm'));

        // 发送 AJAX 请求保存编辑后的数据
        fetch('editMenu', { // 'editMenu' 是保存编辑后数据的服务器端URL
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (response.ok) {
                    alert('菜单更新成功');
                    closeEditModal(); // 关闭编辑框
                    // 如果更新成功，局部更新页面
                    loadContent('goMenuPage'); // goMenuPage 是返回页面局部内容的action
                } else {
                    throw new Error('菜单更新失败');
                }
            })
            .catch(error => {
                alert('更新过程中出现错误');
                console.error('更新失败:', error);
            });
    }

    // 关闭编辑框
    function closeEditModal() {
        document.getElementById('editModal').style.display = 'none';
    }
    // 初始化编辑按钮事件
    window.onload = function() {
        setupEditButtons();
    };



    function deleteMenu(menuId) {
        console.log(menuId)
        if (confirm('确定要删除这个菜单吗？')) {
            var formData = new FormData();
            formData.append('menuId', menuId);

            fetch('deleteMenu', {
                method: 'POST',
                body: formData
            })
                .then(response => {
                    if (response.ok) {
                        alert('删除成功');
                        loadContent('goMenuPage'); // goMenuPage 是返回页面局部内容的action
                    } else {
                        throw new Error('删除失败');
                    }
                })
                .catch(error => {
                    alert('删除过程中出现错误');
                    console.error('删除失败:', error);
                });
        }
    }

</script>
</body>
</html>
