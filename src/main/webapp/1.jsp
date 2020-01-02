<%@page contentType="text/html;UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="app" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!--bootstrap核心css-->
    <link rel="stylesheet" href="${app}/boot/css/bootstrap.min.css">
    <!--jqGrid-->
    <link rel="stylesheet" href="${app}/jqGrid/css/trirand/ui.jqgrid-bootstrap.css">
    <!--jquery.js-->
    <script src="${app}/boot/js/jquery-3.1.1.min.js"></script>
    <!--bootstrap.js-->
    <script src="${app}/boot/js/bootstrap.min.js"></script>
    <!--国际化-->
    <script src="${app}/jqGrid/js/trirand/i18n/grid.locale-cn.js"></script>
    <!--jqGrid核心js-->
    <script src="${app}/jqGrid/js/trirand/jquery.jqGrid.min.js"></script>

    <script>


    </script>
    <title>Title</title>

</head>
<body>
<!--导航栏-->
        <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="" class="navbar-brand">
                    <span>后台管理系统</span>
                </a>
                <button class="navbar-toggle collapsed" data-toggle="collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="">欢迎:小黑</a></li>
                <li>
                    <a href="">
                        <span class="glyphicon glyphicon-hand-right"></span>
                        退出登录
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container-fluid text-center">
    <!--左侧管理系统-->
    <div class="row">

        <div class="col-sm-2">

            <div class="panel-group" id="parent">
                <!--图书管理-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <a href="#first" data-toggle="collapse" data-parent="#parent">
                                用户管理
                            </a>
                        </h3>
                    </div>
                    <div id="first"  class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="btn-group-vertical">
                                <!--
                                    javascrip:void(0):阻止页面提交
                                    $('#my2').load('2.jsp'):
                                    让这个div去加载别的页面
                                -->
                                <a href="javascript:void(0)" onclick="$('#my2').load('3.jsp')" class="btn btn-primary">用户列表</a>
                                <button class="btn btn-default text-center">用户列表</button>
                                <button class="btn btn-default text-center">用户列表</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--类别管理-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <a href="#send" data-toggle="collapse" data-parent="#parent">
                                类别管理
                            </a>
                        </h3>
                    </div>
                    <div class="panel-collapse collapse" id="send">
                        <div class="panel-body">
                            <div class="btn-group-vertical">
                                <a href="" class="btn btn-default">1</a>
                                <a href="" class="btn btn-default">1</a>
                                <a href="" class="btn btn-default">1</a>
                                <a href="" class="btn btn-default">1</a>
                            </div>

                        </div>
                    </div>
                </div>
                <!--图书管理-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <a href="#third" data-toggle="collapse" data-parent="#parent">
                                图书管理
                            </a>
                        </h3>
                    </div>
                    <div class="panel-collapse collapse" id="third">
                        <div class="panel-body">
                            <div class="btn-group-vertical">
                                <button class="btn btn-default">1</button>
                                <button class="btn btn-default">1</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <!--右1-->
        <div class="col-sm-10" id="my2">
            <div class="jumbotron">
                <div class="container">
                    <h1>Hello,Word!</h1>
                    <p>.....</p>
                    <p><a href="" class="btn btn-primary btn-lg">Learn more</a></p>
                </div>
            </div>
            <!--右2-->
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert">x</button>
                <h4>Oh snap! You got an error!</h4>
                <p>Change this and that and try again. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                <p>
                    <button type="button" class="btn btn-danger">Take this action</button>
                    <button type="button" class="btn btn-danger">Or do this</button>
                </p>
            </div>


            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">系统状态</h4>
                </div>
                <div class="panel-body panel-danger" style="background:#ebccd1"></div>
            </div>
            <!--右三-->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">系统状态</h3>
                </div>
                <div class="panel-body">
                    内存使用率
                    <div class="progress">
                        <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                            <span class="sr-only">40% Complete (success)</span>
                        </div>
                    </div>
                    数据库使用率
                    <div class="progress">
                        <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                            <span class="sr-only">20% Complete</span>
                        </div>
                    </div>
                    磁盘使用率
                    <div class="progress">
                        <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                            <span class="sr-only">60% Complete (warning)</span>
                        </div>
                    </div>
                    CPU使用率
                    <div class="progress">
                        <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                            <span class="sr-only">80% Complete (danger)</span>
                        </div>
                    </div>
                </div>
            </div>

         </div>


      </div>

    </div>
</body>
</html> 