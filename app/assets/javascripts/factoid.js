$(document).ready(function(){

  var refreshable = true;

  if(refreshable === true){
    $("body").on("click", "#new-facts button", function(event){
      event.preventDefault();
      refreshable = false;
      $("#new-facts").attr("style", "");

      $.ajax({
        url: "/factoids",
        type: "get"
      }).always(function(){
        $("#new-facts").transition({
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
    });
  }
});
