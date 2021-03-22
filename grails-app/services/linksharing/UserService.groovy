    package linksharing

    import grails.gorm.transactions.Transactional
    import linksharingCO.UserCO

    import linksharingdomain.User

    @Transactional
    class UserService {

        def serviceMethod() {


        }

        def register(UserCO userCO){
            User user = new User(firstName: userCO.firstName, lastName: userCO.lastName,
                    email: userCO.email, userName: userCO.userName,
                    password: userCO.password,
                    active: true,deleted: false)
            if (user.validate()) {


                return user.save(flush: true)
            }
            print(user.errors.allErrors)
            return null

        }

        def login(String email,String password){
            def user=User.findByEmailAndPassword(email,password)
            if(user){
                return user;
            }else{
                return null;
            }


        }

        def updateprofile(def params,long id,String photourl){
            User user=User.get(id);
            user.userName=params.userName;
            user.firstName=params.firstName;
            user.lastName=params.lastName;
            user.email=params.email;
            user.photoUrl=photourl;
            if(user.validate()){
                user.save(flush:true);
            }


        }

        def forgotPassword(String email){
            def user = User.findByEmail(email)

            if(user){
                def num = Math.abs( new Random().nextInt() % (9999 - 1000) ) + 1000
                def a = send(num,email)
               return a
            }
            else{
              return null
            }
        }
        def send(num, email) {
            sendMail {
                to "${email}"
                subject "Forgot Password"
                text "${num}"
            }
          //  flash.message = "Message sent at "+new Date()
            //redirect action:"index"
            return num
        }

        def updatePassword(String password,String email){
            print(email +" "+ password)
            User user=User.findByEmail(email)
            user.password=password;
            user.save(flush:true)

        }
        def adminUsersList(){
        def usersList=User.list()
            return usersList
        }

    }
