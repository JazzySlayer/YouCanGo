<%--
  Created by IntelliJ IDEA.
  User: Sushant
  Date: 7/22/2015
  Time: 9:54 PM
--%>

<%@ page import="Dashboard.DashboardController" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script src="${resource(dir: 'js', file: 'jquery-1.11.3.js')}"> </script>
    <script>
        $(document).ready(function(){
            $("input[type=radio]").click(function(){
                updateStatus();
            })
            setInterval(function(){
                $.ajax({
                    url:"${createLink(controller: 'DashboardController', action: 'searchAllTeacher')}",
                    type: post,
                    success: function (resp) {
                        if(resp=="noValue"){
                            $('#div_2').html("No Patients found");
                        }else{
                            $('#div_2').html(resp);
                            %{--$(".excel").attr("href","${createLink(controller: "clnPatientRegistration", action: "exportToExcel", params: [format:'excel',extension:'xls'])}"+ $("#excelParams").val());--}%
                        }
                    }
                })
            })
        })
        function updateStatus(){
            var rates = document.getElementsByName('status');
            var rate_value;
            var i;
            for(i = 0; i < 3; i++){
                if(rates[i].checked){
                    rate_value = rates[i].value;
                    alert(rate_value);
                }
            }
            ${remoteFunction(controller: 'dashboard' , action:'updateStatus', params: '{status: rate_value}', update: 'own_status')}
        }
    </script>
</head>

<body>

        <div id="1" style="width:30%; display:inline-block; border: 3px solid; margin-top:14px; padding:10px;">
            <div id="status">
                Welcome ${userInfo?.fullName},<br><g:if test="${userInfo?.role.toString() == Commons.YCGcommons.ROLE_TEACHER}">
                Your Status is <span id="own_status">
                    <g:if test="${userInfo.status.toString() == Commons.YCGcommons.STATUS_ACTIVE}">Available<img src="${resource(dir: 'images', file: 'av.png')}" style="height: 14px;width: 14px"></g:if>
                    <g:if test="${userInfo.status.toString() == Commons.YCGcommons.STATUS_INACTIVE}">Unavailable<img src="${resource(dir: 'images', file: 'download.png')}" height="14" width="14"></g:if>
                    <g:if test="${userInfo.status.toString() == Commons.YCGcommons.STATUS_BUSY}">Busy<img src="${resource(dir: 'images', file: 'bu.png')}" height="14" width="14"></g:if>
                </div>
                <br>Status
                <div class="inner" id="chooseStatus" style=" border:1px solid; width:30%; margin-left: 10px; padding: 10px;">
                    <input type="radio" name="status" value="1">Available<br>
                    <input type="radio" name="status" value="2">Busy<br>
                    <input type="radio" name="status" value="3">Unavailable<br>
                </div>
                </g:if>
            </div>
            Search<br>
            <div class="inner2" style="margin: 0px auto; width: 95%; border: 3px solid; margin: 10px; padding: 10px;">
                Username
                <br>
                <input type="textfield"><br>
                Status
                <br>
                <input type="textfield"><br>
                <input type="button" value="Search">
            </div>
        </div>
        <div id="div_2" style="width:15%; display:inline-block; border: 3px solid; position:absolute; top:0 ;   right: 706px;
        float: left;
        margin-top: 14px;
        padding: 10px;">
            <g:render template="dashboardAfterChange"/>
        </div>

</body>
</html>