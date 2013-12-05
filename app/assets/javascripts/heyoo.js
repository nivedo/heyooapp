$( document ).ready(function() {
  $('a.login').click( function (){
    var loginScreenPos = $('#login_screen').offset().top;
    var screenPos = $('body').scrollTop();
    
    if ( loginScreenPos <= 50 && screenPos >= 300){
      //the login screen is already visible, scroll to the top but hide the login screen
      $('html, body').animate({ scrollTop: $('#test').offset().top - 50 }, 500 );
    } else {
      $('html, body').animate({ scrollTop: $('#test').offset().top - 50 }, 500, showLoginScreen());
    }
    
    
    return false;
  });
  
  if ( document.getElementById('mobile_nav_switch') ){
    var nav_switch = document.getElementById('mobile_nav_switch');
    addTapListener(nav_switch, toggleNav);
  }
  
  $('a.scrolling').click( function (){
      var link = $(this).attr('href');
      scrollToSection(link);
      return false;     
    });
    
    /*
    $('#login_form').submit( function( event ){
      event.preventDefault();
      console.log('login button clicked');
      $('#login_div .error').toggleClass('visible');
      return false;
    });
    */
    
    $('a.hide_error').click( function (){ 
      $('#login_div .error').toggleClass('visible');
      return false;
    });
});

function changeLights (){
  
  var building = document.getElementById('building');
  var windows = building.getElementsByTagName('div');
  windowNum = windows.length;

  var index = Math.floor((Math.random()*windowNum));

  var apt = windows[index];
  var aptClass = apt.className;
  
  if ( aptClass == 'off' ){
    newClass = 'neutral';
  } else if ( aptClass = 'neutral' ){
    newClass = 'connected';
  } else if ( aptClass = 'connected' ){
    newClass = 'off'
  }
  
  apt.className = newClass;
  
  /*var stateArray = new Array('off', 'neutral', 'connected');
  
  var removeThis = inArray(aptClass, stateArray)
  
  stateArray.splice(removeThis, 1);
  
  var stateNum = stateArray.length;
  var newcolor = Math.floor((Math.random()*stateNum));
  
  apt.className = stateArray[newcolor];*/
  
}

function inArray( needle, haystack )
{
  num = haystack.length;

  for ( x=0; x < num; x++ ){
    if ( haystack[x] == needle ){
      return x;
    }
  }
  
  return -1;
} 

function showLoginScreen()
{
  var loginScreen = $('#login_screen');
  var topPos = loginScreen.css('top');
  if ( topPos != '0px' ){
    newPos = '0px';
  } else {
    newPos = '982px';
  }
  
  loginScreen.animate({ top: newPos });
}

function scrollToSection(objId){
  $('html, body').animate({
    scrollTop: $(objId).offset().top - 50
  }, 500);
  return false;
}

function toggleNav(el)
{
  var page = document.getElementById('page');
  if ( $('#page').css('position') != 'fixed' ){
    $('#page').css('position', 'fixed');
  } else {
    $('#page').css('position', 'relative');
  }
  $('#header ul').toggleClass('visible');
  $('#mobile_header').toggleClass('opened');
  $('#page').toggleClass('opened');
  
  return false;
}

function addTapListener(el, listener, action)
{
  var startX;
  var dx;
  var direction;
  var toggleTimer;
  var toggleFlag = true;
  
  if ( typeof(action) === 'undefined' ) { action = 'tap'; }
  if ( action !== 'move' ) {  action = 'tap'; }
  
  function cancelTouch()
  {
    el.removeEventListener('touchmove', onTouchMove);
    el.removeEventListener('touchend', onTouchEnd);
    startX = null;
    startY = null;
    direction = null;
    toggleFlag = true;
    //clearTimeout(toggleTimer);
  }
 
  function onTouchMove(e)
  {
    if (e.touches.length > 1){
      cancelTouch();
    } else {
      dx = e.touches[0].pageX - startX;
      var dy = e.touches[0].pageY - startY;
      if ( action == 'touch' ) {
        if ( Math.abs(dx) >= 5 || Math.abs(dy) >= 5 ){
          cancelTouch();
        }
      } else {
        var beginX = startX;
        var leftVal = startX + dx;
        //var leftVal = Math.abs(dx);
        $('#page').css('left', leftVal);
        $('#mobile_header').css('left', leftVal);
        
        console.log(startX+', '+leftVal+', dx:'+dx);
        
      }
      /*if (direction == null) {
        direction = dx;
        e.preventDefault();
      } else if ((direction < 0 && dx > 0) || (direction > 0 && dx < 0) || Math.abs(dy) > 200) {
          cancelTouch();
      }*/
    }
  }

  function onTouchEnd(e)
  {
    
    cancelTouch();
    listener(el);
    /*if (Math.abs(dx) > 50){
      listener({ target: el, direction: dx > 0 ? 'right' : 'left' });
    }*/
  }
 
  function onTouchStart(e)
  {
      if (e.touches.length == 1){
      startX = e.touches[0].pageX;
      startY = e.touches[0].pageY;
      /*toggleTimer = window.setTimeout(function(){
        toggleFlag = false;
      }, 400);*/
      el.addEventListener('touchmove', onTouchMove, false);
      el.addEventListener('touchend', onTouchEnd, false);
    }
  }
 
  el.addEventListener('touchstart', onTouchStart, false);
}
