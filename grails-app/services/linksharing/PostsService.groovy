package linksharing

import grails.gorm.transactions.Transactional
import linksharingdomain.ReadItem
import linksharingdomain.Resource
import linksharingdomain.Subscription
import linksharingdomain.Topic
import linksharingdomain.User
import oracle.jdbc.proxy.annotation.Post

@Transactional
class PostsService {

    def serviceMethod() {

    }

    def getPosts(long id,String topicName){
     //   def topicsList= Topic.findByUserAndName(User.findById(id),"grails")
def subs= Subscription.findByTopicAndUser(Topic.findByName(topicName),User.findById(id))



        if(subs ){
            def postList= Resource.findAllByTopic(Topic.findByName(topicName))
            return postList;
        }else{
            return null;
        }

    }

    def postsdata(long id){
        def post=Resource.findById(id)
        if(post){
            return post;
        }else{
            return null;
        }


    }

    def getRecentPosts(){
        def recentPosts=Resource.createCriteria().list {

            topic{
                eq('topicShow',"public")
            }

        }
        return recentPosts
    }


    def makeRead(long uid,long rid){
        ReadItem readItem=new ReadItem(isRead: true,resources:Resource.findById(uid))

    }
}
