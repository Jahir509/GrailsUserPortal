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