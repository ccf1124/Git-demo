<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
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
            margin-left: 130px;
        }
    </style>
    <script>
        $(function () {
            $("#table").on("click", "#but3", function() {
                $("#filmId").val($(this).parent().siblings("#categoryId").text())
                $("#filmCa").val($(this).parent().siblings("#filmCategory").text())
            });
            $("#table").on("click", "#but6", function() {
                $("#idx").text($(this).parent().siblings("#categoryId").text())
                $("#leix").text($(this).parent().siblings("#filmCategory").text())
            });
            $("#but44").click(function () {
                $.ajax({
                    type:"post",
                    url:"typedelete",
                    data:{
                        categoryId:$("#idx").text()
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
            })
            $("#but5").click(function () {
                $.ajax({
                    type:"post",
                    url:"add",
                    data:{
                        filmCategory:$("#addname").val()
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
            })
            $("#but4").click(function () {
                $.ajax({
                    type:"get",
                    url:"typeupdate",
                    data:{
                        categoryId:$("#filmId").val(),
                        filmCategory:$("#filmCa").val()
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
            })

            $().ready(function(){
                if (${type.pages>1}) {
                    $("#fenye").css("display","block")
                    if(${!type.prevopus}){
                        $('#Previous').addClass("disabled")
                    }else{
                        $('#Previous').removeClass("disabled")
                        $('#Previous a').attr("href","type?page=${type.pageNum-1}");
                    }
                    if (${!type.next}) {
                        $('#li').addClass("disabled")
                    }else {
                        $('#li').removeClass("disabled")
                        $('#li a').attr("href","type?page=${type.pageNum+1}");
                    }
                    for(var i = 0; i <${type.pages}; i++) {
                        var a=${type.pageNum};
                        if( a==(i+1)) {
                            $("#li").before("<li id='pageSum' class='active data'><a href='type?page=${type.pageNum}'>" + (i + 1) + "</a></li>")
                        } else {
                            $("#li").before("<li id='pageSum' class='data'><a href='type?page="+(i+1)+"'>" + (i + 1) + "</a></li>")
                        }
                    }

                }
            })


        })
    </script>
</head>

<body>
<div class="container" style="padding: 0px;">
    <div class="tou"><span class="glyphicon glyphicon-align-justify"></span><span style="font-weight: bold; margin-left: 6px;">??????????????????</span></div>
    <table class="table " style="margin-top: 0px;">
        <caption><span id="sum" style="margin-left: 30px;">???${type.conut}???</span></caption>
        <thead>
        <tr>
            <th>??????</th>
            <th>????????????</th>
            <th>??????</th>
        </tr>
        </thead>
        <tbody id="table">
            <c:forEach items="${type.info}" var="type">
                <tr>
                    <td id="categoryId">${type.categoryId}</td>
                    <td id="filmCategory">${type.filmCategory}</td>
                    <td>
                        <button id='but3' type='button' data-toggle='modal' data-target='#myModal'  class='btn btn-default' style='border:1px solid #32CD32;'>
                            <span class='glyphicon glyphicon-pencil' style='margin-right: 6px;color: #32CD32;'>
                            </span><span style='color: #32CD32;'>??????</span></button>
                        <button id='but6' type='button'  data-toggle='modal' data-target='#update' class='btn btn-default' style='border:1px solid red; margin-left: 6px;'>
                            <span class='glyphicon glyphicon-trash' style='margin-right: 6px;'></span><span>??????</span>
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
        <!-- ?????? -->
        <div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">??</button>
                        <h4 class="modal-title" id="myModalLabel" style="text-align: center;">??????????????????"<font id="leix" color="red"></font>"<font id="idx" style="display: none;"></font></h4>
                    </div>
                    <div class="modal-footer" style="text-align: center;">
                        <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
                        <button id="but44" type="button" class="btn btn-danger">????????????</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!--????????? -->
        <div class="modal fade" id="myModal" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">??</button>
                        <h4 class="modal-title" id="myModalLabel" style="text-align: center;">??????????????????</h4>
                    </div>
                    <div class="text-center" style="margin-top: 15px; text-align: center;">
                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">??????</label>
                            <div class="">
                                <input type="text" readonly="readonly" class="form-control" style="margin-left: 0px; display: inherit;width: 230px;" id="filmId">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-3 control-label">????????????</label>
                            <div class="">
                                <input type="text" class="form-control" style="display: inherit;width: 230px;" id="filmCa">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="text-align: center;">
                        <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
                        <button id="but4" type="button" class="btn btn-danger">??????</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
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
        <button id="but2" type="button" data-toggle='modal' data-target='#add' class="btn btn-success" style=" width: 100px; height: 40px; line-height: 30px;">
            <span class="glyphicon glyphicon-ok"  style="margin-right: 6px; color:white; font-size: 16px;"></span>
            <span  style="color:white; font-weight: 800;font-size: 16px;">??????</span>
        </button>
    </div>
    <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">??</button>
                    <h4 class="modal-title" id="myModalLabel" style="text-align: center;">??????????????????</h4>
                </div>
                <div class="text-center" style="margin-top: 15px; text-align: center;">
                    <div class="form-group">
                        <label for="lastname" class="col-sm-3 control-label">??????????????????</label>
                        <div class="">
                            <input type="text"  class="form-control" style="display: block;width: 230px;" id="addname">
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
                    <button id="but5" type="button" class="btn btn-danger" data-dismiss="modal">??????</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
</body>

</html>