package com.eyfast.vipclub.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.stat.TableStat.Mode;
import com.eyfast.vipclub.entity.DicGroup;
import com.eyfast.vipclub.mapping.DicGroupMapper;
import com.eyfast.vipclub.vo.Response;

/**
 * Created by Administrator on 2017-02-21.
 */
@Controller
@RequestMapping("/dic")
public class DicController {
	@Autowired
	DicGroupMapper dicGroupMapper;
	private final static String DIC = "客户分类";

	@RequestMapping("add")
	@ResponseBody
	public Response add(DicGroup group) {
		if (StringUtils.isBlank(group.getDicGroup())) {
			return Response.fail("分类组不能为空");
		}
		if (StringUtils.isBlank(group.getDicName())) {
			return Response.fail("选项名不能为空");
		}
		if (group.getDicKey()<=0) {
			return Response.fail("值不能小于零");
		}
		dicGroupMapper.insertSelective(group);
		Response success = Response.success();
		success.setMsg("/dic/toList");
		return success;
	}

	@RequestMapping("edit")
	@ResponseBody
	public Response edit(DicGroup dicGroup) {
		if (StringUtils.isBlank(dicGroup.getDicGroup())) {
			return Response.fail("分类组不能为空");
		}
		if (StringUtils.isBlank(dicGroup.getDicName())) {
			return Response.fail("选项名不能为空");
		}
		if (StringUtils.isBlank(dicGroup.getDicGroup())) {
			return Response.fail("值不能为空");
		}
		dicGroupMapper.updateByPrimaryKey(dicGroup);
		Response success = Response.success();
		success.setMsg("/dic/toList");
		return success;
	}

	@RequestMapping("remove")
	@ResponseBody
	public Response remove(int id) {
		dicGroupMapper.deleteByPrimaryKey(id);
		Response success = Response.success();
		success.setMsg("/dic/toList");
		return success;
	}

	@RequestMapping("toList")
	public String toList(Model model) {
		List<DicGroup> dicList = dicGroupMapper.selectByGroup(DIC);
		model.addAttribute("dicList", dicList);
		return "settingList";
	}

	@RequestMapping("toEdit")
	public String toEdit(Model model, int id) {
		DicGroup dic = dicGroupMapper.selectByPrimaryKey(id);
		model.addAttribute("dic", dic);
		return "settingEdit";
	}

	@RequestMapping("toAdd")
	public String toAdd(Model model) {
		model.addAttribute("DIC", DIC);
		return "settingAdd";
	}

}
