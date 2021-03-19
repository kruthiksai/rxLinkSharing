package linksharingdomain

class User {
    String email
    String userName
    String password
    String firstName
    String lastName
    String photoUrl
    boolean deleted
    Date dateCreated
    Date lastUpdated

//
static hasMany=[topic:Topic, subscription:Subscription, resouces:Resource, readTtem:ReadItem, resouceRating:ResourceRating]
//
    static constraints ={

        email nullable:false ,email: true,unique: true
        userName nullable: false, maxsize:255,unique: true
        password nullable: false, maxsize:255,password:true
        firstName nullable: false, maxsize:255
        lastName nullable: false, maxsize:255
        photoUrl nullable: true, maxsize:255
        deleted nullable: false, maxsize:255
//        dateCreated nullable: false, maxsize:255
//        lastUpdated nullable: true, maxsize:255

    }

    static mapping = {//    datasource()
        table 'user_table'}

}
