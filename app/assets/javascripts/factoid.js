$(document).ready(function(){

  var refreshable = true;


    $("body").on("click", "#new-facts button", function(event){
      event.preventDefault();

      if(refreshable === true){
        refreshable = false;
        $("#circle-arrow").attr("style", "");

        $.ajax({
          url: "/factoids",
          type: "get"
        }).always(function(){
          $("#circle-arrow").transition({
            rotate: '360deg',
            duration: 600
          });
        }).done(function(resp){
          $("#factoid-display").empty().append(resp);
          refreshable = true;
        }).fail(function(respo){
          console.log(Error("Couldn't reload facts"));
          refreshable = true;
        });
      }
    });

});
