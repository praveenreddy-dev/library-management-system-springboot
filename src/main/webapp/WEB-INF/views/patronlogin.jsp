<html>
<%@ include file="header.jsp" %>
<body>
<div class="col_center pd_md">
    <h2 class="mg-sm text_center mg_b_xs">PlutoThings</h2>
    <p> Knowledge is power </p>
    <i class="fa-solid fa-book text-warning mg_t_sm"></i>
</div>
<hr/>
<div class="container">
    <div class="w_100 col_center mg_v_lg">

        <form action="patronlogin1" method="post" class="w_100 max_500">


            <div class="mb-3">
                <i class="fas fa-envelope" style="margin-left: 15px;box-shadow: 0px 0px;font-size: 17px;"></i>
                <label for="email" class="form-label">Email address</label>
                <input type="text" name="email" class="form-control" id="email" >
            </div>

            <div class="mb-3">
                <i class="fas fa-key" style="margin-left: 15px;font-size: 16px;"></i>
                <label for="pass" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="pass">
            </div>
            <button type="submit" class="btn btn-primary">login</button>
        </form>
    </div>

</div>
</body>
</html>
