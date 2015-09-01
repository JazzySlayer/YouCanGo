package Dashboard
import Commons.YCGcommons
import youcango.Member
import youcango.Role

class DashboardController {
    Role role
    def index() {}
    def getUser(){
        return session.getAttribute("name")
    }
    def getId(){
        return session.getAttribute("id")
    }
    def dashboard_teacher(){
        def user = session.getAttribute("name")
        def info = Member.findByFullName(user)
        def role = Role.findByAuthority(YCGcommons.ROLE_TEACHER)
        def status = Member.executeUpdate("update Member set status = 1")
        def memberList = searchAllTeacher();
        render(view: "dashboardForAll", model: [userInfo:info, userStatus:status, memberList: memberList])
    }
    def updateStatus(){
        def status = params.status;
        println "1"+status
        def id = getId()
        println "2"
        def info = Member.findById(id)
        println "3"
        info.status = status
        println "4"
        def memberList = searchAllTeacher();
        println "5"
        render(template: "dashboardAfterChange", model: [userInfo: info, memberList: memberList])

    }

    def checkAfterRefresh(){
        def userList = Member.findAllByRole(YCGcommons.ROLE_TEACHER)
        def userName = Member.findAllByFullName(userList)
        def userStatus = Member.findAllByStatusInList(userList)
        render(template: "updated_Status", model: [name:userName, status:userStatus])
    }
    def searchAllTeacher(){
        params.max = Math.min(params.max ?: 10, 100)
        def role = Role.findByAuthority(YCGcommons.ROLE_TEACHER)
        def status = Member.executeUpdate("update Member set status = 1")
        def memberList = Member.findAllByRole(role, params.max)
        return memberList;
    }
}
