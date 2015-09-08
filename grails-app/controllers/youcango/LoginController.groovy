package youcango
import Commons.YCGcommons

class LoginController {

    def index() {}
    def authenticate(){
        def user = params.login
        def password = params.password
        def user_mem = User.findByUsernameAndPassword(user, password)
        if(user_mem == null){
            flash.message = "Please enter valid Username and Password!!!"
            return flash.message
        }
        println user_mem
        if(user == "admin"){
            session["name"] = "Admin"
            session["id"] = user_mem?.id
        }
        else{
            session["name"] = user_mem?.member.firstName + " "+user_mem?.member.lastName
            session["id"] = user_mem?.id
        }
        String role = user_mem?.member.role.toString()
        if(role == YCGcommons.ROLE_ADMIN){
            println "Admin entered"
            redirect(controller: "user", action: "list")
        }
        if(role == YCGcommons.ROLE_TEACHER){
            println "Teacher entered"
            redirect(controller: "dashboard", action: "dashboard_teacher")
        }
        if(role == YCGcommons.ROLE_MEMBER){
            println "Member entered"
            redirect(controller: "dashboard", action: "dashboard_teacher")
        }
    }
}
