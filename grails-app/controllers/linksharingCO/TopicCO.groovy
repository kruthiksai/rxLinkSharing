package linksharingCO

import linksharingdomain.Resource
import linksharingdomain.Subscription
import linksharingdomain.User

class TopicCO {

    String name;

    String  topicShow


    static constraints ={

        name nullable: false, maxsize:255,unique:true
        topicShow nullable: false

    }
}
