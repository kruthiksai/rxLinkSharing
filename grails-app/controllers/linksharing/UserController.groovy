package linksharing

import linksharingCO.UserCO
import linksharingdomain.User
import static org.springframework.http.HttpStatus.*

class UserController {
    UserService userService;
    TopicsService topicsService;

    def index() {

        render(view: '../index', model: [trendingTopics: topicsService.trendingTopics()])
    }

    def adduser(UserCO userCO) {
        print(params)
        //
        if (userCO.validate()) {
            User user = userService.register(userCO)
            if (user) {
                render(view: '../index')
            } else {
                print("failed")
                render(view: '../index')
            }

            //
        }


    }

    def loginuser() {
        print(params)
        User user = userService.login(params.email, params.password)
        if (user) {
            session.user = user
            print("login")

            redirect action: 'index', controller: 'dashboard'
        } else {
            print("false")
//            render(view: '../index')

                flash.message = "Login Failed"


              //  flash.error = "could not delete object"


            redirect action: 'index', controller: 'user'
        }


    }

    def openprofile() {
      render(view:'profile',model:[userdetails:session.user] )
    }

    def updateprofile(UserCO userCO) {
        if(userCO.validate()){
          User user=  userService.updateprofile(params,session.user.id)
            flash.message = "Profile Updated"
            session.user=user;
        }else{
            print("update failed")
            flash.message = "Update Failed please enter all fields"
        }

        redirect action: 'openprofile'

    }

    def logout() {
        print("invalidate")
        session.invalidate()
        redirect(controller: 'user', action: 'index ')
    }
}
