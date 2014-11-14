<?php
/**
 * MeePlace Comment a person, via AJAX which displayed in Profile page.
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
include_once(_ABSPATH_.'/inc/func/header.php');


///////////////  if  comment
if(!empty($_GET[comment]))
{        
@session_start();
if($_SESSION["email"] or $_SESSION["display_name"])
{		
$user_id=get_user_data(user_id);
$target_id=$_GET[id];
$comment=strip_tags(trim($_GET[comment]));
$reply_date=date(YmdHis);

$query="insert into `comment` (`user_id`,`target_id`,`comment`,`reply_date`) values ('$user_id','$target_id','$comment','$reply_date')";
$result=mysql_query($query);



			/// mail component
			if($user_id!=$target_id){
			// read template
			$query="select * from `user` where `user_id`='$user_id' and `notification_4`='1'";
			$frc=mysql_query($query);
			$num=mysql_num_rows($frc);
			if($num!=0){
			
			$query="select * from `template` where name='comment'";
			$rc=mysql_query($query);
			$row=mysql_fetch_array($rc);
			$template=$row[text];
			$title=$row[title];
			
			$content=$comment;  // [Content!]
			$content=utf_substr($content,100);
			$time=turn_date(date(YmdHis),fdatetime);     //  [Time!]
			$sender=get_user_data(nameORemail,$user_id);     // [Sender!]
			$receiver=get_user_data(nameORemail,$target_id);  // [Receiver!]
			
			$address=get_user_data(email,$target_id); // to whom?
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
			//echo "<span style=' font-size:10px;background:#FFC; color:red;'>Comment Notification Sent!</span>";
			}}}


}
//////////////////////////////// 

$rc="select * from `comment` where target_id='$_GET[id]' ";
$rows=mysql_query($rc);
$rows=mysql_num_rows($rows);	 
$limitfrom=($_GET[page]-1)*5;	
$rc.="  ORDER BY `reply_date` DESC  LIMIT $limitfrom,5";	
$rc= mysql_query($rc);
//$limitto=mysql_num_rows($rc);	
while($row=mysql_fetch_array($rc))
{
$found="yes";
?>
<div style="font-family:Arial; line-height:20px; float:left; width:100%; padding-top:5px;" class="comment_item" onmouseover="item_hover(this)" onmouseout="item_out()" onclick="item_click('<?=get_user_data(nameORemail,$row[user_id])?>')">
<div style="float:left; overflow:hidden;">
	<div class="photoBox" style="margin-right:5px;">
    	<img src="../images/photos/p_<?=get_user_data(photo_url,$row[user_id])?>_16x16" width="16" height="16"  />
     </div>
    <a href="./?id=<?=$row[user_id]?>"><?=get_user_data(nameORemail,$row[user_id])?></a> <?=l('says')?>:
</div>
<div style="float:right; white-space: nowrap; font-size:10px"><?=turn_date($row[reply_date],ftimeordate)?></div>
<br id="clear" />
<div style="padding-left:15px; padding-bottom:5px; padding-top:5px; border-bottom:1px #ccc dashed;">
<?=$row[comment]?></div>
</div>
<?php
}
if($found)
echo get_page_list($_GET[page],$rows,5,',\'cmt\''); //($CurPage,$TotalItem,$PageSize)
else
echo "<center><br/>".l("No Comment")."<br/>&nbsp;</center>";
?>