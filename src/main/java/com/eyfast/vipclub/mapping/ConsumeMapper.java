package com.eyfast.vipclub.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.eyfast.vipclub.entity.Consume;

public interface ConsumeMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Consume record);

	int insertSelective(Consume record);

	Consume selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Consume record);

	int updateByPrimaryKey(Consume record);

	List<Consume> selectByCustomerId(@Param("customerId") int id, @Param("start") int start, @Param("length") int length);

	int countByCustomerId(@Param("customerId") int id);

	List<Consume> selectByCustomerId2(@Param("customerId") Integer customerId);
}