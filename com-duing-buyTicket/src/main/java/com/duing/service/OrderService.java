package com.duing.service;

import java.util.List;

public interface OrderService {
    int addOrder(String playId, int cnt, String seatStr);

    List<String> getSeatsByPlayId(String playId);
}
