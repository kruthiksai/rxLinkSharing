package linksharing


import grails.gorm.transactions.Transactional
import linksharingCO.TopicCO
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
}
