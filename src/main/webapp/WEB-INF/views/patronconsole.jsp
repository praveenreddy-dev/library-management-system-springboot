<html>
<%@ page import="com.pluto.librarymanagmentsystemsb.entity.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.pluto.librarymanagmentsystemsb.entity.Borrowed" %>
<%@ include file="header.jsp" %>
<%--patron edit and delete buttion doubt--%>
<body>
<div class="row_between pd_h_md pd_v_sm">
    <div>
        <p class="genos txt_md"><i class="fa-solid fa-book txt_sm mg_r_sm"></i>PlutoThings</p>

    </div>
    <div>
        <a href="${pageContext.request.contextPath}/" class="btn fw500">Logout <i class="mg_l_sm fa-solid fa-arrow-right-from-bracket "></i></a>
    </div>
</div>
<%
    ArrayList<Book> books = (ArrayList<Book>) request.getAttribute("books");
    ArrayList<Borrowed> borrowed = (ArrayList<Borrowed>) request.getAttribute("borrowed");

    String name = request.getAttribute("name").toString();
    String email = request.getAttribute("email").toString();

%>

<hr class="mg_0">


<div class="container-lg pd_h_md mg_t_sm"> <%-- need to add just above table --%>

    <form action="" class="row_center pd_b_lg mg_t_lg">  <%-- changed--%>
<%--        newpatron--%>
        <button class="btn btn-outline-primary"> Borrow Book </button>
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

        <form action="search" method="get" class="fillup">
<%--            search--%>
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
        <%  for(int i = 0; i < books.size(); i++) {

            Book book = books.get(i);
            boolean[] added = new boolean[1];

            borrowed.forEach(b->{
                if(b.getBookName().equals(book.getTitle())){
                    added[0] = true;
                }
            });

        %>
        <tr class="shaker_parent shower_parent" >
            <th scope="row"><%= book.getId() %></th>
            <td><p><%=book.getTitle() %></p></td>
            <td class="" ><p><%=book.getAuthor() %></p></td>
            <td class="" ><p><%=book.getPublishDate() %></p></td>
            <td class="" ><p><%=book.getAvaliable() %> </p></td>

            <td class="" >
                <%
                  if(added[0]){
                      %>
                        <button class="btn" > <i class="fa fa-check text-success "></i> </button>
                <% } else { %>
                    <form method="post" action="/borrowBook" >
                        <input value="<%= book.getId() %>" name="bookId" type="hidden">
                        <input value="<%= email %>" name="patronEmail" type="hidden">
                        <button type="submit" class="btn" > <i class="fa fa-plus "></i> </button>
                    </form>

                <% } %>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

</div>





</body>