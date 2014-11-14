<?php 
/**
 * MeePlace local photos Gallery
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

if(!$_GET[id]) die('No User ID Queried');

$user_id=get_user_data('user_id');

$id=$_GET[id];  //Look for user ID

//$user_id=(int) $_GET[id];

$user_id= $_GET[id]; 
$userObj= new MP_User();
$userObj->user_id=$user_id;
$var_user=$userObj->get_user();
if(!$var_user) die('No found person ID='.$user_id);
//$var_photos=$userObj->get_gallery_listing(); 

$query="select *  from `business_photo` where user_id='$user_id'";
$result=mysql_query($query);
$i=0;
$var_photos=array(); 
while($row=mysql_fetch_array($result))
{

    $var_photos[$i]['id']=$row['id'];
    $var_photos[$i]['photo_url']=$row['photo_url'];
    $biz_id = $row['business_id'];
    $result2=mysql_query("SELECT business_name,permalink FROM business WHERE business_id='$biz_id'");
    if($result2){
         $row2=mysql_fetch_array($result2);
         $var_photos[$i]['business_name']=$row2['business_name'];
         $var_photos[$i]['permalink']=$row2['permalink'];
    }

    $var_photos[$i]['datetime']=turn_date(substr($row['photo_url'],0,14),'ftimeordate');
    $i+=1;
}

$page_title = sprintf(l('%s\'s Photos'),$var_user['nameORemail']).' | '.get_sitename();  //

$var_me['user_id']=get_user_data('user_id');
$var_me['token']=get_user_data('token');
$smarty->assign("page_title",$page_title); 
$smarty->assign("var_user",$var_user); 
$smarty->assign("var_me",$var_me); 
$smarty->assign("var_photos",$var_photos); 
$smarty->display('my/gallery_listing.tpl');
?>