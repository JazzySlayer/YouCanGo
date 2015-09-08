package youcango

class User {
    def springSecurityService

    String username
    String password
    Member member

    static searchable = true

    static constraints = {
        username blank: false, unique: true,nullable: false
        password blank: false,nullable: false

    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
    String toString(){
        return username
    }
}
