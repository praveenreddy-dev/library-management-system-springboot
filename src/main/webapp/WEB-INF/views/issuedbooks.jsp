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
   <%-- <div>
        <a href="${pageContext.request.contextPath}/" class="btn fw500">Home <i class="mg_l_sm fa-solid fa-arrow-right-from-bracket "></i></a>
    </div>--%>
    <div>
        <a href="/home" class="btn fw500">Home <i class="mg_l_sm fa-solid fa-home "></i></a>
    </div>
</div>
<% ArrayList<Borrowed> booksBorrowed = (ArrayList<Borrowed>) request.getAttribute("booksBorrowed");
    String name = "";//request.getAttribute("name").toString();

%>

<hr class="mg_0">


<%--<div class="container-lg pd_h_md mg_t_sm"> &lt;%&ndash; need to add just above table &ndash;%&gt;

    <form action="" class="row_center pd_b_lg mg_t_lg">  &lt;%&ndash; changed&ndash;%&gt;
        &lt;%&ndash;        newpatron&ndash;%&gt;
        <button class="btn btn-outline-primary"> Borrow Book </button>
    </form>
    &lt;%&ndash;<div class="col_between  items_center w100">
        <%
            if(name.equals("Komal Arora"))
            {
        %>
        <img src="https://ums.lpu.in/lpuums/DisplayImageForPowerBi.aspx?id=b4c45472-284d-4cad-b8de-c9fc8477c634" style="height: 100px; width: 100px; border-radius: 50px"/>
        <%} else if (name.equals("Praveen Reddy")) {

        %>
        <img src="https://pbs.twimg.com/profile_images/1514842981466984450/MuX7NMaG_400x400.jpg" style="height: 100px; width: 100px; border-radius: 50px"/>
        <%} else {

        %> <img src="https://ums.lpu.in/lpuums/DisplayImageForPowerBi.aspx?id=41bb8f60-ad02-41d7-b45a-abcc04ed295a" style="height: 100px; width: 100px; border-radius: 50px"/> <%}%>
        <p class="text_center mg_v_sm">Hello,</p>
        <h3 class="text_center">${name} <%= name.equals("Komal Arora") ? "ma'am" :"" %> </h3>
    </div>&ndash;%&gt;
</div>--%>

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

        <% for(int i = 0; i < booksBorrowed .size(); i++) {
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