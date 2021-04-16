<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setAttribute("path", request.getContextPath());
%>
<!--中心内容-->
<div class="col-sm-10">

    <!--页头-->
    <div class="page-header" style="margin-top: -20px">
        <h1>员工列表</h1>
    </div>

    <!--标签页组件-->
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                                  data-toggle="tab">员工列表</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="home">
            <script>
                $(function () {
                    //初始化表格 并查询所有
                    $("#empList").jqGrid({
                        styleUI: "Bootstrap",
                        url: "${path}/e/findAll",
                        datatype: "json",
                        mtype: "post",
                        colNames: ["编号", "姓名", "工资", "年龄", "生日", "部门", "标签", "操作"],
                        colModel: [
                            {name: "id", search: false},
                            {name: "name", editable: true},
                            {name: "salary", editable: true},
                            {name: "age", editable: true},
                            {name: "bir", editable: true},
                            {
                                name: "dept.id", editable: true, edittype: "select", editoptions: {
                                    multiple: false,
                                    dataUrl: "${path}/d/qa2",//select
                                },
                                formatter: function (value, options, row) {
                                    if (row.dept) return row.dept.name;
                                }
                            },
                            {
                                name: "taglist", editable: true, edittype: "select", editoptions: {
                                    multiple: true,
                                    dataUrl: "${path}/t/qa2",//select
                                },
                                formatter: function (value, options, row) {
                                    var aa = "";
                                    if (row.tags) {
                                        for (let i = 0; i < row.tags.length; i++) {
                                            console.log("name/" + row.tags[i].tag);
                                            aa += row.tags[i].tag + ",";
                                        }
                                    }
                                    return aa;
                                }, search: false
                            },
                            {
                                name: "options",
                                formatter: function (value, options, row) {
                                    return `` +
                                        `<button class="btn btn-primary" onclick="editRow('` + row.id + `');">修改</button>&nbsp;&nbsp;` +
                                        `<button class="btn btn-danger" onclick="delRow('` + row.id + `');">删除</button>`;
                                }, search: false
                            },
                        ],
                        pager: "#pager",
                        rowNum: 2,
                        rowList: [1, 2, 3, 4, 5],
                        viewrecords: true,
                        caption: "员工列表",
                        //cellEdit: true,//开启单元格编辑功能
                        editurl: "${path}/e/edit",
                        autowidth: true,
                        autoheight: true,
                       /* toolbar:[true,'top'],
                        gridComplete:function () {
                            $("#t_empList").empty().append("<button class='btn btn-warning' onclick='saveRow();'>添加</button>")
                        }*/

                    }).navGrid(
                        '#pager',//参数1: 分页工具栏id
                        {add: true},   //参数2:开启工具栏编辑按钮
                        {closeAfterEdit: true, reloadAfterSubmit: true},//编辑面板的配置
                        {closeAfterAdd: true, reloadAfterSubmit: true},//添加面板的配置
                        {},//删除的配置
                        {
                            sopt: ['eq', 'ne', 'cn']
                        },//搜索的配置
                    );
                });

                //添加一行
                function saveRow() {
                    $("#empList").jqGrid('editGridRow', "new", {
                        height: 500,
                        reloadAfterSubmit: true,
                        closeAfterAdd: true
                    });
                }

                //删除一行
                function delRow(id) {
                    if (window.confirm("您确定要删除吗?")) {
                        //发送ajax请求删除
                        $.post("${path}/e/edit", {id: id, oper: "del"}, function () {
                            //刷新表格
                            $("#empList").trigger('reloadGrid');//刷新表格
                        });
                    }

                }

                //修改一行
                function editRow(id) {
                    console.log(id);
                    $("#empList").jqGrid('editGridRow', id, {
                        height: 500,
                        reloadAfterSubmit: true,
                        closeAfterEdit: true,
                    });
                }
            </script>

            <div class="col-sm-10">

            <%--    <div class="page-header">
                    <h1>员工列表</h1>
                </div>--%>

                <%--员工列表--%>
                <table id="empList"></table>

                <%--分页工具栏--%>
                <div id="pager"></div>

            </div>
        </div>
        <%--订单添加选项卡--%>
    </div>
</div>


