package linksharing

import grails.converters.JSON
import linksharingCO.TopicCO
import linksharingdomain.DocumentResource
import linksharingdomain.LinkResource
import linksharingdomain.Resource
import linksharingdomain.Subscription
import linksharingdomain.Topic
import linksharingdomain.User

class DashboardController {
    TopicsService topicsService;
    PostsService postsService;

    def index() {
        render(view: 'home', model: [trendingTopics: topicsService.trendingTopics(), trendingTopics: topicsService.trendingTopics(), subsList: topicsService.getSubsCount(session.user.id), topicCount: topicsService.getTopicCount(session.user.id)])
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

        User u = User.get(params.userid.toLong());
        Topic t = Topic.get(params.topicid.toLong())
        Subscription sub = Subscription.findByTopicAndUser(t, u);

        if (sub) {

            if (!topicsService.unSubscribeToTopic(params.userid.toLong(), params.topicid.toLong())) {
                render "deleted"
            }


        } else {
            Subscription s = topicsService.supbscribeToTopic(params.userid.toLong(), params.topicid.toLong());

            if (s) {
                render "success"
            } else {
                print("failed")
                render "failed"
            }
        }


    }

//    def gettrendingtopics() {
//        render(view: '_subscriptionDetails', model: [trendingTopics: topicsService.trendingTopics()])
//
//    }

    def fetchTopics() {

        render(topicsService.fetchTopics() as JSON)
    }

    def recentTopics() {
        def recentTopics = topicsService.recenttopics(session.user.id)
        if (recentTopics) {
            render(view: '_subscriptionDetails', model: [trendingTopics: topicsService.recenttopics(session.user.id)])

        }else{
            render(view: '_subscriptionDetails', model: [trendingTopics: []])

        }
    }

    def getTopicNames() {
        render(topicsService.getTopicNames(session.user.id) as JSON)
    }

    def addPosts() {
        Topic topic = Topic.findByName(params.topicname)
        User user = User.findById(params.userid.toLong())

        if (topicsService.addPost(topic, user, params.url, params.description)) {
            render("added")
        } else {
            render("failed")
        }


    }

    def getInboxPosts() {
       // print(params.offset.toLong())
        def postsList=topicsService.getInboxPosts(session.user.id, params.offset.toLong())
        if(postsList){
            render(view: '/posts/_posts', model: [postsList: postsList])
        }else{
            render(view: '/posts/_posts', model: [postsList: []])
        }

    }

    def saveDoc() {

        if (params) {
            User user = User.get(session.user.id)
            Topic topic = Topic.findByName(params.selectedTopicName)
            println(params.description)
            String a = "/assets/docs/${session.user.id}.pdf"
            def file = params.filePath.getBytes()
            FileOutputStream fos = new FileOutputStream("/home/jayaram-kruthik/grailsws/rxLinkSharing-master/grails-app /assets/docs/${session.user.id}.pdf")
            fos.write(file)
            fos.close()
            println("file added")
            DocumentResource documentResource = new DocumentResource(documentUrl: "/home/jayaram-kruthik/grailsws/rxLinkSharing-master/grails-app/assets/docs/${session.user.id}.pdf")

            Resource resource = new Resource(description: params.docdescription, createdBy: user, topic: topic, documentresource: documentResource).save(flush: true, failOnError: true);
            if (resource) {
                redirect(action: 'index')
            } else {

            }


        } else {
        }
    }


    def deleteTopic() {
        Topic t = Topic.get(params.topicid.toLong())
        //  print( topicsService.deleteTopic(t))
        if (!topicsService.deleteTopic(t)) {
            render("success")
        } else {
            render("fail")
        }


    }

    def geTrendingTopics() {
        def trendingTopics = topicsService.getTrendingTopics(session.user.id.toLong());
        def tt = trendingTopics.collect {
            it[0]

        }
//        render(trendingTopics)
        if (trendingTopics) {
            render(view: '_subscriptionDetails', model: [trendingTopics: tt])
        } else {
            render(view: '_subscriptionDetails', model: [trendingTopics: []])
        }

    }


    def topicsList(){
        render(view: 'topicsList')
    }
    def retreiveList(){
        //render(topicsService.retreiveList(session.user.id))
      def listOfTopics=topicsService.retreiveList(session.user.id)
        if(listOfTopics){
            render(view: '_subscriptionDetails', model: [trendingTopics:listOfTopics])
        }else{
            render(view: '_subscriptionDetails', model: [])
        }


    }

    def readItem(){
   //     render(params.rId.toLong())
        def marked=postsService.makeRead(session.user.id,params.rId.toLong())
    }
}
