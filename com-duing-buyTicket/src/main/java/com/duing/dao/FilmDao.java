package com.duing.dao;

import com.duing.entity.Film;

import java.util.List;

public interface FilmDao {

    List<Film> getList();

    Film getFilmById(String filmId);
}
