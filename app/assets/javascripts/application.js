// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Only include gem installed javascript assets here. All other js develoment should use Common JS
// and will be compiled with Gulp and Browserify
//
//= require jquery
//= require jquery_ujs
//
// Pull compiled from /public/assets/javascripts
//= require global
window.fbAsyncInit = function() {
    FB.init({
      appId      : '802777616499163',
      xfbml      : true,
      version    : 'v2.5',
      cookie     : true
    });
  };

  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
