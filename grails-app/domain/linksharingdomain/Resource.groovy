package linksharingdomain

class Resource {
    String description;
    Date dateCreated
    Date lastUpdated
    static belongsTo=[topic:Topic, createdBy:User,resourceRating :ResourceRating,linkResource : LinkResource,documentresource:DocumentResource]
  //  static hasMany=[]
//    static hasOne = [];

    static constraints ={

        description nullable: false,maxsize:255
        documentresource nullable: true
        linkResource nullable: true
        resourceRating nullable: true
    }

    static mapping = {//    datasource()
        table 'posts_table'}
}
