package com.eyfast.vipclub.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.eyfast.vipclub.entity.DicGroup;

public interface DicGroupMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(DicGroup record);

	int insertSelective(DicGroup record);

	DicGroup selectByPrimaryKey(Integer id);

	List<DicGroup> selectByGroup(@Param("group") String group);

	int updateByPrimaryKeySelective(DicGroup record);

	int updateByPrimaryKey(DicGroup record);
}