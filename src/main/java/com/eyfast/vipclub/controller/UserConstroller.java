package com.eyfast.vipclub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eyfast.vipclub.entity.User;
import com.eyfast.vipclub.mapping.DicGroupMapper;
import com.eyfast.vipclub.mapping.UserMapper;
import com.eyfast.vipclub.vo.Response;

/**
 * Created by panhl1 on 2017-02-21.
 */
@Controller
@RequestMapping("/user")
public class UserConstroller {

	@Autowired
	UserMapper userMapper;

	@RequestMapping("add")
	@ResponseBody
	public Response add(User user) {
		if (StringUtils.isBlank(user.getAccount())) {
			return Response.fail("帐号不能为空");
		}
		if (StringUtils.isBlank(user.getName())) {
			return Response.fail("姓名不能为空");
		}
		if (StringUtils.isBlank(user.getPassword())) {
			return Response.fail("密码不能为空");
		}
		try {
			userMapper.insertSelective(user);
		} catch (Exception e) {
			if (e instanceof DuplicateKeyException) {
				return Response.fail(user.getAccount() + "已经存在").setData(user);
			}
			return Response.fail(e.getMessage()).setData(user);
		}
		Response success = Response.success();
		success.setMsg("/user/toList");
		return success;
	}

	@RequestMapping("remove")
	@ResponseBody
	public Response remove(int id) {
		Response success = Response.success();
		userMapper.deleteByPrimaryKey(id);
		success.setMsg("/user/toList");
		return success;
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("SESSION_USER");
		return "/login";
	}

	@RequestMapping("login")
	@ResponseBody
	public Response add(String account, String password, HttpServletRequest request) {
		List<User> users = userMapper.selectByAccount(account);
		if (account == null || password == null) {
			return Response.fail("用户名或密码不能为空");
		}
		if (users == null || users.size() == 0) {
			return Response.fail("用户名错误");
		}
		if (users != null && users.size() > 1) {
			return Response.fail("数据异常，根据用户名查询到多个用户");
		}
		if (!users.get(0).getPassword().equals(password)) {
			return Response.fail("密码错误");
		}
		request.getSession().setAttribute("SESSION_USER", users.get(0));
		Response success = Response.success();
		success.setMsg("/index");
		return success;
	}

	@RequestMapping("toLogin")
	public String toLogin(HttpServletRequest request, HttpServletResponse reponse) {
		return "login";
	}

	@RequestMapping("toAdd")
	public String toAdd(HttpServletRequest request, HttpServletResponse reponse) {
		return "userAdd";
	}

	@RequestMapping("toList")
	public String toList(HttpServletRequest request, HttpServletResponse reponse, Model model) {
		List<User> userList = userMapper.selectAll();
		model.addAttribute("userList", userList);
		return "userList";
	}

}
