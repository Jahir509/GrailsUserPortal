<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Bit Mascot User Portal"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <style>
    .modal {
        text-align: center;
        padding: 0!important;
    }
    .modal:before {
        content: '';
        display: inline-block;
        height: 100%;
        vertical-align: middle;
        margin-right: -4px;
    }
    .modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
    }
    </style>
    <script type="text/javascript">
        <g:if test="${flash?.message && flash?.message?.info}">
        jQuery(document).ready(function () {
            OCB.messageBox.showMessage(Boolean(${flash.message?.success}), "${flash.message?.info}");
        });
        </g:if>
    </script>
    <script>
        $(document).ready(function () {
            var isValid = true;

            $("#email").change(function () {
                var email = $(this).val();
                var param = {email: email};
                $.ajax({
                    url: "${createLink(controller:'authentication',action:'checkUser')}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: param,
                    success: function (rdata) {
                        if (rdata.email === email) {
                            $("#errorMailMessage").empty();
                            //alert("this email has already taken");
                            var message = '<small class="form-text text-danger"><strong>this email has already taken</strong></small>';
                            $("#errorMailMessage").html(message);
                            isValid = false;
                            return
                        }
                    },
                    error: function (request, status, error) {
                        isValid = false;
                        return
                    },
                    complete: function () {
                    }
                });
            });

        });
    </script>
    <g:layoutHead/>
</head>

<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark rounded">
        <a class="navbar-brand" href="#">Bit Mascot User Portal</a>
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <ul class="navbar-nav ml-auto">
            <UIHelper:memberActionMenu/>
        </ul>
    </nav>
</header>

<div class="container-fluid">
    <div class="row">
        <nav class="col-sm-2 col-md-2 bg-light sidebar">
            <ul class="list-group">
                <UIHelper:leftNavigation/>
            </ul>
        </nav>
        <main role="main" class="col-sm-10 ml-sm-auto col-md-10 pt-3">
            <g:layoutBody/>
        </main>
    </div>
</div>
</body>
</html>