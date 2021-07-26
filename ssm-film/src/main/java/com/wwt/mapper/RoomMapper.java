package com.wwt.mapper;

import com.wwt.entity.Room;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomMapper {

    Room roomById(Integer id);

    List<Room> list();
}
