package linksharing


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
        user.save(failOnError: true)

        //  print( user.errors.allErrors)

    }

    def trendingTopics() {
        return Topic.list();
    }
    def supbscribeToTopic(long uid,long tid){

        User u=  User.get(uid);
        Topic t =Topic.get(tid)
//        println(u.properties);
//        println(t.properties);
//        Subscription sub=Subscription.findByTopicAndUser(t,u);
//        if(sub){
//         //   print("present");
//
//            return "deleted";
//        }

            Subscription s=new Subscription(seriousness:true,user:u,topic:t);
            if(s.validate()){
               // print("kruthik")
                s.save(flush:true,failOnError:true);
                return s;

            }else{
                return  null;
            }



    }

    def unSubscribeToTopic(long uid,long tid){

        User u=  User.get(uid);
        Topic t =Topic.get(tid)
        Subscription sub=Subscription.findByTopicAndUser(t,u);
       return Subscription.deleteAll(sub)
    }

    def fetchTopics(){
      User u=User.findById(2)
       def kk=Topic.createCriteria().list {
           subscription{
               eq('user',u);

           }
       }

        return kk;
    }
}
