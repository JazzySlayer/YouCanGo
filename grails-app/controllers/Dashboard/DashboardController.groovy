package Dashboard
import Commons.YCGcommons
import grails.converters.JSON
import youcango.Member
import youcango.Role
import youcango.Status

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
        def status = Member.executeUpdate("update Member set status = 1 where id ="+info.id+"");
        def memberList = searchAllTeacher();
        render(view: "dashboardForAll", model: [userInfo:info, userStatus:status, memberList: memberList])
    }
    def updateStatus(){
        println "Enbtered"
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
        model: [userInfoStatus: info]

    }

    def checkAfterRefresh(){
        def userList = Member.findAllByRole(YCGcommons.ROLE_TEACHER)
        def userName = Member.findAllByFullName(userList)
        def userStatus = Member.findAllByStatusInList(userList)
        render(template: "updated_Status", model: [name:userName, status:userStatus])
    }
    def searchAllTeacher(){
        print "Entered"
        params.max = Math.min(params.max ?: 10, 100)
        def role = Role.findByAuthority(YCGcommons.ROLE_TEACHER)
        def memberList = Member.findAllByRole(role, params.max)
        return memberList;
    }


    def renderAjaxMemberList(){
        def memberList = searchAllTeacher();
        if(params.name || params.status){
            if(params.name && !params.status){
                memberList = Member.createCriteria().list{
                    like('fullName',params.name+"%")
                }
            }else if (params.status && !params.name){
                def searchStatus;
                    if(params.status=='1'){
                        searchStatus = Status.get(1)
                    }else if(params.status=='2'){
                        searchStatus = Status.get(2)
                    }else if(params.status=='3'){
                        searchStatus = Status.get(3)
                    }
                println "searchStatus = $searchStatus"
                    memberList = Member.createCriteria().list{
                        like('status',searchStatus)

                }
            }else{
                memberList = Member.createCriteria().list{
                    def searchStatus;
                    if(params.status=='1'){
                        searchStatus = Status.get(1)
                    }else if(params.status=='2'){
                        searchStatus = Status.get(2)
                    }else if(params.status=='3'){
                        searchStatus = Status.get(3)
                    }
                    println "searchStatus = $searchStatus"
                    like('fullName',params.name+"%")
                    like('status',searchStatus)

                }
            }

        }
        render(template: "dashboardAfterChange",model: [memberList:memberList]);

    }
}
