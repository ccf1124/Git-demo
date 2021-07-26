package com.wwt.service;

import com.wwt.entity.Play;
import com.wwt.pojo.PlayPojo;

import java.util.List;
import java.util.Map;

public interface PlayService {
    List<Play> filmById(Integer id);
    /**
     * 根据排期单个查询
     * @param id
     * @return
     */
    Play playById(Integer id);

    Map list(Integer page);

    Map delist(Integer page);

    Integer update(Play play);

    Integer add(PlayPojo play);
}
