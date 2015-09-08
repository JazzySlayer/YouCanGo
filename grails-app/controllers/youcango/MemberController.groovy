package youcango

import Commons.YCGcommons
import org.springframework.dao.DataIntegrityViolationException

class MemberController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def MemberList = Member.executeQuery("from Member where role != '" + YCGcommons.ROLE_ADMIN+"'")
        [memberInstanceList: Member.list(params), memberInstanceTotal: Member.count()]
    }

    def create() {
        [memberInstance: new Member(params)]
    }

    def save() {
        def memberInstance = new Member()
        memberInstance.firstName=params.firstName
        memberInstance.lastName=params.lastName
        memberInstance.middleName=params.middleName
        memberInstance.email=params.email
        memberInstance.alterEmail=params.alterEmail
        memberInstance.isMember=params.isMember
        memberInstance.fullName=params.firstName+" "+params.middleName+" "+params.lastName
        memberInstance.role=Role.findById(params.role.id as long)
        memberInstance.status=Status.findById(params.status.id as long)
        if (!memberInstance.save(flush: true)) {
            render(view: "create", model: [memberInstance: memberInstance])
            return
        }
        def user=new User()
        user.username=params.email
        user.password=params.firstName+"."+params.lastName
        user.member=Member.findById(memberInstance.id)
        if (!user.save(flush: true)) {
            render(view: "create", model: [memberInstance: memberInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'member.label', default: 'Member'), memberInstance.id])
        redirect(action: "show", id: memberInstance.id)
    }

    def show(Long id) {
        def memberInstance = Member.get(id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
            return
        }

        [memberInstance: memberInstance]
    }

    def edit(Long id) {
        def memberInstance = Member.get(id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
            return
        }

        [memberInstance: memberInstance]
    }

    def update(Long id, Long version) {
        def memberInstance = Member.get(id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (memberInstance.version > version) {
                memberInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'member.label', default: 'Member')] as Object[],
                        "Another user has updated this Member while you were editing")
                render(view: "edit", model: [memberInstance: memberInstance])
                return
            }
        }

        memberInstance.properties = params
        params.clear()
        if (!memberInstance.save(flush: true)) {
            render(view: "edit", model: [memberInstance: memberInstance])
            return
        }
        params["username"]=memberInstance.email
        params["password"]=memberInstance.firstName+"."+memberInstance.lastName
        params["member"]=Member.findById(memberInstance.id)
        def user=User.findByMember(Member.findById(memberInstance.id))
        if(user){
        user.properties=params
        if (!user.save(flush: true)) {
            render(view: "edit", model: [memberInstance: memberInstance])
            return
        }
        }
        flash.message = message(code: 'default.updated.message', args: [message(code: 'member.label', default: 'Member'), memberInstance.id])
        redirect(action: "show", id: memberInstance.id)
    }

    def delete(Long id) {
        def memberInstance = Member.get(id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
            return
        }

        try {

            def user=new User()
            user=User.findAllByMember(Member.findById(id))
            if(user){
            for(int i=0;i<user.size();i++){
                user[i].delete(flush: true)
            }
            }
            memberInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "show", id: id)
        }
    }
}
