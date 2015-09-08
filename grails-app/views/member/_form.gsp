<%@ page import="youcango.Member" %>



%{--
<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'memberId', 'error')} ">
    <label for="memberId">
        <g:message code="member.memberId.label" default="Member Id"/>

    </label>
--}%
    <g:hiddenField name="memberId" value="${memberInstance?.memberId}"/>
%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'firstName', 'error')} required">
    <label for="firstName">
        <g:message code="member.firstName.label" default="First Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="firstName" pattern="${memberInstance.constraints.firstName.matches}" required=""
                 value="${memberInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'lastName', 'error')} required">
    <label for="lastName">
        <g:message code="member.lastName.label" default="Last Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="lastName" pattern="${memberInstance.constraints.lastName.matches}" required=""
                 value="${memberInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'middleName', 'error')} ">
    <label for="middleName">
        <g:message code="member.middleName.label" default="Middle Name"/>

    </label>
    <g:textField name="middleName" pattern="${memberInstance.constraints.middleName.matches}"
                 value="${memberInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'email', 'error')} required">
    <label for="email">
        <g:message code="member.email.label" default="Email"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="email" name="email" required="" value="${memberInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'alterEmail', 'error')} ">
    <label for="alterEmail">
        <g:message code="member.alterEmail.label" default="Alter Email"/>

    </label>
    <g:field type="email" name="alterEmail" value="${memberInstance?.alterEmail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'isMember', 'error')} ">
    <label for="isMember">
        <g:message code="member.isMember.label" default="Is Member"/>

    </label>
    <g:checkBox name="isMember" value="${memberInstance?.isMember}"/>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'fullName', 'error')} ">
    <label for="fullName">
        <g:message code="member.fullName.label" default="Full Name"/>

    </label>--}%
    <g:hiddenField name="fullName" value="${memberInstance?.fullName}"/>
%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'role', 'error')} required">
    <label for="role">
        <g:message code="member.role.label" default="Role"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="role" name="role.id" from="${youcango.Role.list()}" optionKey="id" required=""
              value="${memberInstance?.role?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'status', 'error')} required">
    <label for="status">
        <g:message code="member.status.label" default="Status"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="status" name="status.id" from="${youcango.Status.list()}" optionKey="id" required=""
              value="${memberInstance?.status?.id}" class="many-to-one"/>
</div>

