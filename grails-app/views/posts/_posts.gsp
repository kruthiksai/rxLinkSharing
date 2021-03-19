<div class="card">
    <div class="card-header">Posts</div>

    <div class="card-body">
        <div class="card margin10px">
            <div class="card-body" style="position: relative;">
                <g:each in="${postsList}" var="postdata">
                    <div class="container-fluid recentcontent">
                        <div class="row">
                            <div class="col-sm-3">
                                <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png"
                                     alt="Card image">
                            </div>

                            <div class="col-sm-9" style="position: relative;">

                                <p class="card-text" style="margin-bottom:60px;">${postdata.description}</p>

                                <div class="viewrecentpost">

                                    <a href="#">Download</a>
                                    <a href="#">View full site</a>
                                    <a href="#">Mark as read</a>
                                    <g:link action="viewpost"  params='[titleid : "${postdata.id}"]'>View Post</g:link>

                                </div>

                            </div>
                        </div>
                    </div>
                </g:each>
            </div>
        </div>

    </div>
</div>


