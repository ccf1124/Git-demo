package com.wwt.mapper;

import com.wwt.entity.Performer;
import com.wwt.pojo.Star;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PerformerMapper {

    Performer per(Integer id);

    List<Performer> list(Performer performer);

    int add(Performer performer);

    Star starById(Star star);

    int starUp(Star star);

    int starAdd(Star star);

}
