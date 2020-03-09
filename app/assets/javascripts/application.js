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

$(window).ready( function() {
  $('#user_postcode').jpostal({
    postcode : [
      '#user_postcode'
    ],
    address : {
      '#user_prefecture_code'  : '%3',
      '#user_address_city'  : '%4',
      '#user_address_street'  : '%5'
    }
  });
});


$(function(){
  $('#map').on('click', function(){
    // 郵便番号から住所を取得
    $.ajax({
      type : 'get',
      url : 'https://maps.googleapis.com/maps/api/geocode/json',
      crossDomain : true,
      dataType : 'json',
      data : {
        key: gKey,
        address : $(this).attr('value'),
        language : 'ja',
        sensor : false
      }
    }).done(function (data){
      // APIのレスポンスから住所情報を取得
      var obj = data.results[0].geometry.location;
      showMap( obj );
    }).fail(function (data) {
      // 福井県庁
      alert('住所情報が取得できませんでした');
      return false;
    });
  });
});

function showMap( obj ) {
  var MyLatLng;
  if (obj === undefined ) { MyLatLng = new google.maps.LatLng(36.06528,136.22194); }
  else { MyLatLng = new google.maps.LatLng( obj.lat, obj.lng ); }
  var Options = {
    zoom: 8,      //地図の縮尺値
    center: MyLatLng,    //地図の中心座標
    mapTypeId: 'roadmap'   //地図の種類
  };
  var map = new google.maps.Map(document.getElementById('map'), Options);
  return false;
}
