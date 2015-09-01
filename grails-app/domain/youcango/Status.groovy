package youcango

class Status {
    String status
    static mapping = {
        cache true
    }

    static constraints = {
        status blank: false, unique: true
    }
    String toString(){
        return status
    }
}
