package linksharingdomain

class Subscription
{
boolean seriousness;
    Date dateCreated;
   //static belongsto=[topic:linksharingdomain.Topic, user:linksharingdomain.User];

    static constraints ={

        seriousness nullable: false
        dateCreated nullable: false, maxsize:255


    }


}
