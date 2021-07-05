package com.duing.service.impl;

import com.duing.dao.OrderMapper;
import com.duing.dao.PlayMapper;
import com.duing.entity.Order;
import com.duing.entity.Play;
import com.duing.service.OrderService;
import com.duing.util.RandomUtil;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {


    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private PlayMapper playMapper;


    @Override
    public int addOrder(String playId, int cnt, String seatStr) {
        Order order = new Order();
        // 生成id的随机算法
        //  0-9a-zA-Z 所有字符中  随机出一个指定大小的字符串
        //  需要验证id的唯一性  即增加前去查询一下
        order.setOrderId(RandomUtil.getRandomString(10));
        order.setPlayId(playId);
        order.setSeatNum(cnt);

        Play play = playMapper.selectByPlayId(playId);
        BigDecimal price = play.getPrice();
        BigDecimal allPrice = new BigDecimal(cnt).multiply(price);
        order.setPrice(allPrice);

        List<String> seatList = new ArrayList<>();
        char arr[] = seatStr.toCharArray();
        for (int i = 0; i < arr.length; ) {
            String one = "" + arr[i] + arr[i + 1] + arr[i + 2];
            seatList.add(one);
            i += 3;
        }
        order.setSeat(new Gson().toJson(seatList));
        return orderMapper.insert(order);
    }

    @Override
    public List<String> getSeatsByPlayId(String playId) {
        List<Order> orderList = orderMapper.getOrdersByPlayId(playId);
        List<String> seats = new ArrayList<>();
        // 遍历订单  以及 每笔订单中的 座位信息
        // 将已售出的所有座位  总集合返回
        for (Order order : orderList) {
            List<String> seatList = new Gson().fromJson(order.getSeat(),List.class);
            for (String s : seatList) {
                seats.add(s);
            }
        }
        return seats;

    }
}
