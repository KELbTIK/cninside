<?php 
/**
 * MeePlace Add photos for business.
 * @package MeePlace
 * @subpackage Business
 
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

$id=$_GET[id];

		$query="select * from `business` where `business_id`= '$id'";
		$result=mysql_query($query);
		$row=mysql_fetch_array($result);


/////////////////page exist///////////////////////

if(empty($row[business_name])) {
	
	echo "<script type=\"text/javascript\" language=\"javascript\"> alert(\"Page not exist!\"); history.go(-1);</script>";
		exit;
}
$user_id=get_user_data(user_id);
if($_GET[f]=='submit')
{
//photo
if ($_FILES["file"]["error"]==0)
{
$fName=$_FILES["file"]["name"];

$fDir=$_FILES["file"]["tmp_name"];
$tempFile_info = getimagesize($fDir);
$ext=strrchr($fName,".");
$deniedExtensions=array('html','htm','php','php2','php3','php4','php5','phtml','pwml','inc','asp','aspx','ascx','jsp','cfm','cfc','pl','bat','exe','com','dll','vbs','js','reg','cgi','htaccess','asis','sh','shtml','shtm','phtm');
if (in_array($ext,$deniedExtensions))
{ echo "<script>alert('".l("Photo extensions illegal!")."'); history.go(-1);</script>";
exit;
} elseif(empty($tempFile_info)){
echo "<script>alert('The uploaded file does not seem to be an image.'); history.go(-1);</script>";
exit;
}
else{
$imgurl=date(YmdHis).$user_id;
if (move_uploaded_file($fDir,"../images/business/b_".$imgurl))
{
	pic_resize(900,700,"../images/business/b_".$imgurl,"../images/business/b_".$imgurl);
	pic_resize(195,180,"../images/business/b_".$imgurl,"../images/business/b_".$imgurl."_195x180");
	pic_resize(150,95,"../images/business/b_".$imgurl,"../images/business/b_".$imgurl."_150x95");
	pic_crop(100,100,"../images/business/b_".$imgurl,"../images/business/b_".$imgurl."_100x100");
	pic_crop(80,80,"../images/business/b_".$imgurl,"../images/business/b_".$imgurl."_80x80");
	pic_crop(40,40,"../images/business/b_".$imgurl,"../images/business/b_".$imgurl."_40x40");
}
else
{
echo "<script>alert('".l("Photo upload error!")."'); history.go(-1);</script>";
exit;
}}

////end photo 
		
		//
		$query="insert into `business_photo` (`photo_url`,`business_id`,`user_id`) values ('$imgurl','$id','$user_id')";
		$result=mysql_query($query) or die('ERROR!');
		/*
		If you need to replace business cover to the newest uploaded one, please uncomment belows:
		
		$query="update business SET `photo_url` = '$imgurl' WHERE `business_id` =$id ";
		$result=mysql_query($query) or die('ERROR!');
		*/
		
echo "<script>alert('".l("Photo uploaded!")."');location='photo.php?id=".$id."'</script>";
}}


/////some template vars.
$var_biz['id']=$row['business_id'];
$var_biz['bizname']=$title=$row['business_name'];
$var_biz['picurl']='b_'.$row['photo_url'];
$page_title =sprintf(l('Upload photo for %s'),$row['business_name']).' | '.get_sitename();  //

$smarty->assign("var_biz",$var_biz); 
$smarty->assign("page_title",$page_title); 
$smarty->display('biz/new_photo.tpl');




?>