<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/24
  Time: 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/npm.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <script src="../js/3.3.7bootstrap.min.js"></script>
    <style type="text/css">
        .container {
            margin-top: 30px;
            border: 1px solid #b3a6a6;
            border-radius: 10px;
        }

        .tou {
            background: whitesmoke;
            height: 30px;
            line-height: 30px;
            text-indent: 2em;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            border-bottom: 1px solid #b3a6a6;
        }

        table {
            text-align: center;
            margin-top: 10px;
            border-top: 1px solid #b3a6a6;
        }

        table th {
            text-align: center;
        }

        button span {
            color: red;
        }
        label {
            line-height: 35px;
        }

        .form-group {
            margin-left: 100px;
        }
    </style>
    <script>
        $(function () {
            if (${is==0}){
                $("#is").text("?????????????????????")
                $("#but6 span").text("??????")
            }
            if (${is==1}){
                $("#is").text("?????????????????????")
                $("#but6 span").text("??????")
            }
            $("#is").click(function () {
                if ($("#is").text()=="?????????????????????"){
                    location.href="room?page=1";
                }
                if ($("#is").text()=="?????????????????????"){
                    location.href="deroom?page=1";
                }
            })
            $("#table").on("click", "#but6", function() {
                var id=$(this).parent().siblings("#playId").text()
                var mode=$(this).text()
                $.ajax({
                    type:"get",
                    url:"play",
                    data:{
                        id:id,
                        mode:mode
                    },
                    dataType: "json",
                    success:function(data){
                        if (data>0){
                            alert("????????????")
                            window.location.reload();
                        } else{
                            alert("????????????")
                        }

                    }
                });
            });

            $().ready(function(){
                if (${map.pages>1}) {
                    $("#fenye").css("display","block")
                    if(${!map.prevopus}){
                        $('#Previous').addClass("disabled")
                    }else{
                        $('#Previous').removeClass("disabled")
                        $('#Previous a').attr("href","room?page=${map.pageNum-1}");
                    }
                    if (${!map.next}) {
                        $('#li').addClass("disabled")
                    }else {
                        $('#li').removeClass("disabled")
                        $('#li a').attr("href","room?page=${map.pageNum+1}");
                    }
                    for(var i = 0; i <${map.pages}; i++) {
                        var a=${map.pageNum};
                        if( a==(i+1)) {
                            $("#li").before("<li id='pageSum' class='active data'><a href='room?page=${map.pageNum}'>" + (i + 1) + "</a></li>")
                        } else {
                            $("#li").before("<li id='pageSum' class='data'><a href='room?page="+(i+1)+"'>" + (i + 1) + "</a></li>")
                        }
                    }

                }
            })
            $("#but4").click(function () {
                if ($("#select1").find("option:selected").val()!=0){
                    if ($("#select2").find("option:selected").val()!=0){
                        if ($("#money2").val()!=null || $("#money2").val()!='' ){
                        $.ajax({
                            type:"post",
                            url:"playAdd",
                            data:{
                                playTime:$("#playTime2").val(),
                                roomId:$("#select1").find("option:selected").val(),
                                filmId:$("#select2").find("option:selected").val(),
                                money:$("#money2").val()
                            },
                            dataType: "json",
                            success:function(data){
                                if (data>0){
                                    alert("????????????")
                                    window.location.reload();
                                } else{
                                    alert("????????????")
                                }

                            }
                        });
                        }  else {
                            alert("???????????????")
                        }
                    }else{
                        alert("???????????????")
                    }
                }else{
                    alert("????????????????????????")
                }

            })


        })
    </script>
</head>

<body>
<div class="container" style="padding: 0px;width: 80%">
    <div class="tou"><span class="glyphicon glyphicon-align-justify"></span><span style="font-weight: bold; margin-left: 6px;">??????????????????</span></div>
    <table class="table">
        <caption><span id="sum" style="margin-left: 30px;">???${map.conut}???</span></caption>
        <thead>
        <tr>
            <th>??????</th>
            <th>??????</th>
            <th>??????</th>
            <th>??????</th>
            <th>??????</th>
            <th>??????</th>
        </tr>
        </thead>
        <tbody id="table">
        <c:forEach items="${map.info}" var="play">
            <tr>
                <td id="playId">${play.playId}</td>
                <td id="roomName">${play.room.roomName}</td>
                <td id="filmName">${play.film.filmName}</td>
                <td id="money">${play.money}</td>
                <td id="playTime">${play.playTime}</td>
                <td>
                    <button id="but6" type="button" class="btn btn-default" style="border:1px solid red;"><span>??????</span></button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!--??????-->
    <div id="fenye" class="panel-footer" style="text-align: center; display: none">
        <nav style="height: 35px;">
            <ul class="pagination" style="margin-top:0px;">
                <li id="Previous">
                    <a aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <li id="li">
                    <a aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="clearfix"></div>
    </div>
    <div align="center" style="margin-bottom: 10px;padding-top: 10px; border-top: 1px solid #b3a6a6;">
        <button id="but2" type="button" class="btn btn-success" data-toggle='modal' data-target='#add'  style=" width: 100px; height: 40px; line-height: 30px;">
            <span class="glyphicon glyphicon-ok"  style="margin-right: 6px; color:white; font-size: 16px;"></span>
            <span style="color:white; font-weight: 800;font-size: 16px;">??????</span>
        </button>
        <button id="butupdate" type="button" class="btn btn-success" style=" width: 200px; height: 40px; line-height: 30px;">
            <span class="glyphicon glyphicon-ok"  style="margin-right: 6px; color:white; font-size: 16px;"></span>
            <span id="is" style="color:white; font-weight: 800;font-size: 16px;">?????????????????????</span>
        </button>
    </div>
    <!--??????????????? -->
    <div class="modal fade"  id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">??</button>
                    <h4 class="modal-title" id="myModalLabel" style="text-align: center;">???????????????</h4>
                </div>
                <div class="text-center" style="margin-top: 15px; text-align: center;">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">??????</label>
                        <select id="select1" class="form-control" style="margin-left: 0px; display: inherit;width: 230px;" name="">
                            <option value="0">???????????????</option>
                            <c:forEach  items="${room}" var="room">
                                <option value="${room.roomId}">${room.roomName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">??????</label>
                        <select id="select2" class="form-control" style="margin-left: 0px; display: inherit;width: 230px;" name="">
                            <option value="0">???????????????</option>
                            <c:forEach  items="${film}" var="film">
                                <option value="${film.filmId}">${film.filmName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">??????</label>
                        <div class="">
                            <input type="text"  class="form-control" style="margin-left: 0px; display: inherit;width: 230px;" id="money2">
                        </div>
                    </div>
                </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">????????????</label>
                        <div class="">
                            <input type="datetime-local"  class="form-control" style="margin-left: 0px; display: inherit;width: 230px;" id="playTime2">
                        </div>
                    </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
                    <button id="but4" type="button" class="btn btn-danger" data-dismiss="modal">??????</button>
                </div>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
</body>

</html>
