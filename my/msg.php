<?php 
/**
 * MeePlace Private Message
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
@session_start();
if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) )
{
header("Location: ./login.php?referer=/my/msg.php");
exit;
}
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');


$page_title = l('Message').' | '.get_sitename();  //


// PAGE f Select
		$var_readstat=$readstat="none";   // Set Read invisible at default
		switch ($_GET[f])
		{
			case "inbox":
				$is['inbox']=$is_inbox=1;
				break;
			case "sent":
				$is['sent']=$is_sent=1;
				break;
			case "send":
				$is['send']=$is_send=1;
			case "msg":
				$is['msg']=$is_msg=1;
				break;
			case "new":
				$is['new']=$is_new=1;
				break;
			case "read":
				$is['read']=$is_read=1;
				$var_readstat=$readstat="";
				break;
			default:
			$is['inbox']=$is_inbox=1;
		}
/////////////////////////////////////////////////
function get_my_friend_list()
{
	$user_id=get_user_data(user_id);
	$result=mysql_query("SELECT * FROM `friend` where user_id='$user_id'");	
	$temp='';
	while($row=mysql_fetch_array($result))
	{
		$friend_name=get_user_data(nameORemail,$row[friend_id]);
		$temp.= "<li><a onclick=\"sfriend('$friend_name','$row[friend_id]')\" href=\"javascript:;\">$friend_name</a></li>";
	}
return $temp;
}
////////////////////////////////////////////////// send !
if($is_send=1&&$_POST[id]&&($_POST[subject]||$_POST[message]))
{
	$id=$_POST[id];
	$subject=nl2br(strip_tags(trim($_POST[subject])));
	$message=nl2br(strip_tags(trim($_POST[message])));
	$date=date(YmdHis);
	$user_id=get_user_data(user_id);
	if(empty($subject)) $subject="No Subject";
	if(empty($message)) $message=$subject;
	
	$query="insert into `masssge` (`msg_to`,`msg_sub`,`msg`,`msg_date`,`user_id`,`owner`) values ('$id','$subject','$message','$date','$user_id','$user_id')";
	$result=mysql_query($query);
	
	$query="insert into `masssge` (`msg_to`,`msg_sub`,`msg`,`msg_date`,`user_id`,`owner`) values ('$id','$subject','$message','$date','$user_id','$id')";
	$result=mysql_query($query);
}
//////////////////////////////////////////////////  del
if($_GET[a]=="del")
{
   $p_chk =  $_GET[id];
   $user_id=get_user_data(user_id); 
   $query="delete from `masssge` where msg_id='$p_chk' and owner='$user_id'";
   mysql_query($query);
    
/*	$p_chk=$_POST["chk"];
    var_dump($p_chk);
	$user_id=get_user_data(user_id);
	if(!is_array($p_chk)) $p_chk=array($p_chk);
	
	for($i=0;$i<count($p_chk);$i++){
		$query="delete from `masssge` where msg_id='$p_chk[$i]' and owner='$user_id'";
        echo $query;
		mysql_query($query);
	} */
}

///////////New msg num////////// 
$user_id=get_user_data(user_id);
$result=mysql_query("SELECT * FROM `masssge` where msg_to='$user_id' and checked=0 and owner='$user_id'");	

$var_num['notcheck']=$notcheck=mysql_num_rows($result);	
///////////////////



if($is_read){////////////////////////////////////////////////////////////////////////////////////////////////////
	     $result=mysql_query("UPDATE `masssge` SET `checked` = '1' WHERE owner='$user_id' and `msg_id`='$_GET[id]'");	

	 	$result=mysql_query("SELECT * FROM `masssge` where msg_id='$_GET[id]' and owner='$user_id' ORDER BY `msg_date` DESC ");	
		$row=mysql_fetch_array($result);
		
		$var_read['senderid']=$row['user_id'];
		$var_read['sender']=($row['user_id']==0)?"System Mail":get_user_data(nameORemail,$row['user_id']);
		$var_read['to']=get_user_data(nameORemail,$row['msg_to']);
		$var_read['subject']=$row['msg_sub'];
		$var_read['msg']=$row['msg'];
		$var_read['msgdate']=turn_date($row['msg_date'],fdatetime);

		$var_read['replytoid']=($row['user_id']!=$user_id)?$row['user_id']:$row['msg_to'];
}// end is_read
if($is_inbox||$is_sent)///////////////////////////////////////////////////////////////////////////////////////////////////
{
	$var_f=$_GET[f];    //
	if($is_inbox)
	$result=mysql_query("SELECT * FROM `masssge` where msg_to='$user_id' and owner='$user_id' ORDER BY `msg_date` DESC ");	
	elseif($is_sent)
	$result=mysql_query("SELECT * FROM `masssge` where user_id='$user_id' and owner='$user_id' ORDER BY `msg_date` DESC ");	

	$rows=mysql_num_rows($result);	 
	$i=0;
	while($row=mysql_fetch_array($result))
	{
		$var_lists['found']='yes';
		//show user id
		if($is_inbox||$is_read){
			$var_list[$i]['showuserid']=$showuser=$row['user_id'];
		}
		elseif($is_sent){
			$var_list[$i]['showuserid']=$showuser=$row['msg_to'];
		}
		//show user name
		if($var_list[$i]['showuserid']==0){
			$var_list[$i]['showuser']='System Mail';
		}
		else{
			$var_list[$i]['showuser']=get_user_data(nameORemail,$showuser);
		}
		//other
		$var_list[$i]['msgid']=$row['msg_id'];
		$var_list[$i]['checked']=$row['checked'];
		$var_list[$i]['msgsubject']=utf_substr($row['msg_sub'],60);
		$var_list[$i]['msgbrief']=utf_substr(str_replace("<br />"," ",$row['msg']),200);
		$var_list[$i]['msgdate']=turn_date($row['msg_date'],fdatetime);
		$i+=1;
	}
	$var_lists['pager']=get_page_list($_GET[page],$rows,10);
}
elseif($is_new)/////////////////////////////////////////////////////////////////////
{
	if (empty($_GET[id])){
       $var_l_choose_friend = 1;  
    }else{
       $var_new['touser']=  get_user_data(nameORemail,$_GET[id]);
    }
    //$var_new['touser']=empty($_GET[id])?"Please Choose a Friend from List":get_user_data(nameORemail,$_GET[id]);
	$var_new['touserid']=empty($_GET[id])?"0":$_GET[id];
	$var_new['friendli']=get_my_friend_list();
}
elseif($is_msg)//////////////////////////////////////////////////////////////////////////////////////////////////////
{
	    /// mail component
		// read template
		$query="select * from `user` where `user_id`='$id' and `notification_2`='1'";
		$frc=mysql_query($query);
		$num=mysql_num_rows($frc);
		if($num!=0){
			$query="select * from `template` where name='msg'";
			$rc=mysql_query($query);
			$row=mysql_fetch_array($rc);
			$template=$row[text];
			$title=$row[title];
			
			$content=nl2br(strip_tags(trim($_POST[message])));  // [Content!]
			$content=utf_substr($content,100);
			$time=turn_date(date(YmdHis),fdatetime);    //  [Time!]
			$sender=get_user_data(nameORemail);     // [Sender!]
			$receiver=get_user_data(nameORemail,$_POST[id]);  // [Receiver!]
			
			$address=get_user_data(email,$_POST[id]); // to whom?
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
			
		}
}


//$smarty->debugging = true;

$smarty->assign("var_l_choose_friend",$var_l_choose_friend);
$smarty->assign("var_f",$var_f); 
$smarty->assign("var_read",$var_read); 
$smarty->assign("var_num",$var_num); 
$smarty->assign("is",$is); 
$smarty->assign("var_readstat",$var_readstat); 
$smarty->assign("var_list",$var_list); 
$smarty->assign("var_lists",$var_lists); 
$smarty->assign("var_new",$var_new); 

$smarty->assign("page_title",$page_title); 
$smarty->display('my/msg.tpl');


?>