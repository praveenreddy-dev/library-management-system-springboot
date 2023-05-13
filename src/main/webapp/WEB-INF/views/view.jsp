
<html>
<%@ page import="com.pluto.librarymanagmentsystemsb.entity.Book" %>
<%@ include file="header.jsp" %>

<head>
    <title>View Book</title>
</head>
<body>

<div class="container">
    <div class=" pd_sm col_center w100 mg_v_lg">
        <div>
            <% Book book = (Book)request.getAttribute("book");

            %>
        </div>
        <div>
            <div class="pd_t_md pd_h_md w100">
                <div class="row" style="height: 75vh">
                    <div class="col-6 col-md-6 col-lg-6 rounded-2" style='background-image: url("<%= book.getImage() %>");
                            background-position: center; height:100%; width: 100%; max-width: 40vw; background-size: contain; background-repeat: no-repeat '  >

                    </div>
                    <div class="col-6 col-md-6 col-lg-6 pd_md">
                        <div class="row_between no_wrap">
                            <h4> <%= book.getTitle() %> </h4>

                            <div  class="row_right">
                                <a href="/edit/<%=book.getId()%>" class="btn btn-white mg_r_sm shaker_parent child"> <i class="fa-solid fa-pen shake_once_child"></i></a>
<%--                                <a class="btn btn-white shaker_parent"> <i class="fa-solid fa-trash shake_once_child"></i></a>--%>
                                <form action="delete" method="get">
                                    <input type="hidden" value="<%=book.getId() %>" name="id" >
                                    <button class="btn shake_once_child " > <i class="fa-solid fa-trash shake_once_child items_end"></i></button>
                                </form>
                            </div>
                        </div>
                        <hr>
                        <div class="col_between">
                            <div class="col_top fillup">
                                <p class="txt_sm mg_t_sm text-secondary"><i class="fa-solid txt_sm fa-user mg_r_xs" ></i> <%= book.getAuthor() %> </p>
                                <p class="txt_sm mg_t_sm text-primary"><i class="fa-solid txt_sm fa-calendar mg_r_xs" ></i> <%= book.getPublishDate() %> </p>
                                <p class="fw600 mg_v_md"><i class="fa-solid fa-info-circle mg_r_sm mg_t_md"></i>About</p>
                                <p>
                                    <%= book.getDescription() %>
                                </p>
                            </div>
                            <div class="mg_t_lg ">
                                <h3> <%= book.getAvaliable() %> </h3>
                                <i class="txt_sm"> Available</i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%--<div class="container">--%>
<%--    <div class=" pd_sm col_center w100 mg_v_lg">--%>
<%--        <div>--%>
<%--            <% Book book = (Book)request.getAttribute("book");%>--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <div class="pd_t_md pd_h_md w100">--%>
<%--                <div class="row w100" style="height: 75vh">--%>
<%--                    <div class="col-12 col-md-6 rounded-2" style='background-image: url("<%= book.getImage() %>");--%>
<%--                            background-position: center; height:100%; width: 100%; max-width: 40vw; background-size: contain; background-repeat: no-repeat '  >--%>

<%--                    </div>--%>
<%--                    <div class="col-12 col-md-6 pd_md">--%>
<%--                        <div class="row_between no_wrap">--%>
<%--                            <h4> <%= book.getTitle() %> </h4>--%>
<%--    &lt;%&ndash;                        <form action="edit1" method="get">&ndash;%&gt;--%>
<%--    &lt;%&ndash;                            <input type="hidden" value="<%=book.getId() %>" name="id" >&ndash;%&gt;--%>
<%--    &lt;%&ndash;                            <button class="btn" ><i class="fa-solid fa-pen shake_once_child"></i></button>&ndash;%&gt;--%>
<%--    &lt;%&ndash;                        </form>&ndash;%&gt;--%>
<%--    &lt;%&ndash;                        <form action="edit">&ndash;%&gt;--%>
<%--                            <div  class="row_right">--%>
<%--    &lt;%&ndash;                            <input type="hidden" value="<%=book.getId() %>" name="id" >&ndash;%&gt;--%>
<%--                                <a class="btn btn-white mg_r_sm shaker_parent child"> <i class="fa-solid fa-pen shake_once_child"></i></a>--%>
<%--                                <a class="btn btn-white shaker_parent"> <i class="fa-solid fa-trash shake_once_child"></i></a>--%>
<%--                            </div>--%>
<%--    &lt;%&ndash;                        </form>&ndash;%&gt;--%>
<%--                        </div>--%>
<%--                        <hr>--%>
<%--                        <div class="col_between">--%>
<%--                            <div class="col_top fillup">--%>
<%--                                <p class="txt_sm mg_t_sm text-secondary"><i class="fa-solid txt_sm fa-user mg_r_xs" ></i> <%= book.getAuthor() %> </p>--%>
<%--                                <p class="txt_sm mg_t_sm text-primary"><i class="fa-solid txt_sm fa-calendar mg_r_xs" ></i> <%= book.getPublishDate() %> </p>--%>
<%--                                <p class="fw600 mg_v_md"><i class="fa-solid fa-info-circle mg_r_sm mg_t_md"></i>About</p>--%>
<%--                                <p>--%>
<%--                                    <%= book.getDescription() %>--%>
<%--                                </p>--%>
<%--                            </div>--%>
<%--                            <div class="mg_t_lg ">--%>
<%--                                <h3> <%= book.getAvaliable() %> </h3>--%>
<%--                                <i class="txt_sm"> Available</i>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

</body>
</html>
