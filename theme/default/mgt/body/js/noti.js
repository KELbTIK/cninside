function save_noti_bizreview()
{
var FCKeditor1=editor.getData();
var title=$('#title').val();

$.post("/mgt/body/noti_bizreview_submit.php?"+Math.random(), {
FCKeditor1:FCKeditor1,
title:title
},function(data){tips('New Biz Review Template Saved.');nav()});
//setTimeout("nav()",5000)
}

function save_noti_comment()
{
var FCKeditor1=editor.getData();
var title=$('#title').val();

$.post("/mgt/body/noti_comment_submit.php?"+Math.random(), {
FCKeditor1:FCKeditor1,
title:title
},function(data){tips('New Comment Template Saved.');nav()});
//setTimeout("nav()",5000)
}

function save_noti_claim()
{
var FCKeditor1=editor.getData();
var title=$('#title').val();

$.post("/mgt/body/noti_claim_submit.php?"+Math.random(), {
FCKeditor1:FCKeditor1,
title:title
},function(data){tips('Claim Result Template Saved.');nav()});
//setTimeout("nav()",5000)
}

function save_noti_approve()
{
var FCKeditor1=editor.getData();
var title=$('#title').val();

$.post("/mgt/body/noti_approve_submit.php?"+Math.random(), {
FCKeditor1:FCKeditor1,
title:title
},function(data){tips('Approve Template Saved.');nav()});
//setTimeout("nav()",5000)
}

function save_noti_compliment()
{
var FCKeditor1=editor.getData();
var title=$('#title').val();

$.post("/mgt/body/noti_compliment_submit.php?"+Math.random(), {
FCKeditor1:FCKeditor1,
title:title
},function(data){tips('New Compliment Template Saved.');nav()});
//setTimeout("nav()",5000)
}

function save_noti_addfriend()
{
var FCKeditor1=editor.getData();
var title=$('#title').val();

$.post("/mgt/body/noti_addfriend_submit.php?"+Math.random(), {
FCKeditor1:FCKeditor1,
title:title
},function(data){tips('Friend Request Template Saved.');nav()});
//setTimeout("nav()",5000)
}

function send_noti_newfeature()
{
var a=confirm("This message will send to people who enabled the new function notification, continue?");
if(a==0) return ;

$('#button').hide();
$('#sending').show();

var FCKeditor1=editor.getData();
var title=$('#title').val();

$.post("/mgt/body/noti_newfeature_submit.php?"+Math.random(), {
FCKeditor1:FCKeditor1,
title:title
},function(data){
    tips('Newsletter Emails Sent!');
    $('#sending').html("<font color=green>Newsletter Emails Sent!</font>");
    $('#editor').slideUp('slow');
    });
//setTimeout("nav()",5000)
}

function save_noti_newmsg()
{
var FCKeditor1=editor.getData();
var title=$('#title').val();

$.post("/mgt/body/noti_newmsg_submit.php?"+Math.random(), {
FCKeditor1:FCKeditor1,
title:title
},function(data){tips('New Message Template Saved.');nav()});
//setTimeout("nav()",5000)
}

function save_page_privacy()
{
var FCKeditor1=editor.getData();

$.post("/mgt/body/page_privacy_submit.php?"+Math.random(), {
FCKeditor1:FCKeditor1,
},function(data){tips('Page Saved.');nav()});
//setTimeout("nav()",5000)
}

function save_page_terms()
{
var FCKeditor1=editor.getData();

$.post("/mgt/body/page_terms_submit.php?"+Math.random(), {
FCKeditor1:FCKeditor1,
},function(data){tips('Page Saved.');nav()});
//setTimeout("nav()",5000)
}

function save_page()
{
    var FCKeditor1=editor.getData();
    var title=$('#title').val();
    var pageid=$('#pageid').val();
    $.post("/mgt/body/page_create_submit.php?"+Math.random(), {
    FCKeditor1:FCKeditor1,
    title:title,
    pageid:pageid
    },function(data){
    if(data){
        alert(data);
    }else{
        tips('Page Saved.');
    }
    nav()
    });
}

function save_page_edit()
{
    var FCKeditor1=editor.getData();
    var title=$('#title').val();
    var pageid=$('#pageid').val();
    $.post("/mgt/body/page_edit_submit.php?"+Math.random(), {
    FCKeditor1:FCKeditor1,
    title:title,
    pageid:pageid
    },function(data){
    
    if(data){
       alert(data); 
    }
    parent.$.fn.fancybox.close();

    });
}


function send_newsletter()
{
    var FCKeditor1=editor.getData();
    var title=$('#title').val();
    
    $.post("/mgt/body/other_newsletter_submit.php?"+Math.random(), {
    FCKeditor1:FCKeditor1,
    title:title
    },function(data){tips('Newsletter Sent.');nav()});
    //setTimeout("nav()",5000)
}