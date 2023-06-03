// Topo fixo
$(window).scroll(function(){
  var sticky = $('header'),
      scroll = $(window).scrollTop();
  if (scroll >= 100) sticky.addClass('fixar');
  else sticky.removeClass('fixar');
});

$(".scroll").click(function(e) {
    var destination = $(this).attr('href');
    e.preventDefault();
    $('html, body').animate({
        scrollTop: $(destination).offset().top
    }, 500);
});

// script carregamento de pagina
$(window).on('load', function() {
    $('#preloader .inner').fadeOut();
    $('#preloader').delay(350).fadeOut('slow');
    $('body').delay(350).css({
        'overflow': 'visible'
    });
});

$("#open-menu-mobile").click(function() {
    $('.menu-mobile').addClass("active");
});
$("#close-menu-mobile").click(function() {
    $('.menu-mobile').removeClass("active");
});

$("#open-acessibilidade").click(function() {
    $('.acessibilidade').addClass("active");
});
$("#close-acessibilidade").click(function() {
    $('.acessibilidade').removeClass("active");
});


// Formulário oportunidade
var divFixa = document.getElementById("formFixo");
var divFixaTop = divFixa.offsetTop;
var div2 = document.getElementById("relacionados");
var div2Top = div2.offsetTop;

window.onscroll = function() {
    if (window.pageYOffset >= divFixaTop && window.pageYOffset < div2Top) {
        divFixa.style.top = (window.pageYOffset - divFixaTop + 50) + "px";
    } else if (window.pageYOffset >= div2Top) {
        divFixa.style.top = (div2Top - divFixa.offsetHeight) + "px";
    } else {
        divFixa.style.top = "50px";
    }
};

