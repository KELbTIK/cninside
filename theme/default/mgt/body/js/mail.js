// Mail Function

function reset_mailer()
{
	$('.mail_optionals').hide();
}

function select_mailer(mailer)
{
	reset_mailer();
	if(mailer.value=='smtp')
	{
		$('.SMTP_td').show();
	}
	if(mailer.value=='sendmail')
	{
		$('.sendmail_td').show();
	}
	
}


function save_mail()
{
var mailer=$('#mailer').val();
var sendmail_path=$('#sendmail_path').val();
var SMTP_host=$('#SMTP_host').val();
var SMTP_port=$('#SMTP_port').val();
var SMTP_user=$('#SMTP_user').val();
var SMTP_pass=$('#SMTP_pass').val();
var SMTP_auth=$('#SMTP_auth').attr('checked');
var SMTP_from=$('#SMTP_from').val();
var SMTP_fromname=$('#SMTP_fromname').val();

var _MAILNOTIFY_ADMIN_BIZ_SUBMIT_=$('#_MAILNOTIFY_ADMIN_BIZ_SUBMIT_').val();
var _MAILNOTIFY_ADMIN_BIZ_REVIEW_=$('#_MAILNOTIFY_ADMIN_BIZ_REVIEW_').val();

var _MAILNOTIFY_OWNER_BIZ_REVIEW_=$('#_MAILNOTIFY_OWNER_BIZ_REVIEW_').attr('checked');

var _MAILNOTIFY_ADMIN_BIZ_CLAIM_=$('#_MAILNOTIFY_ADMIN_BIZ_CLAIM_').val();
var _MAILNOTIFY_ADMIN_EVENT_SUBMIT_=$('#_MAILNOTIFY_ADMIN_EVENT_SUBMIT_').val();
var _MAILNOTIFY_ADMIN_CONTACT_SUBMIT_=$('#_MAILNOTIFY_ADMIN_CONTACT_SUBMIT_').val();



var _MAILNOTIFY_USER_BIZ_SUBMIT_APPROVE_=$('#_MAILNOTIFY_USER_BIZ_SUBMIT_APPROVE_').attr('checked');
var _MAILNOTIFY_USER_BIZ_CLAIM_APPROVE_=$('#_MAILNOTIFY_USER_BIZ_CLAIM_APPROVE_').attr('checked');
var _MAILNOTIFY_USER_EVENT_SUBMIT_APPROVE_=$('#_MAILNOTIFY_USER_EVENT_SUBMIT_APPROVE_').attr('checked');



$.post("/mgt/body/system_mail_submit.php?"+Math.random(), {
mailer:mailer,
sendmail_path:sendmail_path,
SMTP_host:SMTP_host,
SMTP_port:SMTP_port,
SMTP_user:SMTP_user,
SMTP_pass:SMTP_pass,
SMTP_auth:SMTP_auth,
SMTP_from:SMTP_from,
SMTP_fromname:SMTP_fromname,
_MAILNOTIFY_ADMIN_BIZ_SUBMIT_:_MAILNOTIFY_ADMIN_BIZ_SUBMIT_,
_MAILNOTIFY_ADMIN_BIZ_REVIEW_:_MAILNOTIFY_ADMIN_BIZ_REVIEW_,
_MAILNOTIFY_OWNER_BIZ_REVIEW_:_MAILNOTIFY_OWNER_BIZ_REVIEW_,
_MAILNOTIFY_ADMIN_BIZ_CLAIM_:_MAILNOTIFY_ADMIN_BIZ_CLAIM_,
_MAILNOTIFY_ADMIN_EVENT_SUBMIT_:_MAILNOTIFY_ADMIN_EVENT_SUBMIT_,
_MAILNOTIFY_ADMIN_CONTACT_SUBMIT_:_MAILNOTIFY_ADMIN_CONTACT_SUBMIT_,
_MAILNOTIFY_USER_BIZ_SUBMIT_APPROVE_:_MAILNOTIFY_USER_BIZ_SUBMIT_APPROVE_,
_MAILNOTIFY_USER_BIZ_CLAIM_APPROVE_:_MAILNOTIFY_USER_BIZ_CLAIM_APPROVE_,
_MAILNOTIFY_USER_EVENT_SUBMIT_APPROVE_:_MAILNOTIFY_USER_EVENT_SUBMIT_APPROVE_
},function(data){tips('Mail Settings Saved.');nav()});
//setTimeout("nav()",5000)
}

function test_mail()
{
var testmailer=$('#testmailer').val();
var testemail=$('#testemail').val();

$.post("/mgt/body/system_mail_test.php?"+Math.random(), {
testmailer:testmailer,
testemail:testemail
},function(data){});
setTimeout("var a=document.getElementById('testmailbtn');a.disabled=false;a.value='Send again'; tips('Test mail requested.');",1000)
}
