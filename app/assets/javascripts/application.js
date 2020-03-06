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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

// favoriteボタンをidで識別するための正規表現
const rege_favorite = /favorite-btn-(\d+)/;

$(function(){
  // テーブル上のaタグが押下されたときの処理
  $('table tr td a').on('click', function() {
    // idの取得
    var a_id = $( this ).attr('id');
    // favoriteボタンであるかの判定
    if ( !rege_favorite.test( a_id ) ) {
      // favoriteボタンでなければ終了
      return;
    }
    // favoriteボタンのbook_idを取得
    var book_id = a_id.match( rege_favorite )[1];
    // alert( 'book_id = ' + book_id + '\nhref = ' + $( this ).attr('href') );



    // 入力された都市名でWebAPIに天気情報をリクエスト
    // $.ajax({
    //   url: 'http://localhost:3000' + $( this ).attr('href'),
    //   type: $( this ).attr('data-method')
    //   dataType : 'jsonp',
    // }).done(function (data){
    //   //通信成功時の処理
    //   // 位置
    //   $('#place').text(data.name);
    //   // 最高気温
    //   $('#temp_max').text(data.main.temp_max);
    //   // 最低気温
    //   $('#temp_min').text(data.main.temp_min);
    //   //　湿度
    //   $('#humidity').text(data.main.humidity);
    //   //　風速
    //   $('#speed').text(data.wind.speed);
    //   // 天気
    //   $('#weather').text(data.weather[0].main);
    //   // 天気アイコン
    //   $('img').attr("src","http://openweathermap.org/img/w/" + data.weather[0].icon + ".png");
    //   $('img').attr("alt",data.weather[0].main);
    // }).fail(function (data) {
    //   //通信失敗時の処理
    //   alert('通信に失敗しました。');
    // });
  });
});
