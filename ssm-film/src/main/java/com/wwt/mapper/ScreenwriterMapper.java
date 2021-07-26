package com.wwt.mapper;

import com.wwt.entity.Screenwriter;
import com.wwt.pojo.ScreenwriterFilm;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScreenwriterMapper {

    Screenwriter scr(Integer id);

    List<Screenwriter> list(Screenwriter screenwriter);

    int add(Screenwriter screenwriter);

    ScreenwriterFilm ScreenwriterFilmById(ScreenwriterFilm screenwriterFilm);

    int ScreenwriterFilmByUp(ScreenwriterFilm screenwriterFilm);

    int ScreenwriterFilmAdd(ScreenwriterFilm screenwriterFilm);

}
