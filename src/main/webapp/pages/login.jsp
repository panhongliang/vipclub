<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<div class="login-main-wrap am-vertical-align">
		<div class="login-main am-vertical-align-middle">
			<img src="/assets/i/title.png" alt="">
			<form class="form-horizontal J_ajax_form" method="post" action="/user/login">
				<div class="form-group">
					<label for="account" class="control-label col-sm-2"><i class="icon fa fa-user"></i></label>
					<div class="col-sm-10">
						<input name="account" type="text" id="account" placeholder="帐号" class="form-control">
					</div>
				</div>

				<div class="form-group">
					<label for="password" class="control-label col-sm-2"><i class="icon fa fa-lock"></i></label>
					<div class="col-sm-10">
						<input name="password" type="password" id="password" placeholder="密码" class="form-control">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-12 ">
						<button type="submit" class="button button-pill button-primary">提交登入</button>
					</div>
				</div>
			</form>
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