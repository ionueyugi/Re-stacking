// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree.

//ハンバーガーメニュー
$(function() {
  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });
 });

//タブメニュー
$('#tab-contents .tab[id != "tab1"]').hide();
$('#tab-menu a').on('click', function() {
  $("#tab-contents .tab").hide();
  $("#tab-menu .active").removeClass("active");
  $(this).addClass("active");
  $($(this).attr("href")).show();
  return false;
});

//スリックスライド
$(function() {
    $('.img1').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 4000,
    });
});

//スリックスライド（アニメーション）
$(function() {
  $('.imag1').slick({
      dots: true,
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.imag1').slick('goTo', $(this).index());
  });
});

//スリックスライド
$(function() {
    $('.img2').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 4000,
    });
});

//スリックスライド（アニメーション）
$(function() {
  $('.imag2').slick({
      dots: true,
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.imag2').slick('goTo', $(this).index());
  });
});

//スリックスライド
$(function() {
    $('.img3').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 4000,
    });
});

//スリックスライド（アニメーション）
$(function() {
  $('.imag3').slick({
      dots: true,
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.imag3').slick('goTo', $(this).index());
  });
});