package com.duing.service;

import com.duing.vo.FilmDetailVo;
import com.duing.vo.FilmVo;

import java.util.List;

public interface FilmService {

    List<FilmVo> selectAll();

    FilmDetailVo findFilmById(String filmId);
}
