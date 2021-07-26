package com.wwt.service;

import com.wwt.entity.Ticket;
import com.wwt.pojo.Tic;

import java.util.List;
import java.util.Map;

public interface TicketService {
    List<Ticket> playById(Integer id);

    int add(Tic tic);

    Map userList(Integer pageNum,Integer id);
}
