
<html>
<%@ include file="header.jsp" %>
<body>

    <div class="container">

        <div class=" pd_sm col_center w100 mg_v_lg">
            <div style="background: #DBE2EF" class="w_100 max_500 rounded-1 items_center shadow">
                <h3 class="text_center mg_t_md mg_h_md">Add a new Book</h3>
                <hr>
                <% String emsg = (String)request.getAttribute("error_message");
                    if(emsg!=null) { %>
                    <div class="pd_md">
                        <p><i class="fa-solid fa-warning"> </i> <%= emsg %> </p>
                    </div>
                <% } %>
                <% String smsg = (String)request.getAttribute("success_message");
                    if(smsg!=null) { %>
                <div class="pd_md">
                    <p><i class="fa-solid fa-check-circle">  </i><%= smsg %></p>
                </div>
                <% } %>

                <form action="submitNew" method="post" class="w100 pd_md">
                    <div class="row_center pd_b_sm mg_t_sm">
                        <a href="/home" class="btn fw500">Home <i class="mg_l_sm fa-solid fa-home "></i></a>
                    </div>
                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input name="title" class="form-control" id="title" type="text" placeholder="Book's tittle">
                    </div>
                    <div class="mb-3">
                        <label for="author" class="form-label">Author</label>
                        <input type="text" name="author" class="form-control" id="author" placeholder="Author's full name ">
                    </div>

                    <div class="mb-3">
                        <label for="publishDate" class="form-label">Publish date</label>
                        <input type="date" name="publishDate" class="form-control" id="publishDate" placeholder="Date ">
                    </div>

                    <div class="mb-3">
                        <label for="avaliable" class="form-label">Available</label>
                        <input type="number" required name="avaliable" class="form-control" id="avaliable" placeholder="how many are avaliable ">
                    </div>
                    <div class="mb-3">
                        <label for="image" class="form-label">Image Address</label>
                        <input type="text" name="image" class="form-control" id="image" placeholder="Image Address that you want to show on view pag ">
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description about book</label>
                        <textarea type="text" name="description" class="form-control" id="description" placeholder="Add description about book "></textarea>
                    </div>
                    <div class="row_between">
                        <button type="submit" class="btn btn-primary" href="home">Add <%= smsg!=null && !smsg.isEmpty() ? "Another" : "new " %> book</button>
                    </div>
                </form>
            </div>
        </div>


    </div>



</body>
</html>
