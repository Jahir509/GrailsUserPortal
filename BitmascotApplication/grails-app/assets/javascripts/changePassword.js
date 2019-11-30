
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
