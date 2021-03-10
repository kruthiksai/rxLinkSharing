package linksharing

import linksharingCO.TopicCO
import linksharingdomain.Topic
import linksharingdomain.User

class DashboardController {
    TopicsService topicsService;

    def index() {
        render(view: 'home', model: [trendingTopics: topicsService.trendingTopics()])
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
}
