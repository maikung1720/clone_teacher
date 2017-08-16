// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//= bootstrap-filestyle.js
//= bootstrap-filestyle.min.js
//= require cocoon
function entryChange1(){
    var radio = document.getElementsByName('role') 
    console.log(radio);
    if(radio[0].checked) {
        document.getElementById('hoge1_form').style.display = "";
        document.getElementById('hoge2_form').style.display = "none";
    }else if(radio[1].checked) {
        document.getElementById('hoge1_form').style.display = "none";
        document.getElementById('hoge2_form').style.display = "";
        
    }
}