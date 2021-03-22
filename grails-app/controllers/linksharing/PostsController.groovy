package linksharing

import grails.converters.JSON

class PostsController {
    PostsService postsService;
    TopicsService topicsService;
    def index() {

    }
def getTopicDetails(){
print(params.topicName)
    render(view:'topicposts',model: [topicDetails:topicsService.getTopicDetails(params.topicName)])

}
def getUsersByTopic(){
    print(topicsService.getUsersOfTopic(params.topic))
   render( view:'_userlist',model: [usersList: topicsService.getUsersOfTopic(params.topic) ])
    //render(topicsService.getUsersOfTopic("athena")  as JSON)
}

    def getPosts(){
      render(  view:'_posts',model: [postsList: postsService.getPosts(session.user.id,params.topic)] );
    }

    def viewpost(){
        def posts=postsService.postsdata(params.titleid.toLong())
       if(posts){
           render(view:'viewpost', model: [postsdata:posts])
       }
        else{
           render(view:'viewpost')
       }
    }


}
