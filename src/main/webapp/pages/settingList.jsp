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
    <title>XXXX会所欢迎您</title>

    <!-- Bootstrap -->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
    <![endif]-->
    <link href="/assets/css/buttons.css" rel="stylesheet">
    <link href="/assets/icomoon/style.css" rel="stylesheet">
    <link href="/assets/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">
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
<div class="vip_serach_main_wrap am-vertical-align" >
   <div class="am-vertical-align-middle">
       <div class="vip_serach_main">
        <h2>
			会员分类
            <img src="/assets/i/top_shadow.png" alt="">
            <button class="button button-pill button-primary button-tiny" onclick="window.location.href='/dic/toAdd'">添加</button>
        </h2>
         
      <table class="table table-radius table-striped table-bordered">
            <thead>
                <tr>
                    <th width="30%">分类</th>
                    <th width="30%">名称</th>
                    <th width="20%">值</th>
                    <th width="20%">操作</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="dic" items="${dicList}">
                <tr>
                    <td>${dic.dicGroup}</td>
                    <td>${dic.dicName}</td>
                    <td>${dic.dicKey}</td>
                    <td>
                        <button type="button" class="button button-pill button-primary button-tiny btn-edit" 
                        onclick="window.location.href='/dic/toEdit?id=${dic.id}'" data-id="${dic.id}"><i class="am-icon-edit"></i> 编辑</button>                        
                        <button type="button" class="button button-pill button-primary button-tiny btn-delete J_user_remove" 
                        data-id="${dic.id}"><i class="am-icon-edit"></i> 删除</button>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
   </div>
   </div>
</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/assets/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script src="/assets/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>   
    <script src="/assets/js/app.js"></script>
  </body>
  
  <script type="text/javascript">
  $(function () {
	  $(".J_user_remove").click(function () {
		if(confirm('您确定要删除么？')){
			var id = $(this).attr("data-id");
			var url = "/dic/remove?id=" + id;
			$.ajax({url: url, 
				success: function (rep) {
					if (rep.code !=0) {
						alert(rep.msg);
					} else {
						window.location.href=rep.msg;
					}
				}
			});
		}
	  });
  });
  </script>
</html>
