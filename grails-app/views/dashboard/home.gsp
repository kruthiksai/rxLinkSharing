<!DOCTYPE html>
<html `lang="en" dir="ltr" `>

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

<!-- navbar -->

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
                    <a class="nav-link " aria-current="page" href="#"><i class="fa fa-comments fa-lg"
                                                                         aria-hidden="true"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-envelope fa-lg" aria-hidden="true"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-paperclip fa-lg" aria-hidden="true"></i></a>
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


<!-- homescreen content -->
<div class="container">
    <div class="row">
        <div class="col-sm-5 margin10px">

            <!-- profile card -->
            <div class="card ">
                <div class="card-body" style="position: relative;">
                    <div class="container-fluid recentcontent">
                        <div class="row">
                            <div class="col-sm-4">
                                <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png"
                                     alt="Card image">
                            </div>

                            <div class="col-sm-8" style="position: relative;">
                                <h4 class="card-title">${session.user?.firstName} ${session.user?.lastName}</h4>
                                <h6 class="card-title">@${session.user?.userName}</h6>

                                <div class="row">
                                    <div class="col-sm-7">
                                        <strong>Subscriptions</strong>

                                        <p>
                                            50
                                        </p>
                                    </div>

                                    <div class="col-sm-5">
                                        <strong>Topics</strong>

                                        <p>
                                            50
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- recents topics -->
            %{--            <div class="card margin10px">--}%
            %{--                <div class="card-header d-flex justify-content-between">--}%
            %{--                    <span>--}%
            %{--                        Subscriptions--}%
            %{--                    </span>--}%
            %{--                    <span>--}%
            %{--                        <button type="button" class="btn-sm btn-outline-dark">view all</button>--}%
            %{--                    </span>--}%
            %{--                </div>--}%
            %{--                <div class="card-body">--}%
            %{--                    <div class="card ">--}%
            %{--                        <div class="card-body" style="position: relative;">--}%
            %{--                            <div class="container-fluid recentcontent">--}%
            %{--                                <div class="row">--}%
            %{--                                    <div class="col-sm-3">--}%
            %{--                                        <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png" alt="Card image">--}%
            %{--                                    </div>--}%
            %{--                                    <div class="col-sm-9" style="position: relative;">--}%
            %{--                                        <a class="card-text"> grails </a>--}%
            %{--                                        <div class="row">--}%
            %{--                                            <div class="col-sm-4">--}%
            %{--                                                <strong class="card-text post_textsize">@kruthik</strong>--}%
            %{--                                                <a class="card-text post_textsize"> unsubscribe </a>--}%
            %{--                                            </div>--}%
            %{--                                            <div class="col-sm-5">--}%
            %{--                                                <strong class="post_textsize">Subscriptions</strong>--}%
            %{--                                                <p>--}%
            %{--                                                    50--}%
            %{--                                                </p>--}%
            %{--                                            </div>--}%
            %{--                                            <div class="col-sm-3">--}%
            %{--                                                <strong class="post_textsize">post</strong>--}%
            %{--                                                <p>--}%
            %{--                                                    50--}%
            %{--                                                </p>--}%
            %{--                                            </div>--}%
            %{--                                        </div>--}%

            %{--                                        <!-- <a href="#" class="btn btn-primary viewrecentpost"> View Post</a> -->--}%
            %{--                                    </div>--}%
            %{--                                </div>--}%
            %{--                                <div class="row">--}%
            %{--                                    <div class="col-sm-4">--}%
            %{--                                        <select class="form-select" aria-label="Default select example">--}%
            %{--                                            <option selected>Serious</option>--}%
            %{--                                            <option value="1">Not Serious</option>--}%
            %{--                                        </select>--}%
            %{--                                    </div>--}%
            %{--                                    <div class="col-sm-4">--}%
            %{--                                        <select class="form-select" aria-label="Default select example">--}%
            %{--                                            <option selected>private</option>--}%
            %{--                                            <option value="1">public</option>--}%
            %{--                                        </select>--}%
            %{--                                    </div>--}%
            %{--                                    <div class="col-sm-4">--}%
            %{--                                        <div class="row">--}%
            %{--                                            <div class="col-sm-4">--}%
            %{--                                                <i class="fa fa-paperclip fa-lg" aria-hidden="true"></i>--}%
            %{--                                            </div>--}%
            %{--                                            <div class="col-sm-4">--}%
            %{--                                                <i class="fa fa-envelope fa-lg" aria-hidden="true"></i>--}%
            %{--                                            </div>--}%
            %{--                                            <div class="col-sm-4">--}%
            %{--                                                <i class="fa fa-trash fa-lg" aria-hidden="true"></i>--}%
            %{--                                            </div>--}%

            %{--                                        </div>--}%
            %{--                                    </div>--}%
            %{--                                </div>--}%
            %{--                            </div>--}%



            %{--                        </div>--}%
            %{--                    </div>--}%
            %{--                    <div class="card ">--}%
            %{--                        <div class="card-body" style="position: relative;">--}%
            %{--                            <div class="container-fluid recentcontent">--}%
            %{--                                <div class="row">--}%
            %{--                                    <div class="col-sm-3">--}%
            %{--                                        <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png" alt="Card image">--}%
            %{--                                    </div>--}%
            %{--                                    <div class="col-sm-9" style="position: relative;">--}%
            %{--                                        <a class="card-text"> grails </a>--}%
            %{--                                        <div class="row">--}%
            %{--                                            <div class="col-sm-4">--}%
            %{--                                                <strong class="card-text post_textsize">@kruthik</strong>--}%
            %{--                                                <a class="card-text post_textsize"> unsubscribe </a>--}%
            %{--                                            </div>--}%
            %{--                                            <div class="col-sm-5">--}%
            %{--                                                <strong class="post_textsize">Subscriptions</strong>--}%
            %{--                                                <p>--}%
            %{--                                                    50--}%
            %{--                                                </p>--}%
            %{--                                            </div>--}%
            %{--                                            <div class="col-sm-3">--}%
            %{--                                                <strong class="post_textsize">post</strong>--}%
            %{--                                                <p>--}%
            %{--                                                    50--}%
            %{--                                                </p>--}%
            %{--                                            </div>--}%
            %{--                                        </div>--}%

            %{--                                        <!-- <a href="#" class="btn btn-primary viewrecentpost"> View Post</a> -->--}%
            %{--                                    </div>--}%
            %{--                                </div>--}%
            %{--                                <div class="row">--}%
            %{--                                    <div class="col-sm-4">--}%
            %{--                                        <select class="form-select" aria-label="Default select example">--}%
            %{--                                            <option selected>Serious</option>--}%
            %{--                                            <option value="1">Not Serious</option>--}%
            %{--                                        </select>--}%
            %{--                                    </div>--}%
            %{--                                    <div class="col-sm-4">--}%
            %{--                                        <select class="form-select" aria-label="Default select example">--}%
            %{--                                            <option selected>private</option>--}%
            %{--                                            <option value="1">public</option>--}%
            %{--                                        </select>--}%
            %{--                                    </div>--}%
            %{--                                    <div class="col-sm-4">--}%
            %{--                                        <div class="row">--}%
            %{--                                            <div class="col-sm-4">--}%
            %{--                                                <i class="fa fa-paperclip fa-lg" aria-hidden="true"></i>--}%
            %{--                                            </div>--}%
            %{--                                            <div class="col-sm-4">--}%
            %{--                                                <i class="fa fa-envelope fa-lg" aria-hidden="true"></i>--}%
            %{--                                            </div>--}%
            %{--                                            <div class="col-sm-4">--}%
            %{--                                                <i class="fa fa-trash fa-lg" aria-hidden="true"></i>--}%
            %{--                                            </div>--}%

            %{--                                        </div>--}%
            %{--                                    </div>--}%
            %{--                                </div>--}%
            %{--                            </div>--}%



            %{--                        </div>--}%
            %{--                    </div>--}%



            %{--                </div>--}%
            %{--            </div>--}%
            <div class="card margin10px">
                <div class="card-header d-flex justify-content-between">
                    <span>
                        Subscriptions
                    </span>
                    <span>
                        <button type="button" class="btn-sm btn-outline-dark">view all</button>
                    </span>
                </div>
                <g:render template="/templates/subscriptionDetails"></g:render>
            </div>
            <!-- recent posts -->
            <div class="card margin10px">
                <div class="card-header d-flex justify-content-between">
                    <span>
                        Trending Posts
                    </span>
                    <span>
                        <button type="button" class="btn-sm btn-outline-dark viewall">view all</button>
                    </span>
                </div>
                <g:render template="/templates/subscriptionDetails"
                          model="[trendingTopics1: trendingTopics]"></g:render>
            </div>
            <!-- trending topics  same as subcriptions-->

        </div>


        <!-- inbox -->
        <div class="col-sm-7 margin10px">

            <div class="card">
                <div class="card-header">Top Posts</div>

                <div class="card-body">
                    <div class="card margin10px">
                        <div class="card-body" style="position: relative;">
                            <div class="container-fluid recentcontent">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <img class="card-img-top"
                                             src="https://www.w3schools.com/bootstrap4/img_avatar1.png"
                                             alt="Card image">
                                    </div>

                                    <div class="col-sm-9" style="position: relative;">
                                        <h4 class="card-title">John Doe</h4>

                                        <p class="card-text" style="margin-bottom:60px;"></p>
                                        <a href="#" class="btn btn-primary viewrecentpost">View Post</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="card" style="margin: 10px; ">
                        <div class="card-body" style="position: relative;">
                            <div class="container-fluid recentcontent">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <img class="card-img-top"
                                             src="https://www.w3schools.com/bootstrap4/img_avatar1.png"
                                             alt="Card image">
                                    </div>

                                    <div class="col-sm-9" style="position: relative;">
                                        <h4 class="card-title">John Doe</h4>

                                        <p class="card-text" style="margin-bottom:60px;"></p>
                                        <a href="#" class="btn btn-primary viewrecentpost">View Post</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

            <!-- recent posts -->

            <!-- inbox -->
        </div>
    </div>
</div>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Send Invite</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Email address</label>
                        <input type="email" class="form-control" id="exampleFormControlInput1"
                               placeholder="name@example.com">
                    </div>

                    <div class="form-group">
                        <label for="topicselector">Select Topic</label>
                        <select class="form-control" id="topicselector">
                            <option>Grails</option>
                            <option>Java</option>
                            <option>Python</option>
                        </select>
                    </div>

                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Invite</button>
            </div>
        </div>
    </div>
</div>

%{--create topic--}%

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createtopic">
    Create topic
</button>

<div class="modal fade" id="createtopic" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createtopiclabel">Create Topic</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <g:form method="post">
                    <div class="form-group">
                        <label for="topicname">Topic Name</label>
                        <input type="text" name="name" class="form-control" id="topicname" placeholder="@grails">
                    </div>

                    <div class="form-group">
                        <label for="topictype">Select Topic</label>
                        <select class="form-control" name="topicShow" id="topictype">
                            <option>private</option>
                            <option>public</option>

                        </select>
                    </div>

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <g:actionSubmit action="addtopic" value="Add Topic" class="btn btn-primary"/>
                </g:form>
            </div>

        </div>
    </div>
</div>





<!--bootstrap code-->
%{--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"--}%
%{--        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"--}%
%{--        crossorigin="anonymous"></script>--}%
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
        integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
        integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
        crossorigin="anonymous"></script>

<g:javascript>
$(document).ready(function (){
alert("loading")
    $(".subscribe,unsubscribe").click(function (e){



       var result= subscribe(this.id,e)
            console.log($(this).html())
       //     $(this).closest(".recentcontent").find(".itemslist").remove();

    })

})

        function subscribe(id,e){

    var data={
     userid: ${session.user?.id},
     topicid:id

    }



    $.ajax({
              url: "http://localhost:8080/dashboard/subscribetopic",
               data: data,
               async:false,
               success: function (result) {
              console.log(result)
              },
               error: function () {
                 alert("no user found")
                }
                 });

        }

</g:javascript>
</body>

</html>
