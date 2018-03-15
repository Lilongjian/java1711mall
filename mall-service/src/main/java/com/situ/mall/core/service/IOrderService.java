package com.situ.mall.core.service;

import java.util.List;

import com.situ.mall.core.entity.Order;

public interface IOrderService {

	int add(Order order);

	List<Order> selectAll();

}
