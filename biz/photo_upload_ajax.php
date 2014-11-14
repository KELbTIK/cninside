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


include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');




if($_REQUEST['token'])
{
	$userObj=new MP_User();
	$userObj->token=$_REQUEST['token'];
	$user_id=$userObj->get_user('user_id');
	if(!$user_id) die('Invalid Token');
}
else
{
	die('Not Login');
}



/////////////////page exist///////////////////////
$id=$_REQUEST[id];
$query="select * from `business` where `business_id`= '$id' limit 1";
$result=mysql_query($query);
$row=mysql_fetch_assoc($result);
if(empty($row[business_name])) {
		die('No biz');
}
	
	if ( $_FILES ) {
		$tempFile = $_FILES ['Filedata'] ['tmp_name'];
        // check the uploaded file
        $tempFile_info = getimagesize($tempFile);
        if(empty($tempFile_info)){
            echo 'The uploaded file does not seem to be an image.';

            exit;

        }else{
            
		    $targetPath = _ABSPATH_.'/images/business/';
		    $imgurl=date(YmdHis).$user_id;
		    $targetFile = str_replace ( '//', '/', $targetPath ) . "b_".$imgurl;
		    if(move_uploaded_file ( $tempFile, $targetFile ))
		    {
			    pic_resize(900,700,$targetFile ,$targetFile );
			    pic_resize(195,180,$targetFile ,$targetFile ."_195x180");
			    pic_resize(150,95,$targetFile ,$targetFile ."_150x95");
			    pic_crop(100,100,$targetFile ,$targetFile ."_100x100");
			    pic_crop(80,80,$targetFile ,$targetFile ."_80x80");
			    pic_crop(40,40,$targetFile ,$targetFile ."_40x40");
		    }
    ////end photo 
		    
		    //
		    $query="insert into `business_photo` (`photo_url`,`business_id`,`user_id`) values ('$imgurl','$id','$user_id')";
		    $result=mysql_query($query) or die('ERROR!');
		    
		    //If no previous photo. Update photo
		    $bizObj= new MP_Business();
		    $bizObj->biz_id=$id;
		    $currentUrl=$bizObj->get('photo_url');
		    if(!$currentUrl)
		    {
			    $query="update business SET `photo_url` = '$imgurl' WHERE `business_id` =$id ";
			    $result=mysql_query($query) or die('ERROR!');
		    }
		    
		    
		    /*
		    If you need to replace business cover to the newest uploaded one, please uncomment belows:
		    
		    $query="update business SET `photo_url` = '$imgurl' WHERE `business_id` =$id ";
		    $result=mysql_query($query) or die('ERROR!');
		    */
		    
		    echo '1';
    } // end if for checking image
	}
	else
	{
		echo 'File Upload Error';
	}

?>