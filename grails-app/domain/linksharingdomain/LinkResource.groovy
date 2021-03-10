package linksharingdomain

class LinkResource
{
    String url;
  static belongsto=[resources:Resource]

    static constraints ={

        url nullable: false


    }
}
