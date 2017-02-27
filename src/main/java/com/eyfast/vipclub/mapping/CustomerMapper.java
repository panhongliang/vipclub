package com.eyfast.vipclub.mapping;

import com.eyfast.vipclub.entity.Customer;
import com.eyfast.vipclub.vo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Customer record);

	int insertSelective(Customer record);

	Customer selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Customer record);

	int updateByPrimaryKey(Customer record);

	List<Customer> selectSelectiveList(@Param("para") Customer customer, @Param("page") Page page);

	List<Customer> selectSelective(@Param("para") Customer customer, @Param("page") Page page);

	int selectSelectiveCount(Customer record);

	int countSelective(@Param("para") Customer customer);

	Customer selectByIdcard(@Param("idcard") String idcard);

}