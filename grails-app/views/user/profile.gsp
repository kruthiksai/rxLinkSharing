<!doctype html>
<html>
<head>
    %{--    <meta name="layout" content="main"/>--}%
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <asset:stylesheet src="index.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Welcome to Grails</title>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Link Sharing</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02"
                aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>


    </div>
</nav>


<!-- Recent Shares -->
<div class="container">
    <div class="row">
        <div class="col-sm-8 margin10px">

            <div class="card ">
                <div class="card-body" style="position: relative;">
                    <div class="container-fluid recentcontent">
                        <div class="row">
                            <div class="col-sm-4">
                                <g:img class="card-img-top col-sm-12" dir="images" file="${session.user.photoUrl}"
                                       alt="Card image"/>
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

            <div class="card margin10px" >
                <div class="card-header d-flex justify-content-between">
                    <span>
                         Topics Created
                    </span>

                </div>

                <div id="usertopics">
                    %{--                    <g:render template="subscriptionDetails"></g:render>--}%
                </div>
            </div>


            <!-- recent posts -->

        </div>
        <!--Authentication -->
        <div class=" col-sm-4 margin10px">
            <div class="card">
                <div class="card-header">User Details</div>

                <div class="card-body">
                    <g:form controller="user" action="updateprofile" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="firstname">First Name</label>
                            <input type="text" name="firstName" class="form-control" id="firstname"
                                   value="${userdetails.firstName}">
                        </div>

                        <div class="form-group">
                            <label for="lastname">Last Name</label>
                            <input type="text" name="lastName" class="form-control" id="lastname"
                                   value="${userdetails.lastName}">
                        </div>

                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" name="userName" class="form-control" id="username"
                                   value="${userdetails.userName}">
                        </div>

                        <div class="form-group ">
                            <label for="inputEmail4">Email</label>
                            <input type="email" name="email" class="form-control" id="inputEmail4"
                                   value="${userdetails.email}">
                        </div>

                        <div class="form-group ">
                            <label for="selectimage">Select Image</label>
                            <input type="file" name="photo" class="form-control" id="selectimage">
                        </div>

                        <g:actionSubmit value="updateprofile"
                                        class="btn btn-primary">update user details</g:actionSubmit>
                    </g:form>

                    <div class="message" style="display: block">${flash.message}</div>
                </div>
            </div>


            <button class="btn btn-primary registerbutton" stypetype="button" data-bs-toggle="collapse"
                    data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                Change Password
            </button>

            <div class="collapse" id="collapseExample">
                <div class="card card-body">
                    <g:form name="profileform" url="[controller: 'user', action: 'adduser']" method="post">
                        <div class="form-row">

                            <div class="form-group ">
                                <label for="inputPassword4">Password</label>
                                <input type="password" name="password" class="form-control" id="inputPassword4"
                                       placeholder="Password">
                            </div>

                            <div class="form-group ">
                                <label for="inputPassword5">Confirm Password</label>
                                <input type="password" name="confirmPassword" class="form-control" id="inputPassword5"
                                       placeholder="Confirm Password">
                            </div>
                        </div>





                        <g:actionSubmit value="changepassword" class="btn btn-primary">Sign in</g:actionSubmit>
                    </g:form>
                </div>
            </div>
        </div>

    </div>

</div>
</div>
</div>

<!--bootstrap code-->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
        integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
        integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
        crossorigin="anonymous"></script>


<g:javascript>

    $(document).ready(function () {


        getTopics();
        $(".deletetopic").click(function (){
            console.log("clicked")
            var elementContext=this
            deleteTopic(elementContext);
        })
    })

    // function to show subscribed topics
    function getTopics() {
        console.log("kruthik")


        $.ajax({
            url: "http://localhost:8090/user/getUserTopics",

            //   data: data,
            async: false,
            success: function (result) {

                $("#usertopics").append(result);


            },
            error: function () {
                alert("no user found")
            }
        });
    }

    function deleteTopic(element){
        var data={

            topicid: $(element).closest(".recentcontent").attr('id')

        }

        $.ajax({
            url: "http://localhost:8090/dashboard/deleteTopic",

            data: data,
            async:false,
            success: function (result) {
                console.log(result)

                //   $(element).innerHTML
                if(result=="success"){
                    $("#usertopics").empty()
                    getTopics()
                }
                if(result=="fail"){
                    // $(element).closest(".recentcontent").find(".itemslist").hide();
                    //   $(element).text("subscribe")
                }

            },
            error: function () {
                alert("Deletion Failed")
            }
        });
    }

</g:javascript>

</body>
</html>
