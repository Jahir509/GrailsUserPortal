<meta name="layout" content="main"/>

<div id="content-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-md-6 mx-auto">
                <div class="card">
                    <div class="card-header">
                        Member Registration
                    </div>

                    <div class="card-body">
                        <g:form controller="dashboard" action="updatePassword" >
                            <g:hiddenField name="id" value="${user.id}"/>
                            <g:hiddenField name="firstname" value="${user?.firstname}"/>
                            <g:hiddenField name="lastname" value="${user?.lastname}"/>
                            <g:hiddenField name="address" value="${user?.address}"/>
                            <g:hiddenField name="phone" value="${user?.phone}"/>
                            <g:hiddenField type="email" name="email" id="email" value="${user?.email}"/>
                            <g:hiddenField type="date" name="birthdate" value="${user?.birthdate}"/>
                            <div class="form-group">
                                <label><g:message code="oldpassword"/> </label>
                                <g:passwordField name="oldPassword" id="oldPassword" class="form-control"
                                                 />
                                <span id="errorOldPasswordMessage"></span>
                            </div>    <div class="form-group">
                            <label><g:message code="password1"/> </label>
                            <g:passwordField name="password1" id="password1" class="form-control"
                                             />
                            <span id="errorPasswordMessage"></span>
                        </div>
                            <g:if test="${!edit}">
                                <div class="form-group">
                                    <label><g:message code="password2"/> </label>
                                    <g:passwordField name="password" id="password2" class="form-control"
                                                     />
                                    <span id="errorPassword2Message"></span>
                                </div>
                            </g:if>
                            <!------------------------------------------------------------------------------------------------->
                            <g:submitButton name="save" id="save" value="Save"
                                            class="btn btn-primary"/>
                            <g:link controller="authentication" action="login" class="btn btn-primary"><g:message
                                    code="back.to.login"/></g:link>
                        </g:form>
                    </div>
                    <div id="MyPopup" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-sm">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">
                                    </h4>
                                </div>
                                <div class="modal-body">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                                        Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        var isValid=false;
       $("#oldPassword").change(function(){
           $("#errorOldPasswordMessage").empty();
           var email =  $("#email").val();
           var password =  $.MD5($(this).val());
           var param = {email:email};
           $.ajax({
               url: "${createLink(controller:'dashboard',action:'checkUser')}",
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               data: param,
               success: function (rdata) {
                   if (rdata.password === password){
                       //alert("this email has already taken");
                       var message = '<p class="form-text text-success"><strong>Password is matched</strong></p>';
                       $("#errorOldPasswordMessage").html(message);
                       setTimeout(function(){
                           $("#errorOldPasswordMessage").empty();
                       },1000);
                       isValid = true;

                   }
                   else{
                       var message = '<p class="form-text text-danger"><strong>Password did not match</strong></p>';
                       $("#errorOldPasswordMessage").html(message);
                       isValid = false;
                   }
                   return;

               }
           })
       })


        $("#save").click(function(){
            if(isValid === true && isNewPassword === true){
               // alert(isValid +'+'+isNewPassword);
                return true;
            }
            else{
                var title = "Bit-mascot Application";
                var body = "Please provide password";

                $("#MyPopup .modal-title").html(title);
                $("#MyPopup .modal-body").html(body);
                $("#MyPopup").modal("show");
                setTimeout(function() {
                    $('#MyPopup').modal('hide');
                }, 2000);
                return false;
            }
        });
        var isNewPassword = true;
        $("#password2").change(function(){
            $("#errorPassword2Message").empty();
            var pass1 = $.MD5($("#password1").val());
            var pass2 = $.MD5($("#password2").val());
            if(pass1 !== pass2){
                var message = '<p class="form-text text-danger"><strong>New Passwords did not match</strong></p>';
                $("#errorPassword2Message").html(message);
                isNewPassword = false;
                return
            }
            else{
                isNewPassword = true;
                return
            }
        });
        $("#password1").change(function(){
            $("#errorPassword2Message").empty();
            var pass1 = $.MD5($("#password1").val());
            var pass2 = $.MD5($("#password2").val());
            if(pass1 !== pass2){
                var message = '<p class="form-text text-danger"><strong>New Passwords did not match</strong></p>';
                $("#errorPassword2Message").html(message);
                isNewPassword = false;
                return
            }
            else{
                isNewPassword = true;
                return
            }
        });
    });
</script>
