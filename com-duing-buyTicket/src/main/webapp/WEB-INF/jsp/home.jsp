<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/23
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        body {
            background: #2E323B;
        }

        .piao {
            text-align: center;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            width: 238px;
            padding: 6px;
            line-height: 20px;
            background: #5f5f6d;
        }
    </style>
</head>
<body>


    <table bgcolor="0" align="center">
        <tr>
            <c:forEach items="${filmVoList}" var="film" begin="0" end="3">
                <td>
                    <div style="width: 250px; margin:10px;">
                        <a href="filmInfo?filmId=${film.filmId}">
                            <img src="${pageContext.request.contextPath}${film.imgPath}"
                                 style="width: 250px;height: 380px"/>
                        </a>
                        <div class="piao">
                            <a href="filmInfo?filmId=${film.filmId}">
                                <p style="color: white; top: 50px;">${film.name}</p></a>
                            <a href="filmInfo?filmId=${film.filmId}">
                                <p style="color: white; top: 50px;">导演:${film.director}</p></a>
                        </div>
                    </div>
                </td>
            </c:forEach>
        </tr>
        <tr>
            <%--varStatus="vs" begin="0" end="3"--%>
            <c:forEach items="${filmVoList}" var="film" begin="4" end="7">
                <td>
                    <div style="width: 250px; margin:10px;">
                        <a href="filmInfo?filmId=${film.filmId}">
                            <img src="${pageContext.request.contextPath}${film.imgPath}"
                                 style="width: 250px;height: 380px"/></a>
                        <div class="piao">
                            <a href="filmInfo?filmId=${film.filmId}">
                                <p style="color: white; top: 50px;">${film.name}</p>
                            </a>
                            <a href="filmInfo?filmId=${film.filmId}">
                                <p style="color: white; top: 50px;">导演:${film.director}</p></a>
                        </div>
                    </div>
                </td>
            </c:forEach>
        </tr>
    </table>

</body>
</html>
