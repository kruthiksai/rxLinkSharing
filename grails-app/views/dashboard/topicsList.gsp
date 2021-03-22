<%--
  Created by IntelliJ IDEA.
  User: jayaram-kruthik
  Date: 22/03/21
  Time: 2:36 PM
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
    <div class="row" >
        <div class="col-sm-8" style="margin: 0 auto 0 auto">
        <div class="card margin10px">

            <div class="card-header d-flex justify-content-between">
                <span>
                     Subscribed Topics
                </span>

            </div>

            <div id="subscribedTopicsList">


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


<g:javascript>

$(document).ready(function (){


    SubscribedTopics();
 // recentTopics();
 // $("#addpost").click(createpost);
 //
 // trendingTopicsList()
//

//
//
//  $("#createlinkbtn,#createdocbtn").click(loadTopicNames);
//

$(".deletetopic").click(function (){
    console.log("clicked")
    var elementContext=this
    deleteTopic(elementContext);
})
    $(".subscribe,unsubscribe").click(function (){
        var elementContext=this
        subscribe(elementContext)

    })
//
//
// $('#topposts').bind('scroll', function(){
//    if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight){
//       loadPosts();
//    }
// });
//
//     // search inside  inbox posts
//      $("#myInput").on("keyup", function() {
//     var value = $(this).val().toLowerCase();
//     $("#topposts .postscard").filter(function() {
//       $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
//     });
//   });


})


// function to show subscribed topics
function SubscribedTopics(){



        $.ajax({
              url: "http://localhost:8090/dashboard/retreiveList",

            //   data: data,
               async:false,
               success: function (result) {

                   $("#subscribedTopicsList").append(result);





      },
       error: function () {
         alert("no user found")
        }
         });
}


//function to get trending topics
function TopicsList(){



        $.ajax({
              url: "http://localhost:8090/dashboard/geTrendingTopics",

            //   data: data,
               async:false,
               success: function (result) {

                   $("#trendingtopicslist").append(result);





      },
       error: function () {
         alert("no user found")
        }
         });
}
// function to  subscribe topics
function subscribe(element){

var data={
userid: ${session.user?.id},
     topicid: $(element).closest(".recentcontent").attr('id')

    }

    $.ajax({
              url: "http://localhost:8090/dashboard/subscribetopic",

               data: data,
               async:false,
               success: function (result) {
           //   console.log(result)
             //   console.log(data.topicid + " "+data.userid)
            //   $(element).innerHTML
            if(result=="success"){
                $(element).closest(".recentcontent").find(".itemslist").show();
                $(element).text("unsubscribe")
            }
            if(result=="deleted"){
                 $(element).closest(".recentcontent").find(".itemslist").hide();
                   $(element).text("subscribe")
            }

              },
               error: function () {
                 alert("Subscription Failed")
                }
                 });

        }





        function deleteTopic(element){
    var eid=$(element).closest(".recentcontent").attr('id')
    var data={

     topicid: eid

    }

    $.ajax({
              url: "http://localhost:8090/dashboard/deleteTopic",

               data: data,
               async:false,
               success: function (result) {
              console.log(result)

            //   $(element).innerHTML
            if(result=="success"){

                     $("#subscribedTopicsList").empty()
                SubscribedTopics()



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