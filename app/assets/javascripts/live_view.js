

$(document).ready(function(){
  function fetchdata(){
    var gameId = ($("#game_id").val());
    $.get("/api/v1/editor/get_game?game_id=" + gameId, function(data, status){
      $("#score1").html(data.score1);
      $("#score2").html(data.score2);
    });
  }

  function getPlayingPlayers(){
    var gameId = ($("#game_id").val());
    $.get("/api/v1/editor/get_players?game_id=" + gameId, function(data, status){
      var template = "";
      for (i = 0; i < data.first.length; i++)  {
        template = template + 
        "<tr>" +
          "<td style='width: 350px;'>" +
            "<h4>" +
              "<img src='" + data.first[i].image + "' ></img>" +
              data.first[i].name +
            "</h4>"
          "</td>"
        "</tr>";
      }
      $(".statistics-live-data-1st").html(template);
      template = ""
      for (i = 0; i < data.second.length; i++)  {
        template = template + 
        "<tr>" +
          "<td style='width: 350px;'>" +
            "<h4>" +
              "<img src='" + data.second[i].image + "' ></img>" +
              data.second[i].name +
            "</h4>"
          "</td>"
        "</tr>";
      }
      $(".statistics-live-data-2nd").html(template);
    });
  }



  setInterval(fetchdata,2000);
  setInterval(getPlayingPlayers,2000);
 
});