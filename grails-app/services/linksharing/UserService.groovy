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

        def updateprofile(def params,long id){
            User user=User.get(id);
            user.userName=params.userName;
            user.firstName=params.firstName;
            user.lastName=params.lastName;
            user.email=params.email;
            if(user.validate()){
                user.save(flush:true);
            }


        }
    }
