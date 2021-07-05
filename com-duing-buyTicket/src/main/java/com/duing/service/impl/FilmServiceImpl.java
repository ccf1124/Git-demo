package com.duing.service.impl;

import com.duing.dao.FilmDao;
import com.duing.entity.Film;
import com.duing.service.FilmService;
import com.duing.vo.FilmDetailVo;
import com.duing.vo.FilmVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class FilmServiceImpl implements FilmService {

    @Autowired
    private FilmDao filmDao;

    @Override
    public List<FilmVo> selectAll() {
        List<Film> films = filmDao.getList();
        System.out.println("数据库中影片数量：" + films.size());

        List<FilmVo> result = new ArrayList<>();
        for (Film film : films) {
            FilmVo vo = new FilmVo();
            vo.setFilmId(film.getFilm_id());
            vo.setName(film.getName());
            vo.setDirector(film.getDirector());
            vo.setImgPath(film.getImg_path());

            result.add(vo);
        }
        return result;
    }

    @Override
    public FilmDetailVo findFilmById(String filmId) {
        Film film = filmDao.getFilmById(filmId);
        FilmDetailVo vo = new FilmDetailVo();
        vo.setFilmId(filmId);
        vo.setName(film.getName());
        vo.setDirector(film.getDirector());
        vo.setImgPath(film.getImg_path());
        // 剧情  爱情   等  可以存储到额外的类型表中
        //  剧情-1  爱情-2   film - type [1,2]   再去type表中取具体的描述
        vo.setType(film.getType());
        vo.setPlayer(film.getPlayer());
        vo.setSynopsis(film.getSynopsis());
        vo.setCountry(film.getCountry());
        vo.setLength(film.getLength());
        return vo;
    }
}
