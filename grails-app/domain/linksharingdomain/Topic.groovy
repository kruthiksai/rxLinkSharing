package linksharingdomain

class Topic {
String name;
    Date dateCreated
    Date lastUpdated
    String  topicShow
    static belongsTo=[user:User]
    static hasMany=[subscription:Subscription,resources:Resource]

    static constraints ={

        name nullable: false, maxsize:255,unique: true
        topicShow nullable: false

    }
    static mapping = {
        table 'UserTopics'

    }

}
