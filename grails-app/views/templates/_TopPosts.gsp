<%--
  Created by IntelliJ IDEA.
  linksharingdomain.User: jayaram-kruthik
  Date: 05/03/21
  Time: 5:20 PM
--%>
<g:each in="${recentposts}" var="postdata">


        <div class="card margin10px">
            <div class="card-body" style="position: relative;">
                <div class="container-fluid recentcontent">
                    <div class="row">
                        <div class="col-sm-3">
                            <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png" alt="Card image">
                        </div>
                        <div class="col-sm-9" style="position: relative;">
                            <div>
                                <a style="display: inline">${postdata.createdBy.firstName} ${postdata.createdBy.lastName} </a>
                                <p style="display: inline; float: right; ">
                                    @${postdata.createdBy.userName}
                                </p>

                            </div>
                            <a style="display: inline">@${postdata.topic.name}</a>
                            <p class="card-text" style="margin-bottom:60px; color:#686868; ">${postdata.description}</p>
                            <a href="#" class="btn btn-primary viewrecentpost"> View Post</a>
                        </div>
                    </div>
                </div>


            </div>

</g:each>