package linksharingdomain

class ResourceRating {
    static belongsto=[resources:Resource,user:User]
    int score;

    static constraints ={

        score nullable: false,maxsize:255


    }

}
