package com.eyfast.vipclub.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eyfast.vipclub.entity.Consume;
import com.eyfast.vipclub.entity.Customer;
import com.eyfast.vipclub.entity.DicGroup;
import com.eyfast.vipclub.entity.User;
import com.eyfast.vipclub.mapping.ConsumeMapper;
import com.eyfast.vipclub.mapping.CustomerMapper;
import com.eyfast.vipclub.mapping.DicGroupMapper;
import com.eyfast.vipclub.util.PageUtil;
import com.eyfast.vipclub.vo.Page;
import com.eyfast.vipclub.vo.Response;

/**
 * Created by Administrator on 2017-02-21.
 */
@Controller
@RequestMapping("/customer")
public class CustomerConstroller {

	@Autowired
	private CustomerMapper customerMapper;
	@Resource
	private ConsumeMapper consumeMapper;
	@Resource
	private DicGroupMapper dicGroupMapper;

	private final static String CLIENT_CATE = "客户分类";

	@RequestMapping("query")
	@ResponseBody
	public Response query(Customer customer, Page page) {
		int count = customerMapper.selectSelectiveCount(customer);
		if (count > 0) {
			List<Customer> data = customerMapper.selectSelectiveList(customer, page);
			page.setPage(data);
		}
		page.setCount(count);
		return Response.success(page);
	}

	@RequestMapping("toList")
	public String toList(Model model, String keyword, @RequestParam(required = false, defaultValue = "0") int cuStyle,
			@RequestParam(required = false, defaultValue = "0") int page, @RequestParam(required = false, defaultValue = "10") int pageSize) {
		Page pager = new Page();
		pager.setPageSize(pageSize);
		pager.setStartIndex(PageUtil.getStart(page, pageSize));
		List<Customer> userList = null;
		int total, totalPages;
		List<DicGroup> clientCate = dicGroupMapper.selectByGroup(CLIENT_CATE);

		if (StringUtils.isNotBlank(keyword)) {
			keyword = keyword.trim();
			Customer customer = new Customer();
			customer.setMobile(keyword);
			customer.setIdcard(keyword);
			customer.setName(keyword);
			if (cuStyle > 0) {
				customer.setCuStyle(cuStyle);
			}
			userList = customerMapper.selectSelective(customer, pager);
			total = customerMapper.countSelective(customer);
			totalPages = PageUtil.getTotalPage(pageSize, total);
		} else {
			Customer c = new Customer();
			if (cuStyle > 0) {
				c.setCuStyle(cuStyle);
			}
			userList = customerMapper.selectSelectiveList(c, pager);
			total = customerMapper.selectSelectiveCount(c);
			totalPages = PageUtil.getTotalPage(pageSize, total);
		}

		Map<String, Object> consumeMap = new HashMap<String, Object>();
		if (userList != null) {
			for (Customer user : userList) {
				List<Consume> consume = consumeMapper.selectByCustomerId(user.getId(), 0, 1);
				if (consume != null && !consume.isEmpty()) {
					consumeMap.put(user.getId().toString(), consume.get(0));
				} else {
					consumeMap.put(user.getId().toString(), null);
				}
			}
		}

		model.addAttribute("page", page);
		model.addAttribute("userList", userList);
		model.addAttribute("consumeMap", consumeMap);
		model.addAttribute("total", total);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("keyword", keyword);
		model.addAttribute("clientCate", clientCate);
		model.addAttribute("cuStyle", cuStyle);
		return "vip_search";
	}

	@RequestMapping("queryById")
	@ResponseBody
	public Response query(Integer id) {
		Customer customer = customerMapper.selectByPrimaryKey(id);
		return Response.success(customer);
	}

	@RequestMapping("add")
	@ResponseBody
	public Response add(Customer customer, HttpSession session) {
		Response rep = new Response();
		User u = (User) session.getAttribute("SESSION_USER");
		if (u == null) {
			rep.setCode(1);
			rep.setMsg("没有登录");
			return rep;
		}
		if (StringUtils.isBlank(customer.getName())) {
			return Response.fail("客户姓名不能为空");
		}
		if (StringUtils.isBlank(customer.getMobile())) {
			return Response.fail("手机号不能为空");
		}
		if (StringUtils.isBlank(customer.getIdcard())) {
			return Response.fail("会员号不能为空");
		}
		Customer customerByIdcard = customerMapper.selectByIdcard(customer.getIdcard());
		if (customerByIdcard != null) {
			return Response.fail("会员号不能重复，请重新设定");
		}
		customer.setModifyUser(u.getId());
		customerMapper.insertSelective(customer);
		rep.setMsg("/customer/toList");
		return rep;
	}

	@RequestMapping("/remove")
	@ResponseBody
	public Response remove(@RequestParam int customerId) {
		customerMapper.deleteByPrimaryKey(customerId);
		return Response.success();
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Response edit(Customer customer) {
		Response success = Response.success();
		customerMapper.updateByPrimaryKeySelective(customer);
		success.setMsg("/customer/toList");
		return success;
	}

	@RequestMapping("toAdd")
	public String toAdd(Model model) {
		List<DicGroup> clientCate = dicGroupMapper.selectByGroup(CLIENT_CATE);
		model.addAttribute("clientCate", clientCate);
		return "/vip_reg";
	}

	@RequestMapping("toEdit")
	public String toEdit(Model model, @RequestParam int customerId) {
		Customer customer = customerMapper.selectByPrimaryKey(customerId);
		List<DicGroup> clientCate = dicGroupMapper.selectByGroup(CLIENT_CATE);
		model.addAttribute("clientCate", clientCate);
		model.addAttribute("customer", customer);
		return "/vip_edit";
	}

}
