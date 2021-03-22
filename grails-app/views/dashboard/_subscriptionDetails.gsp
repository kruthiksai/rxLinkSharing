<div class="card-body">
    <g:each in="${trendingTopics}" var="topic">
        <div class="card">
            <div class="card-body" style="position: relative;">
                <div class="container-fluid recentcontent" id="${topic.id}">
                    <div class="row">
                        <div class="col-sm-3">
                            <g:img class="card-img-top col-sm-12" dir="images" file="${topic.user.photoUrl}"
                                   alt="Card image"/>
                        </div>

                        <div class="col-sm-9" style="position: relative;">
                            %{--                            <g:link action="getTopicDetails"  params="[topicName:]"--}%
                            %{--                                    class="card-text">${topic.name}</g:link>--}%
                            <g:link controller="Posts" action="getTopicDetails" params='[topicName: "${topic.name}"]'
                                    class="card-text">${topic.name}</g:link>
                            <div class="row">
                                <div class="col-sm-4">
                                    <strong class="card-text post_tex   tsize">${topic.user.userName}</strong>
                                    <g:if test="${(topic.user.id) != (session.user.id)}">
                                        <g:if test="${(topic.subscription.user.id).contains(session.user.id)}">
                                            <a style="cursor: pointer"
                                               class="card-text post_textsize subscribe">Unsubscribe</a>

                                        </g:if>
                                        <g:else>
                                            <a style="cursor: pointer"
                                               class="card-text post_textsize subscribe">Subscribe</a>
                                        </g:else>
                                    </g:if>





                                %{--                                    <a id="${topic.id}"--}%
                                %{--                                       class="card-text post_textsize subscribe">Unsubscribe</a>--}%


                                %{--                                    <g:link controller="dashboard" action="subscribetopic" class="card-text post_textsize">unsubscribe</g:link>--}%
                                </div>

                                <div class="col-sm-5">
                                    <strong class="post_textsize">Subscriptions</strong>

                                    <p>
                                        ${(topic.subscription.size())}
                                    </p>
                                </div>

                                <div class="col-sm-3">
                                    <strong class="post_textsize">post</strong>

                                    <p>
                                        ${(topic.resources.size())}
                                    </p>
                                </div>
                            </div>

                            <!-- <a href="#" class="btn btn-primary viewrecentpost"> View Post</a> -->
                        </div>
                    </div>
                    <g:if test="${(topic.subscription.user.id).contains(session.user.id) || (topic.user.id) == (session.user.id)}">

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
                                        <g:if test="${topic.topicShow=="private"}">

                                            <option selected>private</option>
                                            <option value="1">public</option>
                                        </g:if>
                                        <g:if test="${topic.topicShow=="public"}">
                                            sai
                                            <option value="1">private</option>
                                            <option selected>public</option>
                                        </g:if>
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

                                    <div class="col-sm-4" >
                                        <g:if test="${session.user.id == topic.user.id}">
                                            <i class="fa fa-trash fa-lg deletetopic" aria-hidden="true"></i>
                                        </g:if>
                                    </div>

                                    <div class="col-sm-4">
                                        <i class="fa fa-envelope fa-lg" aria-hidden="true"></i>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </g:if>
                    <g:else>
                        <div class="row itemslist" style="display:none; ">
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
                                            <i class="fa fa-trash fa-lg deletetopic" aria-hidden="true"></i>
                                        </g:if>
                                    </div>

                                    <div class="col-sm-4">
                                        <i class="fa fa-envelope fa-lg" aria-hidden="true"></i>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </g:else>

                </div>

            </div>
        </div>
    </g:each>

%{------}%

</div>
