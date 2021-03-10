package linksharingdomain

class Resource {
    String description;
    Date dateCreated;
    Date dateUpdated;
    static belongsto=[topic:Topic, createdBy:User,resources : LinkResource,documentresource:DocumentResource]
    static hasMany=[readItem:ReadItem,resourceRating :ResourceRating]
//    static hasOne = [];

    static constraints ={

        description nullable: false,maxsize:255


    }
}
