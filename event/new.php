<?php 
/**
 * MeePlace Create an event
 * @package MeePlace
 * @subpackage Events
 
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
@set_time_limit(0);
@ini_set("memory_limit","80M");

if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) ) 
{
header("Location: ../my/login.php");
exit;
}

include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

// Already Sent Register
if($_GET[f]=="submit")
{
/////////////////get POST
$user_id=get_user_data(user_id);
$event_name=nl2br(strip_tags(trim($_POST[event_name])));


if($_POST[ampmF]!=0)
	$hourf=$_POST[hourF]+12;
else
	$hourf=$_POST[hourF];
	
$date_from=$_POST[yearF].$_POST[monthF].$_POST[dayF].$hourf.$_POST[minuteF]."00";


if($_POST[ampmT]!=0)
	$hourt=$_POST[hourT]+12;
else
	$hourt=$_POST[hourT];
	
$date_to=$_POST[yearT].$_POST[monthT].$_POST[dayT].$hourt.$_POST[minuteT]."00";

if($date_to<$date_from) $date_to=$date_from;

$where=nl2br(strip_tags(trim($_POST[where])));

$site_url=$_POST[site_url];

$ticket_url=$_POST[ticket_url];

$priceFrom=$_POST[priceFrom];

$priceTo=$_POST[priceTo];

$free=!empty($_POST[free])?1:0;

$category=$_POST[radio];

$location=$_POST[location];

$related_biz_id=$_POST[related_biz_id];

//$whatwhy=nl2br(strip_tags(trim($_POST[whatwhy])));

    $columns_whatwhy=$_POST[whatwhy];
    $columns_whatwhy = str_replace('\n\r', '<br>', $columns_whatwhy);
    $columns_whatwhy = str_replace('\r', '', $columns_whatwhy);
    $columns_whatwhy = str_replace('\n', '<br>', $columns_whatwhy);
    $columns_whatwhy = str_replace('&lt;br&gt;', '<br>', $columns_whatwhy);
    $columns_whatwhy = str_replace('&lt;br/&gt;', '<br/>', $columns_whatwhy);
    $columns_whatwhy = str_replace('&lt;br/ &gt;', '<br/ >', $columns_whatwhy);
    $whatwhy = $columns_whatwhy;
    
    
$x=$_POST[x];
$y=$_POST[y];
$mapx=$_POST[mapx];
$mapy=$_POST[mapy];
$zoom=$_POST[zoom];

$submit_date=date(Ymd);

$submitter_id=get_user_data(user_id);

if(_NEW_EVENT_APPROVAL_NEED_==0)//needn't
	$approved=1;
else
	$approved=0;

// find
$find=mysql_query("select * from `event` where `event_name`='$event_name' and  `date_from`='$date_from' and `date_to`= '$date_to' and `user_id`='$user_id'") or die('Query Error!');
if(mysql_num_rows($find)==0)
{

// write 
$query="insert into `event` (`event_name`,`date_from`,`date_to`,`where`,`site_url`,`ticket_url`,`priceFrom`,`priceTo`,`free`,`category`,`location`,`user_id`,`submitter_id`,`whatwhy`,`x`,`y`,`mapx`,`mapy`,`zoom`,`submit_date`,`approved`, `related_biz_id`) values ('$event_name','$date_from','$date_to','$where','$site_url','$ticket_url','$priceFrom','$priceTo','$free','$category','$location','$user_id','$submitter_id','$whatwhy','$x','$y','$mapx','$mapy','$zoom', '$submit_date', $approved, '$related_biz_id')";
$result=mysql_query($query) or die('Error!'.$query);
// find again
$find=mysql_query("select * from `event` where `event_name`='$event_name' and  `date_from`='$date_from' and `date_to`= '$date_to' and `user_id`='$user_id'") or die('Query Error!');
$row=mysql_fetch_array($find);
$id=$row[id];


//photo
if ($_FILES["file"]["error"]==0)
{
$fName=$_FILES["file"]["name"];
$fDir=$_FILES["file"]["tmp_name"];
$tempFile_info = getimagesize($fDir);
$ext=strrchr($fName,".");
$deniedExtensions=array('html','htm','php','php2','php3','php4','php5','phtml','pwml','inc','asp','aspx','ascx','jsp','cfm','cfc','pl','bat','exe','com','dll','vbs','js','reg','cgi','htaccess','asis','sh','shtml','shtm','phtm');
if (in_array($ext,$deniedExtensions)){ 
    echo "<script>alert('".l("Photo extensions illegal!")."'); history.go(-1);</script>";
    exit;
}elseif(empty($tempFile_info)){
    echo "<script>alert('The uploaded file does not seem to be an image.'); history.go(-1);</script>";
    exit;
}else{
$imgurl=date(YmdHis).$user_id;
if (move_uploaded_file($fDir,"../images/event/e_".$imgurl))
{
//
	pic_resize(900,400,"../images/event/e_".$imgurl,"../images/event/e_".$imgurl);
	pic_resize(195,180,"../images/event/e_".$imgurl,"../images/event/e_".$imgurl."_195x180");
	pic_crop(100,100,"../images/event/e_".$imgurl,"../images/event/e_".$imgurl."_100x100");
	pic_crop(80,80,"../images/event/e_".$imgurl,"../images/event/e_".$imgurl."_80x80");
	pic_crop(40,40,"../images/event/e_".$imgurl,"../images/event/e_".$imgurl."_40x40");

$query="insert into `event_photo` (`photo_url`,`business_id`) values ('$imgurl','$id')";
$result=mysql_query($query) or die('ERROR!'.$query);	//

$query="update event SET `photo_url` = '$imgurl' WHERE `id` =$id ";
$result=mysql_query($query) or die('ERROR!'.$query);
}
else
{
echo "<script>alert('".l("Photo upload error!")."'); history.go(-1);</script>";
exit;
}}}

////end photo 

//Submit Notification 
		if(_MAILNOTIFY_ADMIN_EVENT_SUBMIT_)	
		{
			$mail= new MP_Mailer();	
			$mail->fromMail = _SMTP_FROM_ ;
			$mail->fromName = _SMTP_FROMNAME_; 
			$mail->toMail=_MAILNOTIFY_ADMIN_EVENT_SUBMIT_;              
			$mail->Subject  = sprintf(l("A new event [%s] submitted"),stripslashes(str_replace("&nbsp;"," ",$event_name)));
			$mail->Body = $mail->Subject."<br /><a href='http://"._DOMAIN_."/mgt/' target='_blank'>Go to Management</a>";
			$mail->MPSend();
		}

// navigate
if (!empty($row[id]) && $approved==1)
echo "<script>location='./detail.php?id=".$row[id]."'</script>";
else
echo "<script>alert('".l("Event posted, and it will be shown after being approved.")."');location='./search.php'</script>";
}
else
{
echo "<script>alert('This event has been added before!'); history.go(-1);</script>";
}
exit;		
}

///////////////////////////////////////////////////////////////////////////////////
function get_cat()
{
	$rc = mysql_query("select * from `event_cat`");
	while($row=mysql_fetch_array($rc)){
		$temp.= "<li><label><input type=\"radio\" name=\"radio\" id=\"radio\" value=\"$row[id]\" checked=checked /> ".l($row[cat_name])."</label></li>";
	}
	return $temp;
}

function get_country()
{
$str="SELECT * FROM `country`";
$rc = mysql_query($str);
    while($row=mysql_fetch_array($rc)){
                $temp.= "<option value=\"".$row['c_id']."\">".l($row['c_name'])."</option>";    
          }
return $temp;
}
////////////////////////////////////////////
$var_country=get_country();
$smarty->assign("var_country",$var_country);

$var_apikey=get_key();
$var_add['catli']=get_cat();
$var_add['monthoption']=MP_TimeHelper::get_month_option();
$var_add['dayoption']=MP_TimeHelper::get_day_option();
$var_add['yearoption']=MP_TimeHelper::get_year_option(date('Y'),date('Y'));
$var_add['houroption']=MP_TimeHelper::get_hour_option();
$var_add['ampmoption']=MP_TimeHelper::get_ampm_option();

$page_title =l('New Event').' | '.get_sitename();  //
$smarty->assign("var_apikey",$var_apikey); 
$smarty->assign("var_add",$var_add); 

$smarty->assign("page_title",$page_title); 
$smarty->display('event/new.tpl');
?>