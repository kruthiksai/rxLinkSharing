package linksharing

import grails.converters.JSON
import linksharingCO.TopicCO
import linksharingdomain.Subscription
import linksharingdomain.Topic
import linksharingdomain.User

class DashboardController {
    TopicsService topicsService;

    def index() {
        render(view: 'home', model: [trendingTopics: topicsService.trendingTopics(), trendingTopics: topicsService.trendingTopics()])
    }

    def addtopic(TopicCO topicCO) {
        //  controller="dashboard" action="addtopic"

        if (topicCO.validate()) {


            def user = session.user

            topicsService.addTopicToUser(user.id, topicCO);
            redirect(action: 'index')

        } else {
            render 'kruthik'
        }


    }

    def subscribetopic() {

        User u=  User.get(params.userid.toLong());
        Topic t =Topic.get(params.topicid.toLong())
        Subscription sub = Subscription.findByTopicAndUser(t,u);

        if (sub) {

            if(! topicsService.unSubscribeToTopic(params.userid.toLong(), params.topicid.toLong())){
                render "deleted"
            }


        } else {
            Subscription s =  topicsService.supbscribeToTopic(params.userid.toLong(), params.topicid.toLong());

            if (s) {
                render "success"
            } else {
                print("failed")
                render "failed"
            }
        }


    }

    def gettrendingtopics() {
        render(topicsService.trendingTopics() as JSON)

    }
    def fetchTopics(){

        render (topicsService.fetchTopics() as JSON)
    }

}
