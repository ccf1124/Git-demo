package com.wwt.service.impl;

import com.wwt.entity.Room;
import com.wwt.mapper.RoomMapper;
import com.wwt.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class RoomServiceImpl implements RoomService {
    @Autowired
    private RoomMapper roomMapper;

    public List<Room> list() {
        return roomMapper.list();
    }
}
