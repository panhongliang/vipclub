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
                <a href="/customer/toList" class="active">
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
<div class="vip_serach_main_wrap am-vertical-align" >
   <div class="am-vertical-align-middle">
       <div class="vip_serach_main">
        <h2>
			会员查询
            <img src="/assets/i/top_shadow.png" alt="">
        </h2>
        <form class="form-horizontal row" role="form" action="/customer/toList">
          <div class="form-group col-sm-4">
            <input name="keyword" type="text" class="form-control" placeholder="请输入 姓名、手机号或会员卡" value="${keyword}">
          </div>

          <div class="form-group col-sm-6">
              <div class="row">
                  <label for="doc-select-1" class="col-sm-3 control-label">客户分类</label>
                  <div class="col-sm-9">
                      <select name="cuStyle" id="doc-select-1" class="form-control" >
                      	<option value="0">--请选择--</option>
                      	<c:forEach items="${clientCate}" var="item">
                      		<c:if test="${cuStyle==item.dicKey}">
                        	<option value="${item.dicKey}" selected="selected">${item.dicName}</option>
                        	</c:if>
                      		<c:if test="${cuStyle!=item.dicKey}">
                        	<option value="${item.dicKey}">${item.dicName}</option>
                        	</c:if>                        	
                      	</c:forEach>
                      </select>
                  </div>
              </div>
            </div>
         <div class="col-sm-2">
             <button type="submit" class="button button-pill button-primary button-small">
             <i class="icon fa fa-search"></i> 查询</button>
         </div>
        </form>
         
      <table class="table table-radius table-striped table-bordered">
            <thead>
                <tr>
                    <th>姓名</th>
                    <th>手机号</th>
                    <th>会员卡号</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>生日</th>
                    <th>客户分类</th>
                    <th>最后消费时间</th>
                    <th>操作</th>
                    <th>消费</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.name}</td>
                    <td>${user.mobile}</td>
                    <td>${user.idcard}</td>
                    <td>${user.sex}</td>
                    <td>${user.age}</td>
                    <td>${user.birthday}</td>
                    <td>
                    	<c:forEach items="${clientCate}" var="item">
                    		<c:if test="${item.dicKey==user.cuStyle}">
                    			${item.dicName}
                    		</c:if>
                    	</c:forEach>
                    </td>
                    <c:forEach var="consume" items="${consumeMap}">
                    	<c:if test="${consume.key==user.id}">
                    	<td>
                    	<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${consume.value.buytime}"/>
                    	</td>
                    	</c:if>
                    </c:forEach>
                    <td>
                        <button type="button" class="button button-pill button-primary button-tiny btn-edit" 
                        onclick="window.location.href='/customer/toEdit?customerId=${user.id}'" ><i class="am-icon-edit"></i> 编辑</button>
                        <button type="button" class="button button-pill button-primary button-tiny btn-delete J_expense_delete" data-id="${user.id}"><i class="am-icon-trash"></i> 删除</button>
                      </td>
                    <td>
	                    <button type="button" class="button button-pill button-primary button-tiny btn-add" 
	                    data-toggle="modal" data-target="#doc-modal-1" onclick="setCustomer('${user.id}','${user.sex}','${user.mobile}','${user.age}','${user.name}')">
	 						<i class="am-icon-plus"></i> 添加
						</button>
 						<button type="button" class="J_expense_view button button-pill button-primary button-tiny btn-check" data-toggle="modal"data-toggle="modal"
 						onclick="setCustomer('${user.id}','${user.sex}','${user.mobile}','${user.age}','${user.name}')" 
 						data-id="${user.id}" data-target="#doc-modal-2">
 							<i class="am-icon-eye"></i> 查看
						</button>
					</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <nav aria-label="Page navigation"  style="text-align: center">
          <ul class="pagination">
            <li>
              <a href="/customer/toList?page=${page<=0?0:page-1}&keyword=${keyword}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <c:forEach var="item"  begin="0" end="${totalPages<=0?0:totalPages-1}" step="1">
            	<c:if test="${item==page}">
            		<li class="active">
            	</c:if>
            	<c:if test="${item!=page}">
            		<li>
            	</c:if>
            	<a href="/customer/toList?page=${item}&keyword=${keyword}">${item+1}</a></li>
            </c:forEach>
            <li>
              <a href="/customer/toList?page=${page<totalPages-1?page+1:totalPages-1}&keyword=${keyword}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>        
   </div>
   </div>
</div>

<div class="modal" tabindex="-1" id="doc-modal-1">
  <div class="modal-dialog modal-lg">
   <div class="modal-content">
   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

    <div class="modal-body">
      <div class="add_record">
    <h3>
        <i class="icon fa fa-plus"></i> 添加消费记录
    </h3>

    <div class="add_record_main">
        <div class="info-bar">
            <div class="basic_info">
                <span class="realname J_expense_name"></span>
                <span class="sex J_expense_sex"></span>
                <span class="age J_expense_age"></span>
            </div>
            <img src="/assets/i/avstar.png" alt="" class="avstar">
            <div class="mobile J_expense_mobile"></div>
        </div>

        <form class="form-horizontal am-g" role="form">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="card_num" class="col-sm-4 control-label">消费日期</label>
                        <div class="col-sm-8">
                            <input type="text" name="expenseTime" class="form-control" readonly="readonly"
                            	id="datetimepicker" data-date-format="yyyy-mm-dd hh:ii:ss">
                            <input type="hidden" name="customerId">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row am-margin-top-10">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="cat_2" class="col-sm-4 control-label">消费金额</label>
                        <div class="col-sm-8">
                            <input id="cat_2" type="text" class="form-control" name="money">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row am-margin-top-10">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label for="remark" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <textarea rows="5" id="remark" class="form-control" name="remark"></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row submit">
                <div class="col-sm-3 col-sm-offset-3">
                    <button type="button" class="button button-pill button-primary btn-submit button-small J_submit_expense">提交</button>
                </div>
                <div class="col-sm-3 col-end">
                    <button type="button" class="button button-pill button-primary btn-cancel button-small J_cancle_expense">取消</button>
                </div>
            </div>
        </form>
    </div>

</div>
    </div>
  </div>
  </div>
</div>

<div class="modal" tabindex="-1" id="doc-modal-2">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <div class="modal-body">
      <div class="add_record">
    <h3>
        <i class="icon fa fa-eye"></i> 查看消费记录
    </h3>

    <div class="add_record_main">
        <div class="info-bar">
            <div class="basic_info">
                <span class="realname J_expense_name"></span>
                <span class="sex J_expense_sex"></span>
                <span class="age J_expense_age"></span>
            </div>
            <img src="/assets/i/avstar.png" alt="" class="avstar">
            <div class="mobile J_expense_mobile"></div>
        </div>

        <h4>消费记录</h4>
        <table class="table table-radius table-striped table-bordered table-condensed">
            <thead>
                <tr>
                    <th style="width:30%">日期</th>
                    <th style="width:30%">消费金额</th>
                    <th style="width:40%">备注</th>
                </tr>
            </thead>
            <tbody class="J_expense_table">
            </tbody>
        </table>
        
        <nav aria-label="Page navigation"  style="text-align: center">
  		  <input type="hidden" class="J_selected_customer">
          <ul class="pagination J_expense_pager_bar">
          </ul>
        </nav>
    </div>
</div>
    </div>
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
  function setCustomer (id,sex, mobile, age, name) {
	  $("input[name='customerId']").val(id);
	  $(".J_expense_name").text(name);
	  $(".J_expense_sex").text(sex);
	  $(".J_expense_age").text(age);
	  $(".J_expense_mobile").text(mobile);
	  
	  $(".today").click();
  }
  	$(function () {
  		$('#datetimepicker').datetimepicker({autoclose: true,
  			todayBtn: true,
  			language: 'zh-CN',
  			autoclose: true,
  		});
  		
  		$(".J_submit_expense").click(function () {
  			var expenseTime = $("input[name='expenseTime']").val();
  			var money = $("input[name='money']").val();
  			var remark = $("textarea[name='remark']").val();
  			var customerId = $("input[name='customerId']").val();
  			var url = "/consume/add?customerId=" + customerId + "&expenseTime=" + expenseTime + 
  					"&remark=" + remark + "&money=" + money;
  			
  			$.ajax({url:url, success: function(rep) {
  				if (rep.code==0) {
  					$("#doc-modal-1").modal("hide");
  					window.location.reload();
  				} else {
  					alert(rep.msg);
  				}
  			}});
  		});
  		$(".J_cancle_expense").click(function() {
			window.location.reload();
  		});
  		$(".J_expense_delete").click(function() {
  			if (confirm("您确定要删除记录么？")) {
  				var customerId = $(this).attr("data-id");
  				var url = "/customer/remove?customerId=" + customerId;
  	  			$.ajax({url:url, success: function(rep) {
  	  				if (rep.code==0) {
  	  					window.location.reload();
  	  				}
  	  			}});  				
  			}
  		});
  		
  		$(".J_expense_view").click(function() {
  			var customerId = $(this).attr("data-id");
  			$(".J_selected_customer").val(customerId);
  			var url = "/consume/queryByCustomerId?customerId=" + customerId;
  			$(".J_expense_table").empty();
  			$(".J_expense_pager_bar").empty();
  			$.ajax({url: url, success: function (rep) {
  				buildExpenseHtml(rep, customerId);
  			}});
  		});
  	});
  	function loadExpense(a) {
  		var url = $(a).attr("data-url");
  		var customerId = $(".J_selected_customer").val();
		$(".J_expense_table").empty();
		$(".J_expense_pager_bar").empty();
		$.ajax({url: url, success: function (rep) {
			buildExpenseHtml(rep, customerId);
		}});
  	}
  	
  	function buildExpenseHtml (rep, customerId) {
  		if (rep.data.consumes == null || rep.data.consumes.length==0) {
  			return;
  		}
  		var currentPage = rep.data.currentPage;
  		var totalPages = rep.data.totalPages;
		$.each(rep.data.consumes, function (index, entry) {
				var tr = "<tr><td>"+entry.buytime+"</td><td>"+entry.money+"</td><td>" + entry.remark + "</td></tr>";
				$(".J_expense_table").append(tr);
		});
		var lis = "<li><a onclick='loadExpense(this)' href='javascript:;' data-url='/consume/queryByCustomerId?customerId="+customerId+"&page="
				+(currentPage<=0?0:currentPage-1)+"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
		for (var i=0; i<rep.data.totalPages; i++) {
			if (i==currentPage) {
				lis += "<li class='active'><a onclick='loadExpense(this)' href='javascript:;' data-url='/consume/queryByCustomerId?customerId="
					+customerId+"&page="+i+"'>" + (i+1) + "</a></li>";
			} else {
				lis += "<li><a onclick='loadExpense(this)' href='javascript:;' data-url='/consume/queryByCustomerId?customerId="
					+customerId+"&page="+i+"'>" + (i+1) + "</a></li>";
			}
		}
		lis +="<li><a onclick='loadExpense(this)' href='javascript:;' data-url='/consume/queryByCustomerId?customerId="+customerId+
				"&page="+(currentPage>=totalPages-1?currentPage:currentPage+1)+"' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
		$(".J_expense_pager_bar").append(lis);
  	}
  </script>
</html>
