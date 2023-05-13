<html>
<%@ page import="com.pluto.librarymanagmentsystemsb.entity.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.pluto.librarymanagmentsystemsb.entity.Borrowed" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<body>
<div class="row_between pd_h_md pd_v_sm">
    <div>
        <p class="genos txt_md"><i class="fa-solid fa-book txt_sm mg_r_sm"></i>PlutoThings</p>
    </div>
    <div>
        <a href="/home" class="btn fw500">Home <i class="mg_l_sm fa-solid fa-home "></i></a>
    </div>
</div>
<% ArrayList<Borrowed> booksBorrowed = (ArrayList<Borrowed>) request.getAttribute("books");
    String name = "";//request.getAttribute("name").toString();

%>

<hr class="mg_0">

<div class="row_left">
</div>

<div class="row_center items_center">
    <div style="width: 700px" class="row_center pd_h_md mg_t_lg">

        <form action="/BorrowedBooks/search" method="get" class="fillup">
            <%--            search--%>
            <div class=" row_between w100 max_700">
                <input  required type="text" name="term" class="form-control fillup" id="search" placeholder="Search patrons with email" style="background: radial-gradient(circle, #ECF2FF, #C4E1FF, #E6E6FA); box-shadow: 0px 2px 4px rgba(196, 225, 255, 0.25), 0px 4px 8px rgba(76, 191, 255, 0.25), 0px 8px 16px rgba(236, 230, 250, 0.25);
" aria-describedby="search">
                <button type="submit" class="btn mg_l_sm btn-primary"   data-mdb-ripple-color="#8492db">Search</button>
            </div>
        </form>
    </div>
</div>

<div class="container-lg pd_h_md mg_t_lg">
    <p> <%= booksBorrowed.size() %> books</p>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">PatronName</th>

            <th scope="col">PatronEmail</th>
            <th scope="col">BookName</th>
            <th scope="col">borrowedDate</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>

        <% for(int i = 0; i < booksBorrowed.size(); i++) {
            Borrowed borrowed = booksBorrowed.get(i);
        %>
        <tr class="shaker_parent shower_parent">
            <td><%= borrowed.getId() %></td>
            <td><p><%= borrowed.getPatronName() %></p></td>
            <td><p><%= borrowed.getPatronEmail() %></p></td>
            <td><p><%= borrowed.getBookName() %></p></td>
            <td><p><%= borrowed.getBorrowedDate().toString() %></p></td>
            <%-- <td class="">


            </td>--%>
        </tr>
        <% } %>
        </tbody>
    </table>

</div>





</body>