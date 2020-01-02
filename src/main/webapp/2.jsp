<%@page contentType="text/html;UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    //将查所有的方法封装成一个方法
    function init() {
        //将input框清空
        $("#myTbody").empty();
        $.ajax({
            url: "${pageContext.request.contextPath}/user/showAll",
            datatype: "json",
            success: function (data) {
                //将数据添加进tbody表格中
                /*
                data:是数据
                index:下标
                item:获取到的集合
                * */
                $.each(data, function (index, item) {
                    if (item.state == 1) {
                        item.state = "激活";
                    } else {
                        item.state = "未激活";
                    }
                    $("#myTbody").append(
                        $("<tr>" +
                            "<td>" + item.id + "</td>" +
                            "<td>" + item.name + "</td>" +
                            "<td>" + item.password + "</td>" +
                            "<td>" + item.birthday + "</td>" +
                            "<td>" + item.phone + "</td>" +
                            "<td>" + item.state + "</td>" +
                            "<td><button id='"+item.id+"' onclick='update(this)' data-toggle='modal' data-target='#xiugai' class='btn btn-primary' >修改</button><button id='"+item.id+"' onclick='shanchu(this)' class='btn btn-primary'>删除</button>" +
                            "</td>" +
                            "</tr>")
                    )
                })
            }
        });
    }
    //查一个
    function update(duix){
        console.log();
        var id=$(duix).attr("id");
        $.ajax({
            url:"${pageContext.request.contextPath}/user/showOneUser",
            type:"POST",
            data:"id="+id,

            success:function(data){
                $("#id1").val(data.id);
                $("#name").val(data.name);
                $("#psw").val(data.password);
                $("#bir").val(data.birthday);
                $("#phe").val(data.phone);
                $("#se").val(data.state);
            },
            datatype:"json"
        });
    }
    //修改
    function baocun(){
        var serialize = $("#saveFrom").serialize();
        $.ajax({
            url:"${pageContext.request.contextPath}/user/updateUser",
            type:"POST",
            data:serialize,
            success:function(data){
                $("#xiugai").modal("hide");
                //接收数据
                init();

            },
            datatype:"json"

        });
    }

    //删除
    function shanchu(item){

        var a=$(item).attr("id")
        $.ajax({
            url:"${pageContext.request.contextPath}/user/removeUser",
            type:"POST",
            data:{"id":a},
            success:function(data){
                init();
            },
            datatype:"json"

        })
    }

    //页面加载
    $(function () {


        //页面加载发送ajax请求查看所有对象
        init();

        /*
        * 添加用户信息
        * */
        $("#addMod").click(function () {
            //获取表单所有数据
            var serialize = $("#addForm").serialize();

            $.ajax({
                url: "${pageContext.request.contextPath}/user/addUser",
                type: "post",
                data: serialize,
                success: function (data) {
                    //让模态框隐藏
                    $("#tianjia").modal("hide");
                    //调用查所有
                    init();
                    //将input框东西清掉
                    $("#addForm")[0].reset();

                },
                datatype: "json"
            });
        });

        //模糊查询
        $("#chaxun").click(function(){


            $.ajax({
                url:"${pageContext.request.contextPath}/user/showLike",
                datatype:"json",
                data: $("#chaxunForm").serialize(),
                success:function(data){

                    $("#myTbody").empty();

                    $.each(data, function (index, item) {
                        if (item.state == 1) {
                            item.state = "激活";
                        } else {
                            item.state = "未激活";
                        }
                        $("#myTbody").append(
                            $("<tr>" +
                                "<td>" + item.id + "</td>" +
                                "<td>" + item.name + "</td>" +
                                "<td>" + item.password + "</td>" +
                                "<td>" + item.birthday + "</td>" +
                                "<td>" + item.phone + "</td>" +
                                "<td>" + item.state + "</td>" +
                                "<td><button id='"+item.id+"' onclick='update(this)' data-toggle='modal' data-target='#xiugai' class='btn btn-primary' >修改</button><button id='"+item.id+"' onclick='shanchu(this)' class='btn btn-primary'>删除</button>" +
                                "</td>" +
                                "</tr>")
                        )
                    })
                },

            })
        });

    });

</script>

<style>

    td {
        text-align: center;
    }

    th {
        text-align: center;
    }
</style>


<!--右1-->
<div class="col-sm-10">
    <div class="page-header" style="margin-top:-16px">
        <h3>用户管理</h3>
    </div>

    <ul class="nav nav-tabs">
        <li class="active"><a href="#showUser">用户列表</a></li>
        <li><a href="" data-toggle="modal" data-target="#tianjia">用户添加</a></li>
    </ul>

    <div class="panel panel-default">
        <div class="panel-heading" align="center" id="showUser">
            <form class="form-inline" id="chaxunForm" method="get">
                <div class="form-group">
                    <label for="exampleInputName2">姓名</label>
                    <input type="text" class="form-control" name="name" id="exampleInputName2">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">手机</label>
                    <input type="text" class="form-control" id="exampleInputEmail2" name="phone">
                </div>

                <label for="" class="control-label">激活状态 </label>
                <select name="state" id="" class="form-control">

                    <option value="0">---请选择---</option>
                    <option value="1">激活</option>
                    <option value="2">未激活</option>
                </select>
                <button type="button" id="chaxun" class="btn btn-primary">查询</button>
            </form>

        </div>
        <div class="panel-body">


            <!-- Table -->
            <table class="table table-bordered" style="text-align: center">
                <thead>
                <tr>
                    <th>id</th>
                    <th>姓名</th>
                    <th>密码</th>
                    <th>生日</th>
                    <th>手机</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="myTbody">

                </tbody>

            </table>

        </div>

        <div class="panel-footer" style="background:white">
            <nav aria-label="...">
                <ul class="pager">
                    <li><a href="#">上一页</a></li>
                    <li><a href="#">下一页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>


</div>

</div>

<!--添加模态框-->
<div class="modal fade" tabindex="-1" role="dialog" id="tianjia">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">添加用户</h4>
            </div>
            <div class="modal-body">
                <form id="addForm" class="form-horizontal" method="post">
                    <div class="form-group">
                        <label for="name1" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-5">
                            <input type="text" id="name1" class="form-control" name="name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="psw1" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-5">
                            <input type="text" id="psw1" class="form-control" name="password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bir1" class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-5">
                            <input type="date" id="bir1" class="form-control" name="birthday">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phe1" class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-5">
                            <input type="text" id="phe1" class="form-control" name="phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-5">
                            <select name="state" class="form-control">
                                <option value="1">激活</option>
                                <option value="2">未激活</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="addMod">保存</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


<!--修改模态框-->
<div class="modal fade" tabindex="-1" role="dialog" id="xiugai">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改用户</h4>
            </div>
            <div class="modal-body">
                <form action="" class="form-horizontal" id="saveFrom">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">id</label>
                        <div class="col-sm-5">
                            <input type="text" id="id1" class="form-control" name="id" readonly="readonly">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-5">
                            <input type="text" name="name" id="name" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="psw" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-5">
                            <input type="text" id="psw" name="password" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bir" class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-5">
                            <input type="date" id="bir" name="birthday" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phe" class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-5">
                            <input type="text" id="phe" name="phone" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-5">
                            <select name="state" class="form-control" id="se">
                                <option value="1">激活</option>
                                <option value="2">未激活</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"  onclick="baocun();">保存</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>