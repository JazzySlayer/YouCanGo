<%@ page import="youcango.Member" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-member" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-member" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list member">

        <g:if test="${memberInstance?.memberId}">
            <li class="fieldcontain">
                <span id="memberId-label" class="property-label"><g:message code="member.memberId.label"
                                                                            default="Member Id"/></span>

                <span class="property-value" aria-labelledby="memberId-label"><g:fieldValue bean="${memberInstance}"
                                                                                            field="memberId"/></span>

            </li>
        </g:if>

        <g:if test="${memberInstance?.firstName}">
            <li class="fieldcontain">
                <span id="firstName-label" class="property-label"><g:message code="member.firstName.label"
                                                                             default="First Name"/></span>

                <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${memberInstance}"
                                                                                             field="firstName"/></span>

            </li>
        </g:if>

        <g:if test="${memberInstance?.lastName}">
            <li class="fieldcontain">
                <span id="lastName-label" class="property-label"><g:message code="member.lastName.label"
                                                                            default="Last Name"/></span>

                <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${memberInstance}"
                                                                                            field="lastName"/></span>

            </li>
        </g:if>

        <g:if test="${memberInstance?.middleName}">
            <li class="fieldcontain">
                <span id="middleName-label" class="property-label"><g:message code="member.middleName.label"
                                                                              default="Middle Name"/></span>

                <span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${memberInstance}"
                                                                                              field="middleName"/></span>

            </li>
        </g:if>

        <g:if test="${memberInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="member.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${memberInstance}"
                                                                                         field="email"/></span>

            </li>
        </g:if>

        <g:if test="${memberInstance?.alterEmail}">
            <li class="fieldcontain">
                <span id="alterEmail-label" class="property-label"><g:message code="member.alterEmail.label"
                                                                              default="Alter Email"/></span>

                <span class="property-value" aria-labelledby="alterEmail-label"><g:fieldValue bean="${memberInstance}"
                                                                                              field="alterEmail"/></span>

            </li>
        </g:if>

        <g:if test="${memberInstance?.isMember}">
            <li class="fieldcontain">
                <span id="isMember-label" class="property-label"><g:message code="member.isMember.label"
                                                                            default="Is Member"/></span>

                <span class="property-value" aria-labelledby="isMember-label"><g:formatBoolean
                        boolean="${memberInstance?.isMember}"/></span>

            </li>
        </g:if>

        <g:if test="${memberInstance?.fullName}">
            <li class="fieldcontain">
                <span id="fullName-label" class="property-label"><g:message code="member.fullName.label"
                                                                            default="Full Name"/></span>

                <span class="property-value" aria-labelledby="fullName-label"><g:fieldValue bean="${memberInstance}"
                                                                                            field="fullName"/></span>

            </li>
        </g:if>

        <g:if test="${memberInstance?.role}">
            <li class="fieldcontain">
                <span id="role-label" class="property-label"><g:message code="member.role.label" default="Role"/></span>

                <span class="property-value" aria-labelledby="role-label"><g:link controller="role" action="show"
                                                                                  id="${memberInstance?.role?.id}">${memberInstance?.role?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${memberInstance?.status}">
            <li class="fieldcontain">
                <span id="status-label" class="property-label"><g:message code="member.status.label"
                                                                          default="Status"/></span>

                <span class="property-value" aria-labelledby="status-label"><g:link controller="status" action="show"
                                                                                    id="${memberInstance?.status?.id}">${memberInstance?.status?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${memberInstance?.id}"/>
            <g:link class="edit" action="edit" id="${memberInstance?.id}"><g:message code="default.button.edit.label"
                                                                                     default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
