$(document).ready(function() {
    $(".fancybox").fancybox({
        minHeight: 300
    });
    fancybox();
    $("#topBtn").click(function() {
        $("html, body").animate({ scrollTop: 0 }, "slow");
        return false;
    });
    if ($(window).width() < 751){
        $('#login-block' ).insertBefore("#register-block");
    }else{
        $('#register-block' ).insertBefore("#login-block");
    }

});
$(window).load(function(){
    $('#signin-btn').click(function(){
        $('html, body').animate({
            scrollTop: $("#login-block").offset().top
        }, 1000);
    })
})
$( window ).resize(function() {
    if ($(window).width() < 751){
        $('#login-block' ).insertBefore("#register-block");
    }else{
        $('#register-block' ).insertBefore("#login-block");
    }
});
//////
 function fancybox()
 { 
 $(".iframe").fancybox({
  'overlayShow'    : true,
  'zoomSpeedIn'    : 600,
  'frameWidth' : 600,
  'frameHeight': 400,
  'callbackOnShow' : function(){$('object').css('display','block');},
  'callbackOnClose' : function(){$('object').css('display','none');},
  'zoomSpeedOut'    : 500,
  'easingIn'    : 'easeOutBack',
  'easingOut'    : 'easeInBack',
  'padding':0
  });
  $("#videobox").fancybox({
   'overlayShow'    : true,
  'zoomSpeedIn'    : 600,
  'callbackOnShow' : function(){$('object').css('display','block');},
  'callbackOnClose' : function(){$('object').css('display','none');},
  'zoomSpeedOut'    : 500,
  'easingIn'    : 'easeOutBack',
  'easingOut'    : 'easeInBack',
  'frameWidth' : 853,
  'frameHeight': 505,
  'scrolling':'no',
  'hideOnOverlayClick':false,
  'hideOnContentClick':false
  });
  
  }
  
  function del(sheet,where,equal)
{
    var a=confirm("Delete?");
    if(a==0) return ;
    
    $.post("/mgt/func/delete.php?"+Math.random(), {
    sheet:sheet,
    where:where,
    equal:equal
    },function(data){});
}

function del_bizreview(review_id)
{
    var a=confirm("Deleted?");
    if(a==0) return ;
    
    
    $.post("/mgt/body/business_review_del_ajax.php?"+Math.random(), {
    id:review_id
    },function(data){});
}