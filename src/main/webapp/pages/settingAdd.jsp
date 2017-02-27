<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>会员登记</title>

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
   
   <div class="main-top-nav">
    <div class="row">
            <div class="col-sm-3 col-md-3 col-lg-3">
                <a href="/customer/toAdd">
                    <i class="icon icon-vip_reg"></i>
                    <h3>会员登记</h3>
                </a>
            </div>
            <div class="col-sm-3 col-md-3 col-lg-3">
                <a href="/customer/toList" >
                    <i class="icon icon-vip_search"></i>
                    <h3>会员查询</h3>
                </a>
            </div>
            <div class="col-sm-3 col-md-3 col-lg-3">
                <a href="/customer/toList">
                    <i class="icon icon-vip_manage"></i>
                    <h3>帐号管理</h3>
                </a>
            </div>
            <div class="col-sm-3 col-md-3 col-lg-3">
                <a href="/dic/toList" class="active">
                    <i class="icon icon-vip_set"></i>
                    <h3>会员设置</h3>
                </a>
            </div>
        </div>
</div>

<div class="top-nav">
  <button class="button button-pill button-small">
        <a href="/index">
            <i class="icon fa fa-home"></i>
              	首页
        </a>
    </button>
</div>
      

<div class="vip_reg_main_wrap am-vertical-align">
    <div class="am-vertical-align-middle">
        <div class="vip_reg_main">
           <form class="form-horizontal row J_ajax_form" role="form" method="post" action="/dic/add">
			<h2>
				会员分类添加
				<img src="/assets/i/top_shadow.png" alt="">
			</h2>
            <div class="vip_reg_main_part_2">
                    <div class="row ">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="realname" class="col-sm-3 control-label">分类组</label>
                                <div class="col-sm-9">
                                    <input value="${DIC}" readonly="readonly" name="dicGroup" id="realname" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="sex" class="col-sm-3 control-label">选项名</label>
                                <div class="col-sm-9">
                                    <input name="dicName" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="realname" class="col-sm-3 control-label">值</label>
                                <div class="col-sm-9">
                                    <input name="dicKey" id="realname" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                    </div>                    
                    <div class="row submit">
                        <div class="col-sm-3 col-sm-offset-3">
                            <button type="submit" class="button button-pill button-primary btn-submit button-small">提交</button>
                        </div>
                        <div class="col-sm-3 col-end">
                            <button type="button" class="button button-pill button-primary btn-cancel button-small" onclick="window.location.href='/dic/toList'">取消</button>
                        </div>
                    </div>                    
            </div>
            </form>
        </div>
    </div>
</div>   
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/assets/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/app.js"></script>
    <script src="/assets/js/ajaxform.js"></script>
  </body>
</html>