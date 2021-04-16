<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setAttribute("path", request.getContextPath());
%>
<script>
    $(function () {
        /* $("#btn").click(function(){
             //用来根据指定url,将页面源码包含到当前指定选择器中  被包含的页面中不能有其他额外标签或样式
             $("#content").load("./users/dept_list.jsp");
         });*/
        //切换样式
        $(".list-group").on("click", ".list-group-item", function () {
            //去掉所有
            $(".list-group-item").removeClass().addClass("list-group-item");
            //点击激活
            $(this).addClass("active");
        });

        ttl();
    });

    function ttl() {
        $.post("${path}/t/qa", function (date) {
            console.log(date);
            $('#tagid').empty();
            for (var i = 0; i < date.length; i++) {
                console.log(date[i].tag);
                console.log(date[i].id);
                $('#tagid').append($('<div class="alert alert-info alert-dismissible col-sm-1 aa " title="' + date[i].id + '" onclick="ftagid(this)">\n<button class="close" data-dismiss="alert"><span>&times;</span></button>\n' + date[i].tag + '\n</div>&nbsp;'));
            }
        }, "json");
    }

    function ftagid(t) {
        /*console.log("t/" + t)
        console.log("t2/" + $(t).prop("title"))*/
        $.post('${path}/t/del', {iddir: $(t).prop("title")}, function () {
            console.log("ftagid1");
            ttl();
        });
    }

    function add() {
        console.log($('#added').val());
        $.post("${path}/t/add", 'tag=' + $('#added').val(), function () {
            console.log("add1");
            ttl();
        });
    }
</script>
<!--栅格容器-->
<div class="col-sm-10">
    <!--内容填充-->
    <h2 style="float: left ;clear: left"><strong>TAG标签管理</strong></h2><br>
    <div class="col-sm-12">
        <form class="navbar-form navbar-left " style="clear: left">
            <div class="form-group">
                <input class="form-control" placeholder="Search" type="text" id="added">
            </div>
            <button class="btn btn-default" type="button" onclick="add()">添加</button>
        </form>
    </div>
    <br>
    <br>
    <div id="tagid">
    </div>

    <br>
    <div style="text-align: center; clear: left">
        <span>tfvjuuyk kgukgtgyumbdbshbtrrtbrtht</span>
    </div>
</div>