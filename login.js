this.logged = false;
$("#Start").click(function(){
    if($("#User").val() == "Usuario" && $("#Password").val() == '12345'){
    logged = true;
    if (logged == true){
            window.location = './index.html'
           }
        }
        else{
                swal.fire('Incorrect user or password');
        }    
});
