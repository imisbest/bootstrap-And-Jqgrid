<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>系统主页</title>
    <!--引入bootstrap css-->
    <link rel="stylesheet" href="${path}/statics/bootstrap/css/bootstrap.min.css">
    <!--引入jqgrid的bootstrap css-->
    <link rel="stylesheet" href="${path}/statics/jqgrid/css/ui.jqgrid-bootstrap.css">
    <!--引入jquery核心js-->
    <script src="${path}/statics/js/jquery-3.4.1.min.js"></script>
    <!--引入jqgrid核心js-->
    <script src="${path}/statics/jqgrid/js/jquery.jqGrid.min.js"></script>
    <!--引入jqgrid国际化js-->
    <script src="${path}/statics/jqgrid/i18n/grid.locale-cn.js"></script>
    <!--引入bootstrap组件js-->
    <script src="${path}/statics/bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(function () {

            /*//切换样式*/
            $(".list-group").on("click", ".list-group-item", function () {
                //去掉所有
                $(".list-group-item").removeClass().addClass("list-group-item");
                //点击激活
                $(this).addClass("active");
            });
            /*<!--添加用户模态框-->*/
            $('#exampleModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var recipient = button.data('whatever');
                var modal = $(this);
                modal.find('.modal-title').text('New message to ' + recipient);
                modal.find('.modal-body input').val(recipient)
            })
            /*部门表查询所有*/
            $('#dept_list').click(function () {
                $.post('${path}/d/qa', function (data) {
                    console.log(data);
                    $('#thead').empty();
                    $('#tbody').empty();
                    $('#thead').append($('<th>部门ID</th>')).append($('<th>部门名称</th>'));
                    for (var i = 0; i < data.length; i++) {
                        $('#tbody').append($('<tr><td>' + data[i].id + '</td><td>' + data[i].name + '</td></tr>'));
                    }
                }, 'json');
            });
            /*   */
        });
    </script>
</head>
<body>
<!--导航栏-->
<nav class="navbar navbar-default">
    <div class="container-fluid">

        <div class="navbar-header">
            <a class="navbar-brand" href="${path}/home.jsp">bootstrap整合系统 <small>V1.0</small></a>
        </div>


        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">欢迎:</a></li>
                <li><a href="#">退出 <span class="glyphicon glyphicon-log-out"></span></a></li>
            </ul>
        </div>
    </div>
</nav>

<!--布局系统 中心内容-->
<div class="container-fluid">
    <div class="row">
        <!--菜单-->
        <div class="col-sm-2">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <%--部门管理--%>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                               aria-expanded="true" aria-controls="collapseOne">
                                部门管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="javascript:$('#content').load('${path}/deptm/dept_list.jsp');" id="dept_list"
                                   class="list-group-item active">
                                    部门列表
                                </a>
                                <a href="javascript:$('#content').load('${path}/deptm/dept_add.jsp');" id="dept_add"
                                   class="list-group-item">
                                    <button class="btn list-group-item" data-target="#exampleModal" data-toggle="modal"
                                            data-whatever="@mdo"
                                            type="button">
                                        部门添加
                                    </button>

                                </a>
                            </div>

                        </div>
                    </div>
                </div>
                <%--部门管理--%>
                <%--标签管理--%>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                标签管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="javascript:$('#content').load('${path}/tagm/tag.jsp');"
                                   class="list-group-item active">
                                    标签列表
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <%--标签管理--%>
                <%--员工管理--%>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                员工管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingThree">
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="javascript:$('#content').load('${path}/empm/emp.jsp');"
                                   class="list-group-item active">
                                    员工列表
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--员工管理--%>
        </div>
        <!--中心内容-->
        <div id="content">
            <div class="col-sm-10">

                <!--巨幕-->
                <div class="jumbotron">
                    <h1>Hello, world!</h1>
                    <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to
                        featured content or information.</p>
                    <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
                </div>

                <!--带有按钮警告框-->
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h3>Warning!</h3>
                    <p>Better check yourself, you're not looking too good.</p>
                    <p>
                        <button class="btn btn-danger">立即处理</button>
                        <button class="btn btn-default">稍后修复</button>
                    </p>
                </div>

                <!--面板 带有标题面板-->
                <div class="panel panel-default">
                    <div class="panel-heading">系统状态:</div>
                    <div class="panel-body">
                        <!--进度条-->
                        <label>系统使用率:</label>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                 aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                40%<span class="sr-only">40% Complete (success)</span>
                            </div>
                        </div>
                        <label>CPU使用率:</label>
                        <div class="progress">
                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                 aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                20%<span class="sr-only">20% Complete</span>
                            </div>
                        </div>
                        <label>磁盘使用率:</label>
                        <div class="progress">
                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
                                 aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                60%<span class="sr-only">60% Complete (warning)</span>
                            </div>
                        </div>
                        <label>数据库使用率:</label>
                        <div class="progress">
                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                 aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                80%<span class="sr-only">80% Complete (danger)</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--用户添加模态框-->
<div aria-labelledby="exampleModalLabel" class="modal fade" id="exampleModal" role="dialog" tabindex="-1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-label="Close" class="close" data-dismiss="modal" type="button"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="exampleModalLabel">添加部门</h4>
            </div>
            <div class="modal-body">
                <form action="${path}/d/add" method="post">
                    <div class="form-group">
                        <label class="control-label" for="recipient-name">部门名称:</label>
                        <input class="form-control" id="recipient-name" placeholder="请输入部门名称" type="text"
                               name="deptname">
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-default" data-dismiss="modal" type="button">关闭</button>
                        <button class="btn btn-primary" type="submit">提交</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>