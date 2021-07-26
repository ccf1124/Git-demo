package com.wwt.mapper;

import com.wwt.entity.Ticket;
import com.wwt.pojo.TicA;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TicketMapper {

    List<Ticket> playById(Integer id);

    int add(TicA ticA);

    List<Ticket> userList(Integer id);
}
