<g:each in="${usersList}" var="users">
<div class="card ">
    <div class="card-body" style="position: relative;">
        <div class="container-fluid recentcontent">
            <div class="row">
                <div class="col-sm-4">
                    <g:img  class="card-img-top col-sm-12" dir="images" file="${users?.photoUrl}"  alt="Card image"/>
                </div>

                <div class="col-sm-8" style="position: relative;">
                    <h4 class="card-title">${users?.firstName} ${users?.lastName}</h4>
                    <h6 class="card-title">@${users?.userName}</h6>

                    <div class="row">
                        <div class="col-sm-7">
                            <strong>Subscriptions</strong>

                            <p>
                                ${users?.subscription.size()}
                            </p>
                        </div>

                        <div class="col-sm-5">
                            <strong>Topics</strong>

                            <p>
                                ${users?.topic.size()}
                            </p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</g:each>