package youcango

class Member {
    String memberId
    String firstName
    String lastName
    String middleName
    String email
    String alterEmail
    String fullName = getFullName();
    Boolean isMember
    Role role
    Status status

    String toString(){
        if (middleName!=null){
            return firstName+" "+middleName+" "+lastName+"-"+memberId
        }else{
            return firstName+" "+lastName+"-"+memberId
        }
    }
    String getFullName(){
        if (middleName!=null){
            return firstName+" "+middleName+" "+lastName
        }else{
            return firstName+" "+lastName
        }
    }

    static constraints = {
        memberId(nullable:true)
        firstName(blank:false,matches: "[a-zA-Z ]+",nullable: false)
        lastName(blank:false,matches: "[a-zA-Z-. ]+",nullable: false)
        middleName(blank:true,matches: "[a-zA-Z-. ]+",nullable: true)
        email(blank:false,email:true,nullable: false)
        alterEmail(blank:true,email:true)
        isMember(blank:true)
    }
    void setFirstName( String s ){
        firstName = s?.toUpperCase()
    }
    void setLastName(String s){
        lastName=s?.toUpperCase();
    }
    void setMiddleName(String s){
        middleName=s?.toUpperCase();
    }
    static mapping = { sort "firstName":"asc" }

    //for audit trail
    static auditable = true
}
