$(document).ready(function(){

  $("body").on("click", "#new-facts button", function(event){
    event.preventDefault();

    $.ajax({
      url: "/factoids",
      type: "get"
    }).done(function(resp){
      $("#factoid-display").empty().append(resp);
    }).fail(function(respo){
      console.log(Error("Couldn't reload facts"));
    });
  });

});