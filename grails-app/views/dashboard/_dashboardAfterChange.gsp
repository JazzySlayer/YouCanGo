<%@ page contentType="text/html;charset=UTF-8" %>
<table class="info-giver">
        <g:each in="${memberList}" var="members">
            <tr>
                <td>
                    <p>${members.fullName} <g:if test="${members.status.toString() == Commons.YCGcommons.STATUS_ACTIVE}"><img src="${resource(dir: 'images', file: 'av.png')}"  height="14px" width="14px" ></g:if>
                    <g:if test="${ members.status.toString() == Commons.YCGcommons.STATUS_INACTIVE}"><img src="${resource(dir: 'images', file: 'download.png')}"  height="14px" width="14px" ></g:if>
                    <g:if test="${members.status.toString() == Commons.YCGcommons.STATUS_BUSY}"><img src="${resource(dir: 'images', file: 'bu.png')}" height="14px" width="14px"></g:if><br></p>
                </td>
            </tr>
        </g:each>
</table>