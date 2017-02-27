<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>XXXX会所欢迎您</title>

    <!-- Bootstrap -->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
    <![endif]-->
    <link href="/assets/css/buttons.css" rel="stylesheet">
    <link href="/assets/icomoon/style.css" rel="stylesheet">
    <link href="/assets/css/app.css" rel="stylesheet">
    
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
<div class="top-nav">
  <button class="button button-pill button-small" onclick="window.location.href='/user/logout'">
      <i class="icon fa fa-cog"></i>
      	退出
    </button>
</div>
      
<div class="main-wrap am-vertical-align">
  <div class="main am-vertical-align-middle">
      <img src="/assets/i/title.png" alt="">
      <div class="menu">
        <div class="row">
            <div class="col-sm-3 col-md-3 col-lg-3">
                <a href="/customer/toAdd">
                    <i class="icon icon-vip_reg"></i>
                    <h3>会员登记</h3>
                </a>
            </div>
            <div class="col-sm-3 col-md-3 col-lg-3">
                <a href="/customer/toList">
                    <i class="icon icon-vip_search"></i>
                    <h3>会员查询</h3>
                </a>

            </div>
            <div class="col-sm-3 col-md-3 col-lg-3">
                <a href="/user/toList">
                    <i class="icon icon-vip_manage"></i>
                    <h3>帐号管理</h3>
                </a>

            </div>
            <div class="col-sm-3 col-md-3 col-lg-3">
                <a href="/dic/toList">
                    <i class="icon icon-vip_set"></i>
                    <h3>会员设置</h3>
                </a>

            </div>
        </div>
</div>
  </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/assets/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/app.js"></script>
  </body>
</html>