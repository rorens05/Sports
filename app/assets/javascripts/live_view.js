

$(document).ready(function(){
  function fetchdata(){
    var gameId = ($("#game_id").val());
    $.get("/api/v1/editor/get_game?game_id=" + gameId, function(data, status){
      $("#score1").html(data.score1);
      $("#score2").html(data.score2);
      
    });
  }

  setInterval(fetchdata,2000);

 });