<html>
<%@ include file="header.jsp" %>
<body>
<div class="col_center pd_md">
<h2 class="mg-sm text_center mg_b_xs">PlutoThings</h2>
    <p> Knowledge is power </p>
    <i class="fa-solid fa-book text-warning mg_t_sm"></i>
</div>
<hr/>
<form action="patronlogin" method="post" class="row_center pd_b_lg mg_t_lg">  <%-- changed--%>
    <button class="btn btn-outline-primary"> Patron Login</button>
</form>
<div class="container">
    <div class="w_100 col_center mg_v_lg">

        <form action="login" method="post" class="w_100 max_500">


            <div class="mb-3">
                <i class="fas fa-envelope" style="margin-left: 15px;box-shadow: 0px 0px;font-size: 17px;"></i>
                <label for="username" class="form-label">Email address</label>
                <input name="username" class="form-control" id="username" type="text">
            </div>
            <div class="mb-3">
                <i class="fas fa-key" style="margin-left: 15px;font-size: 16px;"></i>
                <label for="pass" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="pass">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

</div>

</body>
</html>
