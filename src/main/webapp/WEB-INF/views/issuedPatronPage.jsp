
<html>
<%@ page import="com.pluto.librarymanagmentsystemsb.entity.Book" %>
<%@ page import="com.pluto.librarymanagmentsystemsb.entity.Borrowed" %>
<%@ include file="header.jsp" %>

<head>
    <title>View Book</title>
</head>
<body>
<div class="container">
    <div class=" pd_sm col_center w100 mg_v_lg">
        <div>
            <% Borrowed book = (Borrowed) request.getAttribute("bookBorrowed");

            %>
        </div>
        <div>
            <div class="pd_t_md pd_h_md w100">
                <div class="row w100" style="height: 75vh">
                    <div class="col-12 col-md-6 rounded-2" style='background-image: url("<%= book.getImage() %>");
                            background-position: center; height:100%; width: 100%; max-width: 40vw; background-size: contain; background-repeat: no-repeat '  >

                    </div>
                    <div class="col-12 col-md-6 pd_md">
                        <div class="row_between no_wrap">
                            <h4> <%= book.getPatronName() %> </h4>

                            <div  class="row_right">
                                <a class="btn btn-white mg_r_sm shaker_parent child"> <i class="fa-solid fa-pen shake_once_child"></i></a>
                                <a class="btn btn-white shaker_parent"> <i class="fa-solid fa-trash shake_once_child"></i></a>
                            </div>
                        </div>
                        <hr>
                        <div class="col_between">
                            <div class="col_top fillup">
                                <p class="txt_sm mg_t_sm text-secondary"><i class="fa-solid txt_sm fa-user mg_r_xs" ></i> <%= book.getPatronEmail() %> </p>
                                <p class="txt_sm mg_t_sm text-primary"><i class="fa-solid txt_sm fa-calendar mg_r_xs" ></i> <%= book.getBookName() %> </p>
                                <p class="fw600 mg_v_md"><i class="fa-solid fa-info-circle mg_r_sm mg_t_md"></i>Borrowed Date</p>
                                <p>
                                    <%= book.getBorrowedDate() %>
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
