$(document).ready(function () {
    var isValid = true;
    $("#firstname").change(function () {
        $("#errorNameMessage").empty();
        $("#fName").empty();
        var name = $(this).val();
        console.log(name)
        if (name === undefined || name === "" || name === null) {
            var message = '<p class="text-danger"><strong>Please mention a First Name</strong></p>';
            $("#errorNameMessage").html(message);
            isValid = false;
            return
        }
    });

    $("#lastname").change(function () {
        $("#errorLastNameMessage").empty();
        var name = $(this).val();
        console.log(name)
        if (name === undefined || name === "" || name === null) {
            var message = '<p class="text-danger"><strong>Please mention a Last Name</strong></p>';
            $("#errorLastNameMessage").html(message);
            isValid = false;
            return
        }
    });

    $("#address").change(function () {
        $("#errorAddressMessage").empty();
        var name = $(this).val();
        console.log(name)
        if (name === undefined || name === "" || name === null) {
            var message = '<p class="text-danger"><strong>Please mention address</strong></p>';
            $("#errorAddressMessage").html(message);
            isValid = false;
            return
        }
    });

    $("#phone").change(function () {
        $("#errorPhoneMessage").empty();
        var name = $(this).val();
        console.log(name)
        if (name === undefined || name === "" || name === null) {
            var message = '<p class="text-danger"><strong>Please mention phone number</strong></p>';
            $("#errorPhoneMessage").html(message);
            isValid = false;
            return
        }
    });
    $("#birthdate").change(function () {
        $("#errorDateMessage").empty();
        var name = $(this).val();
        console.log(name)
        if (name === undefined || name === "" || name === null) {
            var message = '<p class="text-danger"><strong>Please mention Date</strong></p>';
            $("#errorDateMessage").html(message);
            isValid = false;
            return
        }
    });

    $("#email").change(function () {
        $("#errorEmailMessage").empty();
        var email = $(this).val();
        var param = {email: email};
        $.ajax({
            url: "${createLink(controller:'authentication',action:'checkUser')}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: param,
            success: function (rdata) {
                if (rdata.email === email) {

                    //alert("this email has already taken");
                    var message = '<p class="form-text text-danger"><strong>this email has already taken</strong></p>';
                    $("#errorEmailMessage").html(message);
                    isValid = false;
                    return
                }
            }
        });
    });

    $("#password").change(function () {
        $("#errorPasswordMessage").empty();
        var name = $(this).val();
        if (name === undefined || name === "" || name === null) {
            var message = '<p class="text-danger">Provide a password</p>';
            $("#errorPasswordMessage").html(message);
            isValid = false;
            return
        }
    });

    $("#registration").click(function () {
        var isTrue = true;
        var firstname = $("#firstname").val();
        var lastname = $("#lastname").val();
        var address = $("#address").val();
        var phone = $("#phone").val();
        var email = $("#email").val();
        var password = $("#password").val();
        var birthdate = $("#birthdate").val();

        if (firstname === undefined || firstname === "" || firstname === null) {
            $("#errorNameMessage").empty();
            isTrue = false;
            $("#errorNameMessage").html('<p class="text-danger"><strong>First name cant be empty</strong></p>');

        }

        if (lastname === undefined || lastname === "" || lastname === null) {
            $("#errorLastNameMessage").empty();
            isTrue = false;
            $("#errorLastNameMessage").html('<p class="text-danger"><strong>Last name cant be empty</strong></p>');

        }

        if (address === undefined || address === "" || address === null) {
            $("#errorAddressMessage").empty();
            isTrue = false;
            $("#errorAddressMessage").html('<p class="text-danger"><strong>Address cant be empty</strong></p>');
        }

        if (phone === undefined || phone === "" || phone === null) {
            $("#errorPhoneMessage").empty();
            isTrue = false;
            $("#errorPhoneMessage").html('<p class="text-danger"><strong>Phone cant be empty</strong></p>');
        }

        if (email === undefined || email === "" || email === null) {
            $("#errorEmailMessage").empty();
            isTrue = false;
            $("#errorEmailMessage").html('<p class="text-danger"><strong>Email cant be empty</strong></p>');
        }

        if (password === undefined || password === "" || password === null) {
            $("#errorPasswordMessage").empty();
            isTrue = false;
            $("#errorPasswordMessage").html('<p class="text-danger"><strong>Password cant be empty</strong></p>');
        }

        if (birthdate === undefined || birthdate === "" || birthdate === null) {
            $("#errorDateMessage").empty();
            isTrue = false;
            $("#errorDateMessage").html('<p class="text-danger"><strong>Date cant be empty</strong></p>');
        }
        if (isTrue === true) {
            return true;
        } else {
            var title = "Bit-mascot Application";
            var body = "Registration Failed";

            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
            setTimeout(function() {
                $('#MyPopup').modal('hide');
            }, 2000);
            return false;
        }

    });
});
