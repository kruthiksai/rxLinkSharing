package linksharing

import linksharingdomain.LinkResource
import linksharingdomain.Resource
import org.hibernate.criterion.CriteriaSpecification
import grails.gorm.transactions.Transactional
import linksharingCO.TopicCO
import linksharingdomain.Subscription
import linksharingdomain.Topic
import linksharingdomain.User

@Transactional
class TopicsService {

    def serviceMethod() {

    }

    def addTopicToUser(long id, TopicCO topicCO) {


        User user = User.findById(id)
        Topic topic = new Topic(name: topicCO.name, topicShow: topicCO.topicShow, user: user)
        // topic.save(failOnError: true)
        print(topic.properties);

        user.addToTopic(topic)
        user.save(flush:true,failOnError: true)

      supbscribeToTopic(id,topic.id)

        //  print( user.errors.allErrors)

    }

    def trendingTopics() {

        def t = Topic.list();
//                .withCriteria{
//            resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
//            projections{
//                property('id','topicid')
//                property('name','name')
//                property('topicShow','topicShow')
//
//                user {  property('id', 'userid')
//                    property('userName', 'userName')}
//            }
//
//
//            }

        return t;


    }

    def supbscribeToTopic(long uid, long tid) {

        User u = User.get(uid);
        Topic t = Topic.get(tid)

//        println(u.properties);
//        println(t.properties);
//        Subscription sub=Subscription.findByTopicAndUser(t,u);
//        if(sub){
//         //   print("present");
//
//            return "deleted";
//        }

        Subscription s = new Subscription(seriousness: true, user: u, topic: t);
        if (s.validate()) {
            // print("kruthik")
            s.save(flush: true, failOnError: true);
            return s;

        } else {
            return null;
        }


    }

    def unSubscribeToTopic(long uid, long tid) {

        User u = User.get(uid);
        Topic t = Topic.get(tid)
        Subscription sub = Subscription.findByTopicAndUser(t, u);
        return Subscription.deleteAll(sub)
    }

    def fetchTopics() {
//        User u = User.findById(2)
//        def kk = Topic.createCriteria().list {
//            subscription {
//                eq('user', u);
//
//            }
//        }

        def kk = Topic.createCriteria().list() {
            createAlias("subscription", "_subscription")
            order("_subscription.topic")


        }
        return kk;
    }

    def recenttopics() {
        return Topic.list(sort: 'dateCreated', order: 'desc', offset: 0, max: 3)
    }

    def getTopicNames(long id) {

        def topicNames = Topic.withCriteria {
            projections {
                property('name', 'name');


            }


            subscription {
                user {

                    eq('id', id)
                }


            }


        }


        return topicNames
    }

    def addPost(Topic topic, User user, String url, String description) {

        LinkResource linkResource = new LinkResource(url: url)
        Resource resource = new Resource(topic: topic, createdBy: user, description: description, linkResource: linkResource);
        resource.save(flush: true, failOnError: true)
        if (resource.validate()) {
            return resource.save(flush: true, failOnError: true);

        } else {
            return null

        }


    }

    def getTopicDetails(String topicName) {
        Topic topic = Topic.findByName(topicName);
        return topic;

    }

    def getUsersOfTopic(String topic) {
        def users = Subscription.createCriteria().list {
            projections {
                property('user')
            }
            eq('topic', Topic.findByName(topic))
        }
        return users

    }

    def getInboxPosts(long id){
        def subsList=Subscription.createCriteria().list {
            projections{
                distinct("topic")
            }
            eq('user',User.findById(id))
        }

        def postsList=Resource.findAllByTopicInList(subsList)
        return postsList
    }

}
