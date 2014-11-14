<?php 
/**
 * MeePlace gallery ajax features.
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

if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) )
{
echo "Not Login";
exit;
}

include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');
//Access Judgement
$user_id=get_user_data(user_id);
$f=$_REQUEST['f']; //func
$v=$_REQUEST['v']; //value



///Controller
if(!$f || !$v) exit;
elseif($f=='deletePhoto')
{
	if(deletePhoto($v))
	echo "Deleted";
}
elseif($f=='setAvatar')
{
	if(setAvatar($v))
	echo "Updated";
}



//Module
function deletePhoto($photo_url)
{
	global $user_id;
	if(!$user_id  || !$photo_url) return false;

	$query="DELETE FROM `user_photo` WHERE `photo_url` = $photo_url AND `user_id` =$user_id LIMIT 1";
	echo  $query;
	$result=mysql_query($query) or die('Delete Photo Error! '.$query);
    
        //if photo is used as avatar, update user record
    $query="UPDATE `user` SET  `photo_url` = '' WHERE `photo_url` = $photo_url AND `user_id` =$user_id LIMIT 1";
    echo  $query;
    $result=mysql_query($query) or die('Remove Avatar Error! '.$query); 
    
    
    // removing image files on server
    $photo1 = _ABSPATH_.'/images/photos/p_'.$photo_url.'_100x100';
    $photo2 = _ABSPATH_.'/images/photos/p_'.$photo_url.'_16x16';
    $photo3 = _ABSPATH_.'/images/photos/p_'.$photo_url.'_20x20';
    $photo4 = _ABSPATH_.'/images/photos/p_'.$photo_url.'_40x40';
    $photo5 = _ABSPATH_.'/images/photos/p_'.$photo_url.'_60x60';
    $photo6 = _ABSPATH_.'/images/photos/p_'.$photo_url;
    
    unlink($photo1);
    unlink($photo2);
    unlink($photo3);
    unlink($photo4);
    unlink($photo5);
    unlink($photo6);
    
	return true;
}


function setAvatar($photo_url)
{
	global $user_id;
	if(!$user_id || !$photo_url) return false;
	
	$query="UPDATE `user` SET `photo_url` = '$photo_url' WHERE `user_id` = $user_id LIMIT 1 ;";
	echo  $query;
	$result=mysql_query($query) or die('SetAvatar Error!'.$query);
	return true;
}

?>