<%--
  Created by IntelliJ IDEA.
  User: jayaram-kruthik
  Date: 22/03/21
  Time: 2:05 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <asset:stylesheet src="index.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title></title>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid ">
        <a class="navbar-brand" href="#">Link Sharing</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse " style="float: right;" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">

                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-user usericon fa-lg" aria-hidden="true"></i> Kruthik
                    </a>
                    <ul class="dropdown-menu home-dropdown " aria-labelledby="navbarDropdown">
                        <g:link controller="user" action="openprofile" class="dropdown-item">profile</g:link>
                        %{--                        <li><a class="dropdown-item" href="#">users</a></li>--}%
                        <g:link controller="user" action="adminUsersList" class="dropdown-item">users</g:link>
                        <li><a class="dropdown-item" href="#">topics</a></li>
                        <li><a class="dropdown-item" href="#">posts</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <g:link controller="user" action="logout" class="dropdown-item">logout</g:link>
                    </ul>
                </li>

            </ul>

        </div>
    </div>
</nav>


<div class="container">
    <div class="row">
        <div class="col-sm-5 margin10px">

            <div class="container">
                <div class="row">
                    <div class="col-sm-5 margin10px">

                        <!-- profile card -->
                        <div class="card ">
                            <div class="card-body" style="position: relative;">
                                <div class="container-fluid recentcontent">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <g:img  class="card-img-top col-sm-12" dir="images" file="${session.user.photoUrl}"  alt="Card image"/>

                                        </div>

                                        <div class="col-sm-8" style="position: relative;">
                                            <h4 class="card-title">${session.user?.firstName} ${session.user?.lastName}</h4>
                                            <h6 class="card-title">@${session.user?.userName}</h6>

                                            <div class="row">
                                                <div class="col-sm-7">
                                                    <strong>Subscriptions</strong>

                                                    <p>
                                                        ${subsList}
                                                    </p>
                                                </div>

                                                <div class="col-sm-5">
                                                    <strong>Topics</strong>

                                                    <p>
                                                        ${topicCount}
                                                    </p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="card margin10px">
                            <div class="card-header d-flex justify-content-between">
                                <span>
                                    Subscriptions
                                </span>
                                <span>
                                    <button type="button" class="btn-sm btn-outline-dark">view all</button>
                                </span>
                            </div>

                            <div id="recenttopics">
                                %{--                    <g:render template="subscriptionDetails"></g:render>--}%
                            </div>
                        </div>

                        <!-- recent posts -->
                        <div class="card margin10px">
                            <div class="card-header d-flex justify-content-between">
                                <span>
                                    Trending Topics
                                </span>
                                <span>
                                    <button type="button" class="btn-sm btn-outline-dark viewall">view all</button>
                                </span>
                            </div>

                            <div id="trendingtopicslist">
                                %{--                    <g:render template="subscriptionDetails"--}%
                                %{--                              model="[trendingTopics1: trendingTopics]"></g:render>--}%
                            </div>

                            %{--                <g:render template="/templates/subscriptionDetails"--}%
                            %{--                          model="[trendingTopics1: trendingTopics]"></g:render>--}%
                        </div>
                        <!-- trending topics  same as subcriptions-->

                    </div>


                    <!-- inbox -->
                    <div class="col-sm-7 margin10px">

                        <div class="card">
                            <div class="card-header">Inbox
                                <input style="float: right" id="myInput" type="text" placeholder="Search.."></div>

                            <div class="card-body" id="topposts">

                            </div>
                        </div>

                        <!-- recent posts -->

                        <!-- inbox -->
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
        integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
        integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
        crossorigin="anonymous"></script>
</body>
</html>