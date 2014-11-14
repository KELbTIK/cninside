<?php
/**
 * MeePlace Some functions. e.g. Add Friend, Add Cool Person, etc.
 * @package MeePlace
 * @subpackage Profile
 
+------------------------------------------------------------------------+
| MeePlace v3.0 ( www.proclones.com )
+------------------------------------------------------------------------+
| MeePlace IS NOT FREE SOFTWARE
| If you have downloaded this software from a website other
| than www.proclones.com or if you have received
| this software from someone who is not a representative of
| ProClones, you are involved in an illegal activity.
| ---
| In such case, please contact: support@proclones.com.
+------------------------------------------------------------------------+
| Developed by: Proclones (www.proclones.com) / support@proclones.com
| Copyright: (c) 2010 ProClones, LLC. All rights reserved.
+------------------------------------------------------------------------+
 */
 include_once(dirname(__FILE__)."/../inc/func/get_sth.php");


@session_start();
if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) )
{
header("Location: ./login.php");
exit;
}

$user_id=get_user_data('user_id');

$id=$_GET[id];
//////////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////////////
if($_GET[f]=='verifyfriend' && $_GET[code]!='')
{ 
	//confirm
	$result=mysql_query("SELECT * FROM `friend` where `verify_code`='$_GET[code]' ");
	if(mysql_num_rows($result)) // existing verify code.
	{
		//clear code
		$row=mysql_fetch_assoc($result);
		mysql_query("UPDATE `friend` SET `verify_code`='' WHERE `verify_code` = '$_GET[code]'");
		
		//add friend's friend
		mysql_query("INSERT INTO `friend` (`friend_id` ,`user_id` ) VALUES ('$row[user_id]', '$row[friend_id]') ");
		
		
		//update friend number: initiator
		$row2 = mysql_fetch_array(mysql_query("select * from `user` where user_id='$row[user_id]'"));
		$friends_num=$row2[friends_num]+1;
		$query="UPDATE `user` set friends_num='$friends_num' where user_id='$row[user_id]'";
		$result=mysql_query($query);
		//update friend number: friend
		$row3 = mysql_fetch_array(mysql_query("select * from `user` where user_id='$row[friend_id]'"));
		$friends_num=$row3[friends_num]+1;
		$query="UPDATE `user` set friends_num='$friends_num' where user_id='$row[friend_id]'";
		$result=mysql_query($query);
		
		
	}



echo "<script>alert('".l('Friend added!')."'); location='/my/'</script>";


 
		
}


//////////////////////////////////////////////////////////////////////////
if($_GET[f]=='addfriend')
{
	
	$result=mysql_query("SELECT * FROM `friend` where user_id='$user_id' and friend_id='$id' and `verify_code`='' ");
	
	if(mysql_num_rows($result)==0&&$user_id!=$id)
	{
		//cancel last request
		$query="DELETE FROM `friend` where `user_id`='$user_id' and `friend_id`='$id' ";
		$result=mysql_query($query);
		
		$code=md5(rand());
		$query="insert into `friend` (`user_id`,`friend_id`, `verify_code`) values ('$user_id','$id', '".$code."')";
		$result=mysql_query($query);
		
		$url="http://"._DOMAIN_."/my/func.php?f=verifyfriend&code=".$code;
		mailcom($id,'addfriend',"$url");
		
		//////////end friend number////////
		echo "{'MSG':'1'}";
	}
	else
	{
		echo "{'MSG':'0'}";
	}
	exit;
}
//////////////////////////////////////////////////////////////////////////
if($_GET[f]=='delfriend')
{
$result=mysql_query("delete from `friend` where user_id='$user_id' and friend_id='$id' limit 1");	
////////user 's  friend number //////////
		$row = mysql_fetch_array(mysql_query("select * from `user` where user_id='$user_id'"));
		$friends_num=$row[friends_num]-1;
		$query="UPDATE `user` set friends_num='$friends_num' where user_id='$user_id'";
		$result=mysql_query($query);
//////////end friend number////////
echo "<script>alert('".l('Friend deleted!')."');</script>"	;

}

//////////////////////////////////////////////////////////////////////////
if($_GET[f]=='addfav')
{

$result=mysql_query("SELECT * FROM `favorite` where user_id='$user_id' and friend_id='$id'");	

if(mysql_num_rows($result)==0&&$user_id!=$id)
{
$query="insert into `favorite` (`user_id`,`friend_id`) values ('$user_id','$id')";
$result=mysql_query($query);
echo "<script>alert('".l('Favorite added!')."');</script>"	;
}
else
{
echo "<script>alert('".l('This user is already your favorite!')."');</script>"	;
}
}
//////////////////////////////////////////////////////////////////////////
if($_GET[f]=='delfav')
{
$result=mysql_query("delete from `favorite` where user_id='$user_id' and friend_id='$id' limit 1");	
echo "<script>alert('".l('Favorite deleted!')."');</script>"	;

}
////////////////////////////////////////////////////////////////////////////////
if($_GET[f]=='addbookmark')
{
	
$result=mysql_query("SELECT * FROM `bookmark` where user_id='$user_id' and business_id='$id'");	

if(mysql_num_rows($result)==0)
{


$row=mysql_fetch_array(mysql_query("select * from `business` where business_id='$id'"));
$now=date(YmdHis);
$query="insert into `bookmark` (`user_id`,`business_id`,`city_id`,`bookmark_date`) values ('$user_id','$id',$row[city_id], $now)";
$result=mysql_query($query) or die('ERROR!');

echo "<script>alert('".l('Bookmark added!')."');</script>"	;
}
else
{
echo "<script>alert('".l('This bookmark is already added!')."');</script>"	;
}
}
//////////////////////////////////////////////////////////////////////////
if($_GET[f]=='delbookmark')
{
$result=mysql_query("delete from `bookmark` where user_id='$user_id' and business_id='$id' limit 1");	
echo "<script>alert('".l('Bookmark deleted!')."');</script>"	;

}
////////////////////////////////////////////////////////////////////////////////
if($_GET[f]=='coolperson')
{
	//   cool person
$result=mysql_query("SELECT * FROM `compliment` where user_id='$user_id' and target_id='$id' and type=1");	

if(mysql_num_rows($result)==0)
{
$query="insert into `compliment` (`user_id`,`target_id`,`type`) values ('$user_id','$id','1')";
$result=mysql_query($query);

$row=mysql_fetch_array(mysql_query("select * from `user` where user_id='$id'"));
$write=$row[vote_cool]+1;
$query="UPDATE `user` SET `vote_cool` = '$write' WHERE `user_id` =$id ";
$result=mysql_query($query);

mailcom($id,'compliment','COOL');

echo "<script>alert('".l('Compliment Given!')."');</script>"	;

}
else
{
echo "<script>alert('".l('You gave the compliment before!')."');</script>"	;
}
}
////////////////////////////////////////////////////////////////////////////////
if($_GET[f]=='funnyperson')
{
	//  funny person
$result=mysql_query("SELECT * FROM `compliment` where user_id='$user_id' and target_id='$id' and type=2");	

if(mysql_num_rows($result)==0)
{
$query="insert into `compliment` (`user_id`,`target_id`,`type`) values ('$user_id','$id','2')";
$result=mysql_query($query);

$row=mysql_fetch_array(mysql_query("select * from `user` where user_id='$id'"));
$write=$row[vote_funny]+1;
$query="UPDATE `user` SET `vote_funny` = '$write' WHERE `user_id` =$id ";
$result=mysql_query($query);

mailcom($id,'compliment','FUNNY');

echo "<script>alert('".l('Compliment Given!')."');</script>"	;
}
else
{
echo "<script>alert('".l('You gave the compliment before!')."');</script>"	;
}
}
//////////////////////////////////////////////////////////////////////////////
if($_GET[f]=='addin')
{
	// in
$result=mysql_query("SELECT * FROM `event_in` where user_id='$user_id' and event_id='$id'");	

if(mysql_num_rows($result)==0)
{
$query="insert into `event_in` (`user_id`,`event_id`) values ('$user_id','$id')";
$result=mysql_query($query) or die('ERROR!');

echo "<script>alert('".l('[I\'m In!] added!')."');</script>"	;
}
else
{
echo "<script>alert('".l('This event is already added before in your IN LIST!')."');</script>"	;
}
}
//////////////////////////////////////////////////////////////////////////
if($_GET[f]=='delin')
{
$result=mysql_query("delete from `event_in` where user_id='$user_id' and event_id='$id' limit 1") or die('ERR');
echo "<script>alert('".l('This event have been deleted in your [I\'m In]!')."');</script>"	;

}
////////////////////////////////////////////////////////////////////////////////
if($_GET[f]=='addcool')
{
	// cool
$result=mysql_query("SELECT * FROM `event_cool` where user_id='$user_id' and event_id='$id'");	

if(mysql_num_rows($result)==0)
{
$query="insert into `event_cool` (`user_id`,`event_id`) values ('$user_id','$id')";
$result=mysql_query($query) or die('ERROR!');

echo "<script>alert('".l('[Sounds Cool] added!')."');</script>"	;
}
else
{
echo "<script>alert('".l('This event is already added before in your COOL LIST!')."');</script>"	;
}
}
//////////////////////////////////////////////////////////////////////////
if($_GET[f]=='delcool')
{
$result=mysql_query("delete from `event_cool` where user_id='$user_id' and event_id='$id' limit 1");	
echo "<script>alert('".l('This event have been deleted in your [Sounds Cool]!')."');</script>"	;

}
////////////////////////////////////////////////////////////////////////////////

$urlRows=parse_url($_SERVER['HTTP_REFERER']);
$url=$urlRows["path"];
if(!empty($urlRows["query"]))
$url.="?".$urlRows["query"];

echo "<script>location='$url'</script>";

///////////////////////////////////////////////////////////////////////////
function mailcom($id,$name,$content)
{
/// mail component  ////////////
// read template
$query="select * from `user` where `user_id`='$id' and `notification_3`='1'";
$frc=mysql_query($query);
$num=mysql_num_rows($frc);
if($num!=0){

$query="select * from `template` where name='$name'";
$rc=mysql_query($query);
$row=mysql_fetch_array($rc);
$template=$row[text];
$title=$row[title];

$content=nl2br(strip_tags(trim($content)));  // [Content!]
$content=utf_substr($content,100);
$time=turn_date(date(YmdHis),fdatetime);    //  [Time!]
$sender=get_user_data(nameORemail);      // [Sender!]
$receiver=get_user_data(nameORemail,$id);  // [Receiver!]

$address=get_user_data(email,$id); // to whom?
///replace

$template=str_replace("[Content!]",$content,$template);
$template=str_replace("[Time!]",$time,$template);
$template=str_replace("[Sender!]",$sender,$template);
$template=str_replace("[Receiver!]",$receiver,$template);
$template=str_replace("[Domain!]",_DOMAIN_,$template);
$template=str_replace("[Sitename!]",_SITENAME_,$template);

$title=str_replace("[Content!]",$content,$title);
$title=str_replace("[Time!]",$time,$title);
$title=str_replace("[Sender!]",$sender,$title);
$title=str_replace("[Receiver!]",$receiver,$title);
$title=str_replace("[Domain!]",_DOMAIN_,$title);
$title=str_replace("[Sitename!]",_SITENAME_,$title);


///send


$mail= new MP_Mailer();	
$mail->fromMail = _SMTP_FROM_;
$mail->fromName = _SMTP_FROMNAME_; 
$mail->toMail=$address;              
$mail->Subject  =  $title;
$mail->Body     = $template;
$mail->MPSend();

}}

?>