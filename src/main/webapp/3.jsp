<%@page contentType="text/html;UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!--jquery.js-->
<script>

        $(function () {
            $("#list").jqGrid({
                datatype:"json",
                styleUI:"Bootstrap",
                autowidth:true,
                url:"${pageContext.request.contextPath}/emp/showAll",
                celledit:true,
                colNames:["编号","姓名","密码","生日"],
                colModel:[
                    {name:"id"},
                    {name:"name"},
                    {name:"password"},
                    {name:"birthday"},
                ]
            })
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
         <table id="list"></table>

        </div>

        <div class="panel-footer" style="background:white">
            <div id="pagers"></div>
        </div>
    </div>
</div>

