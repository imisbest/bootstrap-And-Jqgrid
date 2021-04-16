<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setAttribute("path", request.getContextPath());
%>
<script>
    $(function () {

        /*部门表查询所有*/
        $('#dept_list1').click(function () {
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
<!--中心内容-->
<div class="col-sm-10">

    <!--页头-->
    <div class="page-header" style="margin-top: -20px">
        <h1>部门列表</h1>
    </div>

    <!--标签页组件-->
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"
                                                  id="dept_list1">部门列表</a></li>
        <li role="presentation"  class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" id="dept_add">

            <button class="btn list-group-item" data-target="#exampleModal" data-toggle="modal" data-whatever="@mdo"
                    type="button">
                部门添加
            </button>
        </a>
        </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane " id="home">
            <!--table-->
            <table class="table table-bordered">
                <thead>
                <tr id="thead">
                </tr>
                </thead>
                <tbody id="tbody">
                </tbody>
            </table>

        </div>
        <div role="tabpanel" class="tab-pane active" id="profile">
            请点击部门添加
        </div>
    </div>


</div>
