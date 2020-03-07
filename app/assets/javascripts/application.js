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
    if ( ! rege_favorite.test( a_id ) ) {
      // favoriteボタンでなければ終了
      return;
    }
    // favoriteボタンのbook_idを取得
    var book_id = a_id.match( rege_favorite )[1];
    $.ajax({
      url: 'http://localhost:3000' + $( this ).attr('href'),
      type: ($( this ).attr('data-method')).toUpperCase(),
      dataType: 'json'
    })
  });
});
