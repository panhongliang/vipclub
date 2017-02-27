package com.eyfast.vipclub.controller;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eyfast.vipclub.entity.Consume;
import com.eyfast.vipclub.mapping.ConsumeMapper;
import com.eyfast.vipclub.util.PageUtil;
import com.eyfast.vipclub.vo.Response;

/**
 * Created by Administrator on 2017-02-21.
 */
@Controller
@RequestMapping("/consume")
public class ConsumeConstroller {
	@Autowired
	ConsumeMapper consumeMapper;

	@ResponseBody
	@RequestMapping("add")
	public Response add(@RequestParam(required = false) String expenseTime, @RequestParam(required = false) String customerId,
			@RequestParam(required = false) String money, @RequestParam(required = false) String remark) {
		Response response = new Response();
		Timestamp expnseTsmp = null;
		double expneseMoney = 0;
		if (StringUtils.isBlank(customerId)) {
			response.setCode(1);
			return response.setMsg("消费者编号不能为空");
		}
		if (StringUtils.isBlank(expenseTime)) {
			response.setCode(1);
			return response.setMsg("消费时间不能为空");
		}
		try {
			expnseTsmp = Timestamp.valueOf(expenseTime);
		} catch (Exception e) {
			response.setCode(1);
			return response.setMsg("消费时间格式不正确");
		}
		if (StringUtils.isBlank(money)) {
			response.setCode(1);
			return response.setMsg("消费金额不能为空");
		}
		try {
			expneseMoney = Double.valueOf(money);
		} catch (Exception e) {
			response.setCode(1);
			return response.setMsg("消费金额格式不正确");
		}
		if (expneseMoney < 0) {
			response.setCode(1);
			return response.setMsg("消费金额不正确");
		}

		Consume consume = new Consume();
		consume.setBuytime(expnseTsmp);
		consume.setCustomerId(Integer.parseInt(customerId));
		consume.setMoney(new BigDecimal(expneseMoney));
		consume.setRemark(remark);
		consumeMapper.insert(consume);
		return response;
	}

	@ResponseBody
	@RequestMapping("query")
	public Response<Consume> query(Integer id) {
		if (id == null) {
			return Response.fail("id不能为空");
		}
		Consume consume = consumeMapper.selectByPrimaryKey(id);
		return Response.success(consume);
	}

	/**
	 * 查询客户的消息记录
	 * 
	 * @param customerId 客户id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryByCustomerId")
	public Response<Consume> queryByCustomer(Integer customerId, @RequestParam(required = false, defaultValue = "0") int page,
			@RequestParam(required = false, defaultValue = "10") int pageSize) {
		if (customerId == null) {
			return Response.fail("customerId不能为空");
		}
		List<Consume> consumes = consumeMapper.selectByCustomerId(customerId, PageUtil.getStart(page, pageSize),
				PageUtil.getEnd(page, pageSize));
		int total = consumeMapper.countByCustomerId(customerId);
		int totalPages = PageUtil.getTotalPage(pageSize, total);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("consumes", consumes);
		data.put("totalPages", totalPages);
		data.put("currentPage", page);
		return Response.success(data);
	}
}
