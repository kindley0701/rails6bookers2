/* global $ */
$(function () {
  $(".slider").slick({
    variableWidth: true, //幅の自動調節・統一
    adaptiveHeight: true, //高さの自動調節・統一
    centerMode: true, //画像の中央寄せ
    dots: true, //ドットあり
    autoplay: true, //自動切換えにするか
    autoplaySpeed: 3000, //切り替えスピード(ミリ秒)
  });
});