<div class="card-body">
    <g:each in="${trendingTopics1}" var="topic">
            <div class="card" >
                <div class="card-body" style="position: relative;">
                    <div class="container-fluid recentcontent" id="${topic.id}">
                        <div class="row">
                            <div class="col-sm-3">
                                <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png"
                                     alt="Card image">
                            </div>

                            <div class="col-sm-9" style="position: relative;">
                                <a class="card-text">${topic.name}</a>

                                <div class="row">
                                    <div class="col-sm-4">
                                        <strong class="card-text post_textsize">${topic.user.userName}</strong>
                                        <a  style="cursor: pointer"
                                           class="card-text post_textsize subscribe">Subscribe</a>


                                        %{--                                    <a id="${topic.id}"--}%
                                        %{--                                       class="card-text post_textsize subscribe">Unsubscribe</a>--}%


                                        %{--                                    <g:link controller="dashboard" action="subscribetopic" class="card-text post_textsize">unsubscribe</g:link>--}%
                                    </div>

                                    <div class="col-sm-5">
                                        <strong class="post_textsize">Subscriptions</strong>

                                        <p>
                                            50
                                        </p>
                                    </div>

                                    <div class="col-sm-3">
                                        <strong class="post_textsize">post</strong>

                                        <p>
                                            50
                                        </p>
                                    </div>
                                </div>

                                <!-- <a href="#" class="btn btn-primary viewrecentpost"> View Post</a> -->
                            </div>
                        </div>

                        <div class="row itemslist">
                            <div class="col-sm-4">
                                <select class="form-select" aria-label="Default select example">
                                    <option selected>Serious</option>
                                    <option value="1">Not Serious</option>
                                </select>
                            </div>

                            <div class="col-sm-4 ">
                                <g:if test="${session.user.id == topic.user.id}">

                                    <select class="form-select" aria-label="Default select example">
                                        <option selected>private</option>
                                        <option value="1">public</option>
                                    </select>
                                </g:if>

                            </div>

                            <div class="col-sm-4">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <g:if test="${session.user.id == topic.user.id}">
                                            <i class="fa fa-edit fa-lg" aria-hidden="true"></i>
                                        </g:if>
                                    </div>

                                    <div class="col-sm-4">
                                        <g:if test="${session.user.id == topic.user.id}">
                                            <i class="fa fa-trash fa-lg" aria-hidden="true"></i>
                                        </g:if>
                                    </div>

                                    <div class="col-sm-4">
                                        <i class="fa fa-envelope fa-lg" aria-hidden="true"></i>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
    </g:each>

%{------}%

</div>
