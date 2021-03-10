package linksharingdomain

class DocumentResource {
    String documentUrl;
  static belongsto=[resources:Resource];

    static constraints ={

        documentUrl nullable: false


    }

}
