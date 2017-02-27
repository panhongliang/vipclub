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
                <a href="/customer/toAdd" class="active">
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
           <form class="form-horizontal row J_ajax_form" role="form" method="post" action="/customer/add">
			<h2>
				基础资料
				<img src="/assets/i/top_shadow.png" alt="">
			</h2>
            <div class="vip_reg_main_part_1">
                    <div class="row ">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="realname" class="col-sm-3 control-label">客户姓名</label>
                                <div class="col-sm-9">
                                    <input name="name" id="realname" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="sex" class="col-sm-3 control-label">性别</label>
                                <div class="col-sm-9">
                                    <select name="sex" class="form-control input-sm">
                                    	<option value="男">男</option>
                                    	<option value="女">女</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="birthday" class="col-sm-3 control-label">生日</label>
                                <div class="col-sm-9">
                                    <input name="birthday" id="birthday" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="age" class="col-sm-3 control-label">年龄</label>
                                <div class="col-sm-9">
                                    <input name="age" id="age" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="mobile" class="col-sm-3 control-label">手机号</label>
                                <div class="col-sm-9">
                                    <input name="mobile" id="mobile" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="qq" class="col-sm-3 control-label">QQ</label>
                                <div class="col-sm-9">
                                    <input name="qq" id="qq" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="email" class="col-sm-3 control-label">邮箱</label>
                                <div class="col-sm-9">
                                    <input name="email" id="email" type="email" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="company" class="col-sm-3 control-label">工作单位</label>
                                <div class="col-sm-9">
                                    <input name="workunit" id="company" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="address" class="col-sm-3 control-label">家庭住址</label>
                                <div class="col-sm-9">
                                    <input name="address" id="address" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
              
            </div>
             
             
             <h2>
                        会员信息
                        <img src="/assets/i/top_shadow.png" alt="">
                    </h2>
                    <div class="vip_reg_main_part_2">
                
                    <div class="row ">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="card_num" class="col-sm-3 control-label">会员卡号</label>
                                <div class="col-sm-9">
                                    <input name="idcard" id="card_num" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="cat" class="col-sm-3 control-label">客户分类</label>
                                <div class="col-sm-9">
			                      <select name="cuStyle" id="doc-select-1" class="form-control" >
			                      	<option value="0">--请选择--</option>
			                      	<c:forEach items="${clientCate}" var="item">
										<option value="${item.dicKey}">${item.dicName}</option>
			                      	</c:forEach>
			                      </select>                                         
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="remark" class="col-sm-3 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="remark" rows="5" id="remark" class="form-control input-sm"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row submit">
                        <div class="col-sm-3 col-sm-offset-3">
                            <button type="submit" class="button button-pill button-primary btn-submit button-small">提交</button>
                        </div>
                        <div class="col-sm-3 col-end">
                            <button onclick="window.location.href='/customer/toList'" type="button" class="button button-pill button-primary btn-cancel button-small">取消</button>
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