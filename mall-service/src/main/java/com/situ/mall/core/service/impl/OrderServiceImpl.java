package com.situ.mall.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.core.entity.Order;
import com.situ.mall.core.mapper.OrderMapper;
import com.situ.mall.core.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService{
	@Autowired
	private OrderMapper orderMapper;

	@Override
	public int add(Order order) {
		int count = orderMapper.insert(order);
		return count;
	}

	@Override
	public List<Order> selectAll() {
		return orderMapper.selectAll();
	}

}
