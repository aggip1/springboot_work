<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html;UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <script src="${app}/boot/js/jquery-3.1.1.min.js"></script>
    <script>
        //声明一个变量，下面的时候通过算术方法改变变量的值
        var current = 0;
        //初始化数据
        var timer = null;
        var pre = null;
        var nex = null;
        $(document).ready(function () {
            var li_v = $('.slideshow ul li');
            var i_v = $('.ra-show i');

            //设置自动播放
            function mover() {
                //首先清除当前current以外的li_v的样式显示和伪圆标i_v的效果, 以下的同上
                li_v.hide();
                //                i_v.eq(current).removeClass("active");
                i_v.removeClass("active");
                current = (current + 1) % (li_v.length);
                console.log(current);
                //当鼠标放在伪圆标时候获取当前的索引值，并把它赋给current从而实现了移出鼠标的时候跳转到下一个图片轮播
                i_v.mouseover(function () {
                    current = $(this).index();
                    //                    console.log($(this).index());
                });
                //当鼠标放在伪圆标时候获取当前的索引值，并把它赋给current从而实现下一个图片轮播
                li_v.eq(current).fadeIn(1000);
                i_v.eq(current).addClass("active");
            };
            //设置自动轮播
            timer = setInterval(mover, 2000);
            //鼠标划入的时候停止轮播
            li_v.mouseover(function () {
                clearInterval(timer);
            });
            //鼠标移出的时候继续轮播
            li_v.mouseout(function () {
                timer = setInterval(mover, 2000);
            });
            //实现左右按钮事件
            //点击左按钮事件
            $(".last-img").click(function () {
                //    首先清除定时器
                clearInterval(timer);
                clearInterval(pre);

                //实现点击按钮显示上一个图片代码
                function last_v() {
                    li_v.hide();
                    i_v.removeClass("active");
                    current = (current - 1 + li_v.length) % (li_v.length);
                    //console.log(current);
                    li_v.eq(current).fadeIn(1000);
                    i_v.eq(current).addClass("active");
                };
                pre = setTimeout(last_v, 10);
                timer = setInterval(mover, 2000);
            });
            //点击右按钮事件
            //只需继续轮播就可以
            $(".next-img").click(function () {
                //    首先清除定时器
                clearInterval(timer);
                clearInterval(nex);
                //console.log(current);
                //调用自动轮播的代码和点击上一张图片代码的setTimeout
                nex = setTimeout(mover, 10);
                timer = setInterval(mover, 2000);
            });
            //添加伪类下标圆标动事件
            //鼠标碰到伪圆标的时候显示所对应的图片并且停止页面。
            i_v.mouseover(function () {
                clearInterval(timer);
                i_v.removeClass("active");
                li_v.hide();
                li_v.eq($(this).index()).fadeIn(1000);
                $(this).addClass("active");
                //console.log($(this).index());
            });
        });
    </script>
</head>
<body>

<div class="slideshow">
    <div class="btn">
        <span class="last-img">&lt;</span><span class="next-img">&gt;</span>
    </div>
    <div class="ra-show">
        <i class="active">1</i>
        <i>2</i>
        <i>3</i>
        <i>4</i>
        <i>5</i>
    </div>
    <ul>
        <li style="display: block;">
            <a href="#"><img src="${app}/img/1.png"/></a>
        </li>
        <li>
            <a href="#"><img src="${app}/img/2.png"/></a>
        </li>

    </ul>
</div>


</body>
</html>