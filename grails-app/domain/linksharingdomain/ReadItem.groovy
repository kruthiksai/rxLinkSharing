package linksharingdomain

class ReadItem
{
  static belongsto=[resources:Resource, user:User];
    boolean isRead;

  static constraints ={

    isRead nullable: false,maxsize:255


  }
}
