<%--
  Created by IntelliJ IDEA.
  User: jayaram-kruthik
  Date: 20/03/21
  Time: 12:33 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <asset:stylesheet src="index.css"/>
    <title></title>
</head>

<body >
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Link Sharing</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02"
                aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarTogglerDemo02">


        </div>
    </div>
</nav>
<div class="container margin10px" >
    <div class="card col-sm-4" style="margin: auto auto auto auto">
        <div class="card-header">Verify OTP</div>

        <div class="card-body">
            <g:form name="forgotpswdform" controller="user" action="changepassword" method="post">
                <div class="form-row">

                    <div class="form-group ">
                        <label for="email">email</label>
                        <input type="email" name="emailvalue" class="form-control" id="email"
                              value="${email}" readonly="true">
                    </div>

                    <div class="form-group ">
                        <label for="otp">otp</label>
                        <input type="password" name="otpvalue" class="form-control" id="otp"
                               placeholder="otp">
                    </div>


                    <div class="form-group ">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control" id="password"
                               placeholder="Password">
                    </div>

                    <div class="form-group ">
                        <label for="confirmpassword">Confirm Password</label>
                        <input type="password" name="confirmpassword" class="form-control" id="confirmpassword"
                               placeholder="Confirm Password">
                    </div>
                </div>



                <g:actionSubmit value="changepassword" class="btn btn-primary margin10px">Sign in</g:actionSubmit>
            </g:form>
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
</body>
</html>