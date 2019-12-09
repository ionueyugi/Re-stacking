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
//= require jquery.turbolinks
//= require turbolinks
//= require_tree.



//ハンバーガーメニュー
$(document).on('turbolinks:load', function() {
  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });
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

$(document).on('turbolinks:load', function() {
  // ①タブをクリックしたら発動
  $('.tab li').click(function() {
    // ②クリックされたタブの順番を変数に格納
    var index = $('.tab li').index(this);

    // ③クリック済みタブのデザインを設定したcssのクラスを一旦削除
    $('.tab li').removeClass('active');
    // ④クリックされたタブにクリック済みデザインを適用する
    $(this).addClass('active');

    // ⑤コンテンツを一旦非表示にし、クリックされた順番のコンテンツのみを表示
    $('.area ul').removeClass('show').eq(index).addClass('show');

  });
});

