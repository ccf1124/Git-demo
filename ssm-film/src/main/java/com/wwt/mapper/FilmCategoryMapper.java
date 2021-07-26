package com.wwt.mapper;

import com.wwt.entity.Film;
import com.wwt.entity.FilmCategory;
import com.wwt.pojo.FilmAndType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FilmCategoryMapper {

    FilmCategory type(Integer id);

    List<FilmCategory> list(FilmCategory filmCategory);

    int update(FilmCategory filmCategory);

    int add(FilmCategory filmCategory);

    int addType(FilmAndType filmAndType);

    FilmAndType typeById(FilmAndType filmAndType);

    int typeByUp(FilmAndType filmAndType);
}
