
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
});