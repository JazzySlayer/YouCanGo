<%@ page contentType="text/html;charset=UTF-8" %>
Nextpage
Welcome ${userInfo?.fullName},<br><g:if test="${userInfo?.role.toString() == Commons.YCGcommons.ROLE_TEACHER}">
    Your Status is
    <g:if test="${userInfo.status.toString() == Commons.YCGcommons.STATUS_ACTIVE}">Available<img src="${resource(dir: 'images', file: 'av.png')}" style="height: 14px;width: 14px"></g:if>
    <g:if test="${userInfo.status.toString() == Commons.YCGcommons.STATUS_INACTIVE}">Unavailable<img src="${resource(dir: 'images', file: 'download.png')}" height="14" width="14"></g:if>
    <g:if test="${userInfo.status.toString() == Commons.YCGcommons.STATUS_BUSY}">Busy<img src="${resource(dir: 'images', file: 'bu.png')}" height="14" width="14"></g:if>
    <br>Status
    <div class="inner" id="chooseStatus" style=" border:1px solid; width:30%; margin-left: 10px; padding: 10px;">
        <input type="radio" name="status" value="1">Available<br>
        <input type="radio" name="status" value="2">Busy<br>
        <input type="radio" name="status" value="3">Unavailable<br>
    </div>
</g:if>