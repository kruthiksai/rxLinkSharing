<!doctype html>
<html>
<head>
    %{--    <meta name="layout" content="main"/>--}%
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <asset:stylesheet src="index.css"/>
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

        <div class="collapse navbar-collapse justify-content-end" id="navbarTogglerDemo02">

            <form class="d-flex ">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>


<!-- Recent Shares -->
<div class="container">
    <div class="row">
        <div class="col-sm-8 margin10px">

            <g:render template="/templates/RecentShares"></g:render>
            <!-- recent posts -->
            <g:render template="/templates/TopPosts" model="[trendingTopics: trendingTopics]"></g:render>

        </div>
        <!--Authentication -->
        <div class=" col-sm-4 margin10px">
            <div class="card">
                <div class="card-header">Login</div>

                <div class="card-body">
                    <g:form url="[controller: 'user', action: 'loginuser']" method="post">
                        <div class="mb-2">
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp">

                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                        </div>

                        <div class="mb-2">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" id="exampleInputPassword1">
                        </div>

                        <div class="mb-2 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                        </div>
                        <g:actionSubmit value="loginuser" class="btn btn-primary">Login</g:actionSubmit>
                    </g:form>
                </div>
            </div>


            <button class="btn btn-primary registerbutton" stypetype="button" data-bs-toggle="collapse"
                    data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                Register
            </button>

            <div class="collapse" id="collapseExample">
                <div class="card card-body">
                    <g:form name="registerForm" url="[controller: 'user', action: 'adduser']" method="post">
                        <div class="form-row">
                            <div class="form-group ">
                                <label for="inputEmail4">Email</label>
                                <input type="email" name="email" class="form-control" id="inputEmail4"
                                       placeholder="Email">
                            </div>

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

                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" name="userName" class="form-control" id="username" placeholder="kk1611">
                        </div>

                        <div class="form-group">
                            <label for="firstname">First Name</label>
                            <input type="text" name="firstName" class="form-control" id="firstname"
                                   placeholder="kruthik">
                        </div>

                        <div class="form-group">
                            <label for="lastname">Last Name</label>
                            <input type="text" name="lastName" class="form-control" id="lastname" placeholder="sai">
                        </div>




                        <g:actionSubmit value="adduser" class="btn btn-primary">Sign in</g:actionSubmit>
                    </g:form>
                </div>
            </div>
        </div>

    </div>

</div>
</div>
</div>

<!--bootstrap code-->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
        integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
        integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
        crossorigin="anonymous"></script>


<div id="content" role="main">
    <section class="row colset-2-its">

        <div id="controllers" role="navigation">
            <h2>Available Controllers:</h2>
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                    <li class="controller">
                        <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                    </li>
                </g:each>
            </ul>
        </div>
    </section>
</div>

</body>
</html>
