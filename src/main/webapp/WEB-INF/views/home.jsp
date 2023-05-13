<html>
<%@ page import="com.pluto.librarymanagmentsystemsb.entity.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="header.jsp" %>

<body>
<div class="row_between pd_h_md pd_v_sm">
    <div>
            <p class="genos txt_md"><i class="fa-solid fa-book txt_sm mg_r_sm"></i>PlutoThings</p>
    </div>
    <div>
        <a href="${pageContext.request.contextPath}/" class="btn fw500">Logout <i class="mg_l_sm fa-solid fa-arrow-right-from-bracket "></i></a>
    </div>
</div>
    <% ArrayList<Book> books = (ArrayList<Book>) request.getAttribute("books");
        String name = request.getAttribute("name").toString();   // name is the issue here

    %>

<hr class="mg_0">

<div class="container-lg pd_h_md mg_t_sm"> <%-- need to add just above table --%>
    <form action="new" class="row_center pd_b_sm mg_t_md">  <%-- changed--%>
        <button class="btn btn-outline-primary"> Add New Book</button>
    </form>
    <form action="newpatron" class="row_center pd_b_lg mg_t_lg">  <%-- changed--%>
        <button class="btn btn-outline-primary"> Add Patron</button>
    </form>
    <div class="col_between  items_center w100">
        <%
            if(name.equals("Komal Arora"))
            {
        %>
        <img src="https://ums.lpu.in/lpuums/DisplayImageForPowerBi.aspx?id=b4c45472-284d-4cad-b8de-c9fc8477c634" style="height: 100px; width: 100px; border-radius: 50px"/>
        <%} else if (name.equals("Praveen Reddy")) {

        %>
        <img src="https://pbs.twimg.com/profile_images/1514842981466984450/MuX7NMaG_400x400.jpg" style="height: 100px; width: 100px; border-radius: 50px"/>
        <%} else {

        %> <img src="https://pbs.twimg.com/profile_images/1583586611517919239/iU-EoCz1_400x400.jpg" style="height: 100px; width: 100px; border-radius: 50px"/> <%}%>
        <p class="text_center mg_v_sm">Hello,</p>
        <h3 class="text_center">${name} <%= name.equals("Komal Arora") ? "ma'am" :"" %> </h3>
    </div>
</div>

<div class="row_left">
</div>

<div class="row_center items_center">
    <div style="width: 700px" class="row_center pd_h_md mg_t_lg">
        <div class="pd_r_md">
        <form action="getBooksBorrowed" class="row_center pd_b_lg mg_t_lg">  <%-- changed--%>
            <button class="btn btn-outline-primary">Issued Books</button>
        </form>
        </div>
        <form action="search" method="get" class="fillup">
            <div class=" row_between w100 max_700">
                <input  required type="text" name="id" class="form-control fillup" id="search" placeholder="Search books with id" style="background: radial-gradient(circle, #ECF2FF, #C4E1FF, #E6E6FA); box-shadow: 0px 2px 4px rgba(196, 225, 255, 0.25), 0px 4px 8px rgba(76, 191, 255, 0.25), 0px 8px 16px rgba(236, 230, 250, 0.25);
" aria-describedby="search">
                <button type="submit" class="btn mg_l_sm btn-primary"   data-mdb-ripple-color="#8492db">Search</button>
            </div>
        </form>
    </div>
</div>

<div class="container-lg pd_h_md mg_t_lg">
    <p> <%= books.size() %> books</p>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Tittle</th>
            
            <th scope="col">Author</th>
            <th scope="col">Publish date</th>
            <th scope="col">Available</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <% for(int i = 0; i < books.size(); i++) {
            Book book = books.get(i);

        %>
        <tr class="shaker_parent shower_parent" >
            <th scope="row"><%= book.getId() %></th>
            <td><p><%=book.getTitle() %></p></td>
            <td class="" ><p><%=book.getAuthor() %></p></td>
            <td class="" ><p><%=book.getPublishDate() %></p></td>
            <td class="" ><p><%=book.getAvaliable() %> </p></td>

            <td class="" >
                <div class="col_center h100">
                    <div class="row_right no_wrap shower_child items_center">

                        <form action="view" method="get">
                            <input type="hidden" value="<%=book.getId() %>" name="id" >
                              <button class="btn" > <i class="fa-solid fa-ellipsis-vertical"></i></button>
                        </form>

                        <form action="delete" method="get">
                            <input type="hidden" value="<%=book.getId() %>" name="id" >
                            <button class="btn shake_once_child" > <i class="fa-solid fa-trash text-danger"></i></button>
                        </form>
                    </div>
                </div>

            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

</div>





</body>