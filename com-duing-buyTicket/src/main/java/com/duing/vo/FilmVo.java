package com.duing.vo;

// 视图层对象 用来展示给用户使用  view object
public class FilmVo {

    private String filmId;//影片id
    private String name;//名字
    private String director;//描述
    private String imgPath;//图片路径

    public String getFilmId() {
        return filmId;
    }

    public void setFilmId(String filmId) {
        this.filmId = filmId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
}
