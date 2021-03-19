<%--
  Created by IntelliJ IDEA.
  User: jayaram-kruthik
  Date: 18/03/21
  Time: 8:56 PM
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
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse " style="float: right;" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
                <li class="nav-item">
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </li>
                <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="#" data-bs-toggle="modal"
                       data-bs-target="#createtopic"><i class="fa fa-comments fa-lg"
                                                        aria-hidden="true"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-envelope fa-lg" aria-hidden="true"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-bs-toggle="modal" id="createlinkbtn" data-bs-target="#addlinks"><i
                            class="fa fa-paperclip fa-lg" aria-hidden="true"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-file fa-lg" aria-hidden="true"></i></a>
                </li>
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-user usericon fa-lg" aria-hidden="true"></i> Kruthik
                    </a>
                    <ul class="dropdown-menu home-dropdown " aria-labelledby="navbarDropdown">
                        <g:link controller="user" action="openprofile" class="dropdown-item">profile</g:link>
                        <li><a class="dropdown-item" href="#">users</a></li>
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

%{--topic details--}%
<div class="container">
    <div class="row">
        <div class="col-sm-7">

            <div class="card">
                <div class="card-header d-flex justify-content-center">
                    <span id="topicName">
                        ${postsdata.topic.name}

                    </span>

                </div>

                <div class="card-body" style="position: relative;">
                    <div class="container-fluid recentcontent" id="${postsdata.id}">

                        <div class="row">
                            <div class="col-sm-3">
                                <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png"
                                     alt="Card image">
                            </div>

                            <div class="col-sm-9" style="position: relative;">
                                <h6 style="display: inline">${postsdata.createdBy.firstName} ${postsdata.createdBy.lastName}</h6>
                                <div ><h6 style="display: inline">${postsdata.createdBy.userName}</h6>

                                    <p style="display: inline; float: right;">
                                        ${postsdata.dateCreated}
                                    </p>

                                </div>

                                <p class="card-text" style="margin-bottom:30px;">
                                    ${postsdata.description}

                                </p>

                                <div class="viewrecentpost">

                                    <a href="#">Download</a>
                                    <a href="#">edit</a>
                                    <a href="${postsdata.linkResource.url}">View full site</a>
                                    <a href="#">Delete</a>

                                </div>

                            </div>
                        </div>

                    </div>

                </div>
            </div>

        </div>

        <div class="col-sm-5">
            <div id="posts">

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


<g:javascript>

    $(document).ready(function () {

        loadPosts();
        loadUsers();
        console.log()

        //
        // $("#createlinkbtn").click(loadTopicNames);
        //
        //    $(".subscribe,unsubscribe").click(function (){
        //        var elementContext=this
        //        subscribe(elementContext)
        //
        //    })

    })




    function loadPosts() {
        var data = {

            topic: $("#topicName").text().trim()

        }
        $.ajax({
            url: "http://localhost:8080/Posts/getPosts",

            data: data,
            async: false,
            success: function (result) {
                console.log(result)
                $("#posts").append(result)


            },
            error: function () {
                alert("Subscription Failed")
            }
        });
    }

</g:javascript>

</body>
</html>