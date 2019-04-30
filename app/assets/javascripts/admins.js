
function resize() {
  if ($(window).width() < 514) {
    $('.sidebar').addClass('hidden');
    $('.content').addClass('fullscreen');
  }
  else {
    $('sidebar').removeClass('hidden');
  }
}


$( document ).ready(function() {
  $(window).resize(resize);
  resize();
  
  $(".toggle").click(function(){
    $(".sidebar").toggleClass("hidden");
    $(".content").toggleClass("fullscreen");
    
    if ($(window).width() < 514) {
      $(".admin-name").toggleClass("hidden");;
      $(".controller-name").toggleClass("hidden");
      $(".body").toggleClass("hidden");
    }
    console.log("toggled");
  });

  $(".playingChecked").change(function(){
    var id = $(this).parent().find(".id").val();
    $.post("/api/v1/editor/update_is_playing",
    {
      id: id,
    },
    function(data,status){
      console.log("Data: " + data.message + "\nStatus: " + status);
    });
  })

  $(".btn-add-points").click(function(){
    var id = $(this).parent().find(".id").val();
    var value = $(this).parent().find(".statistics-details").html();
    var nextValue = parseInt(value) + 1;
    $(this).parent().find(".statistics-details").html(nextValue);

    $.post("/api/v1/editor/add_points",
    {
      id: id,
    },
    function(data,status){
      console.log("Data: " + data.message + "\nStatus: " + status);
    });
  })


  $(".btn-sub-points").click(function(){
    var id = $(this).parent().find(".id").val();
    var value = $(this).parent().find(".statistics-details").html();
    var nextValue = parseInt(value) - 1;
    $(this).parent().find(".statistics-details").html(nextValue);

    $.post("/api/v1/editor/sub_points",
    {
      id: id,
    },
    function(data,status){
      console.log("Data: " + data.message + "\nStatus: " + status);
    });
  })

  $(".btn-add-assist").click(function(){
    var id = $(this).parent().find(".id").val();
    var value = $(this).parent().find(".statistics-details").html();
    var nextValue = parseInt(value) + 1;
    $(this).parent().find(".statistics-details").html(nextValue);

    $.post("/api/v1/editor/add_assist",
    {
      id: id,
    },
    function(data,status){
      console.log("Data: " + data.message + "\nStatus: " + status);
    });
  })

  $(".btn-sub-assist").click(function(){
    var id = $(this).parent().find(".id").val();
    var value = $(this).parent().find(".statistics-details").html();
    var nextValue = parseInt(value) - 1;
    $(this).parent().find(".statistics-details").html(nextValue);

    $.post("/api/v1/editor/sub_assist",
    {
      id: id,
    },
    function(data,status){
      console.log("Data: " + data.message + "\nStatus: " + status);
    });
  })

  $(".btn-add-foul").click(function(){
    var id = $(this).parent().find(".id").val();
    var value = $(this).parent().find(".statistics-details").html();
    var nextValue = parseInt(value) + 1;
    $(this).parent().find(".statistics-details").html(nextValue);

    $.post("/api/v1/editor/add_foul",
    {
      id: id,
    },
    function(data,status){
      console.log("Data: " + data.message + "\nStatus: " + status);
    });
  })

  $(".btn-sub-foul").click(function(){
    var id = $(this).parent().find(".id").val();
    var value = $(this).parent().find(".statistics-details").html();
    var nextValue = parseInt(value) - 1;
    $(this).parent().find(".statistics-details").html(nextValue);

    $.post("/api/v1/editor/sub_foul",
    {
      id: id,
    },
    function(data,status){
      console.log("Data: " + data.message + "\nStatus: " + status);
    });
  })
  $(".btn-add-rebound").click(function(){
    var id = $(this).parent().find(".id").val();
    var value = $(this).parent().find(".statistics-details").html();
    var nextValue = parseInt(value) + 1;
    $(this).parent().find(".statistics-details").html(nextValue);

    $.post("/api/v1/editor/add_rebound",
    {
      id: id,
    },
    function(data,status){
      console.log("Data: " + data.message + "\nStatus: " + status);
    });
  })

  $(".btn-sub-rebound").click(function(){
    var id = $(this).parent().find(".id").val();
    var value = $(this).parent().find(".statistics-details").html();
    var nextValue = parseInt(value) - 1;
    $(this).parent().find(".statistics-details").html(nextValue);

    $.post("/api/v1/editor/sub_rebound",
    {
      id: id,
    },
    function(data,status){
      console.log("Data: " + data.message + "\nStatus: " + status);
    });
  })
});