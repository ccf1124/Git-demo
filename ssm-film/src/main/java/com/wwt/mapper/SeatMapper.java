package com.wwt.mapper;

import com.wwt.entity.Seat;
import org.springframework.stereotype.Repository;

@Repository
public interface SeatMapper {
    Seat seatById(Integer id);

    Seat seatBySeat(String seat);
}
