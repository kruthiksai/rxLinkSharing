package linksharingdomain

class Subscription
{
boolean seriousness;
    Date dateCreated;
   static belongsTo=[topic:linksharingdomain.Topic, user:linksharingdomain.User];

    static constraints ={

        seriousness nullable: false



    }


}
