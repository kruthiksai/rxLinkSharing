<%--
  Created by IntelliJ IDEA.
  User: jayaram-kruthik
  Date: 22/03/21
  Time: 10:41 AM
--%>

<!DOCTYPE html>
<html `lang="en" dir="ltr" `>

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

<div class="container-fluid">
<div class=row>
    <div class="col-sm-12">
        <table   cellpadding="10px" border="2px">
            <tr cellpadding="10px">
                <th width="10px">Id</th>
                <th>Username</th>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Deactive</th>
                <th>Manage</th>
            </tr>
            <g:each in="${usersList}" var="it">
                <g:if test="${it.admin!=true}">
                    <td>${it.id}</td>
                    <td>${it.userName}</td>
                    <td>${it.email}</td>
                    <td>${it.firstName}</td>
                    <td>${it.lastName}</td>
                    <td>${it.deleted}</td>
                    <g:if test="${it.deleted==true}">
                    %{--                        <g:form controller="user" action="activate">--}%
                        <td><g:link controller="user" action="activate" id="${it.id}" style="color: #a60000">Activate</g:link></td>
                    %{--                                </g:form>--}%
                    </g:if>
                    <g:else>
                        <td><g:link controller="user" action="deactivate" id="${it.id}" style="color: #1e7e34">Deactivate</g:link> </td>
                    </g:else>
                    </tr>
                </g:if>
            </g:each>
        </table>
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