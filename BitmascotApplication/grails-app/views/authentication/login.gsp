<meta name="layout" content="loginlayout"/>

<div id="global-wrapper">
    <div id="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 mx-auto">
                    <h1 class="text-center login-title"><strong>Bit Mascot User Portal</strong></h1>

                    <div style="box-shadow: 2px 2px 5px 0px #555" class="account-wall">
                        <div class="text-center">
                            <g:img dir="images" file="bitmascot-logo.jpg" class="profile-img"/>
                        </div>
                        <br>
                        <g:form controller="authentication" action="doLogin" class="form-signin">
                            <g:textField name="email" id="useremail" class="form-control" placeholder="Email"/>
                            <UIHelper:renderErrorMessage fieldName="email" model="${user}"
                                                         errorMessage="email can't be empty"/>
                            <span id="emailError"></span>
                            <g:passwordField name="password" id="userpassword" class="form-control"
                                             placeholder="Password"/>
                            <UIHelper:renderErrorMessage fieldName="password" model="${user}"
                                                         errorMessage="password can't be empty"/>
                            <span id="passwordError"></span>
                            <br>
                            <g:submitButton type="submit" class="btn btn-lg btn-primary btn-block" id="loginButton"
                                            name="login" value="Login"/>
                            <g:link controller="authentication" action="registration"
                                    class="btn btn-lg btn-primary btn-block">User Registration</g:link>
                        </g:form>
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
</div>
<script>
    $(document).ready(function () {


        $("#loginButton").click(function () {
            var flag = [false,false];

           // alert("submit");
            var email = $("#useremail").val();

            var password = $("#userpassword").val();
           if(email === '' || email === null || email === undefined){
                flag[0]=true;
           }
           if(password === '' || password === null || password === undefined){
               flag[1]=true;
           }

           if(flag[0] === true || flag[1] === true){
            var title = "Bit-mascot Application";
            var body = "Invalid Input";

            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
            setTimeout(function() {
                $('#MyPopup').modal('hide');
            }, 2000);
            return false;
           }
           else{
               return true;
           }

        });
    });
</script>
