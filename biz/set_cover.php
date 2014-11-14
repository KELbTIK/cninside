<?php 
/**
 * MeePlace Business Cover / Image management page.
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
//Count path level!

@session_start();

include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

$biz_id=$_GET['id'];

 $query="select * from `business` where `business_id`='$biz_id'";
 $rc=mysql_query($query) or die("ERROR: $query");
 $row=mysql_fetch_assoc($rc);
	if($row['user_id']!=get_user_data('user_id')) {
		echo l("This business is not yours!");
		exit;
	}


//del 
if($_GET['f']=='del')
{
    $query="SELECT photo_url FROM  `business_photo` WHERE `id`='$_GET[v]'  LIMIT 1";
    $rc=mysql_query("$query") or die("Delete Photo Error 1");
    $row = mysql_fetch_array($rc);

    $photo_url = $row[photo_url];
    $photo1 = _ABSPATH_.'/images/business/b_'.$photo_url.'_195x180';
    $photo2 = _ABSPATH_.'/images/business/b_'.$photo_url.'_150x95';
    $photo3 = _ABSPATH_.'/images/business/b_'.$photo_url.'_100x100';
    $photo4 = _ABSPATH_.'/images/business/b_'.$photo_url.'_80x80';
    $photo5 = _ABSPATH_.'/images/business/b_'.$photo_url.'_40x40';
    $photo6 = _ABSPATH_.'/images/business/b_'.$photo_url;

    unlink($photo1);
    unlink($photo2);
    unlink($photo3);
    unlink($photo4);
    unlink($photo5);
    unlink($photo6); 
    
    $query="DELETE FROM  `business_photo` WHERE `id`='$_GET[v]'  LIMIT 1";
	mysql_query($query) or die('Set Cover Erro');
}

//set cover
if($_GET['f']=='cover')
{
	$query="UPDATE `business` SET `photo_url`='$_GET[v]' WHERE  `business_id`=$biz_id";
	mysql_query($query) or die('Set Cover Erro');
}


$msg='';

$query="select p.id as pic_id,   p.photo_url as pic_url,  b.business_name as business_name , b.photo_url as cover_url  from `business_photo` as p,  `business` as b where b.business_id= '$biz_id' and b.business_id=p.business_id";
$result=mysql_query($query);
$i=0;
$var_pic=array();
while($row=mysql_fetch_array($result))
{
	$var_biz['bizname']=$row['business_name'];
	$var_biz['picurl']=$row['cover_url'];
	$var_pic[$i]['id']=$row['pic_id'];
	$var_pic[$i]['url']=$row['pic_url'];
	$var_pic[$i]['date']=turn_date(substr($row[pic_url],0,14),'ftimeordate');
	$var_pic[$i]['user_id']=substr($row[pic_url],14);
	$var_pic[$i]['user_name']=get_user_data(nameORemail,$var_pic[$i]['user_id']);
	$var_pic[$i]['user_email']=get_user_data(email,$var_pic[$i]['user_id']);
	$i+=1;
}
if(!$var_pic) $msg=l('No images found for this business.');



// Check if cover was been deleted just now.
if($var_pic)
{
	foreach($var_pic as $pic)
	{
		if ($var_biz['picurl']==$pic['url'])
		$cover_file_existed=1;
	}
	if(!$cover_file_existed)
	{
		if(!$var_pic[0])
		{   //no pic
			$query="update business SET `photo_url` = '' WHERE `business_id` =$biz_id ";
		}
		else
		{
			$photo_url=  $var_pic[0][url] ;
			$query="update business SET `photo_url` = $photo_url WHERE `business_id` =$biz_id ";
		}
		mysql_query($query);	
		
	}
}
else  // no one pic
{
	$query="update business SET `photo_url` = '' WHERE `business_id` =$biz_id ";
	mysql_query($query);	
}
//end check








//template vars.
$var_biz['id']=$biz_id;

$page_title =sprintf(l('Cover/Image Management for %s'),$var_biz['bizname']).' | '.get_sitename();  //
/////////POST

/////////////////////////////////////////////////////////////////////////////////////////

$smarty->assign("var_biz",$var_biz); 
$smarty->assign("var_pic",$var_pic); 
$smarty->assign("msg",$msg); 
$smarty->assign("page_title",$page_title); 
$smarty->display('biz/set_cover.tpl');
?>