package linksharingdomain

class DocumentResource {
    String documentUrl;
  static belongsTo=[resources:Resource];

    static constraints ={

        documentUrl nullable: false


    }

}
