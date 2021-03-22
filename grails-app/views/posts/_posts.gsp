<g:each in="${postsList}" var="postdata">
    <div class="card postscard" id="${postdata.id}" >
                <div class="card-body" style="position: relative;">

                        <div class="container-fluid recentcontent"  >
                            <div class="row">
                                <div class="col-sm-3">
    <g:img class="card-img-top col-sm-12" dir="images" file="${postdata.createdBy.photoUrl}"
           alt="Card image"/>
    </div>

    <div class="col-sm-9" style="position: relative;">
        <div>
            <a style="display: inline">${postdata.createdBy.firstName} ${postdata.createdBy.lastName}</a>

            <p style="display: inline; float: right; ">
                @${postdata.createdBy.userName}
            </p>

        </div>

        <div>
            <a style="display: inline">@${postdata.topic.name}</a>

        </div>

        <p class="card-text" style="margin-bottom:60px; color:#686868; ">${postdata.description}</p>

        <div class="viewrecentpost">

            <a href="#">Download</a>
            <a href="#">View full site</a>
            <a style="cursor: pointer;" class="markread">Mark as read</a>
            <g:link controller="posts" action="viewpost" params='[titleid: "${postdata.id}"]'>View Post</g:link>

        </div>

    </div>
    </div>
    </div>
    </div>
</g:each>




