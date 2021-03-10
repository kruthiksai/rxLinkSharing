package linksharingCO

class UserCO {
    String email
    String userName
    String password
    String confirmPassword
    String firstName
    String lastName
    String photoUrl


    static constraints ={

        email nullable:false ,email: true,unique: true
        userName nullable: false, maxsize:255,unique: true
        password nullable: false, size: 5..32,password:true,validator: {password, obj ->
            def password2 = obj.confirmPassword
            password2 == password ? true : "password mismatch"
        }
         confirmPassword nullable: false,size: 5..32,password:true
        firstName nullable: false, maxsize:255
        lastName nullable: false, maxsize:255
        photoUrl nullable: true, maxsize:255






    }
}
