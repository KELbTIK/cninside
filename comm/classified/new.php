<?php 
/**
 * MeePlace Create a Classified thread
 * @package MeePlace
 * @package Community
 
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
header("Location: ../../my/login.php");
exit;
}


include_once(dirname(__FILE__)."/../../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

// Already Sent Register
if($_GET[f]=="submit")
{
		$userid=get_user_data(user_id);
		$title=nl2br(strip_tags(trim($_POST[topic])));
		$catid=$_POST[dhtmlgoodies_country];
		$subcat=$_POST[dhtmlgoodies_city];
		$location=$_POST[location];
		$content=nl2br(strip_tags(trim($_POST[content])));
		$topic_date=date(YmdHis);
		$s1=$_POST[s1]?"1":"0";
		$s2=$_POST[s2]?"1":"0";
		$s3=$_POST[s3]?"1":"0";
		$s4=$_POST[s4]?"1":"0";
		$s5=$_POST[s5]?"1":"0";
		$s6=$_POST[s6]?"1":"0";
		$s7=$_POST[s7]?"1":"0";
		$f1=$_POST[f1]?"1":"0";
		$f2=$_POST[f2]?"1":"0";
		$f3=$_POST[f3]?"1":"0";
		$f4=$_POST[f4]?"1":"0";
		$query="insert into `deals` (`title`,`cat_id`,`subcat_id`,`user_id`,`location`,`content`,`topic_date`,`reply_time`,`s1`,`s2`,`s3`,`s4`,`s5`,`s6`,`s7`,`f1`,`f2`,`f3`,`f4`) values ('$title','$catid','$subcat','$userid','$location','$content','$topic_date','$topic_date','$s1','$s2','$s3','$s4','$s5','$s6','$s7','$f1','$f2','$f3','$f4')";
		$result=mysql_query($query);
		
		$id = mysql_insert_id();
		if(!$id)// if mysql_insert_id=null
		{
			$tq="select * from `deals` where `title`= '$title' and `user_id`='$userid' limit 1";
			$tr=mysql_query($tq);
			$tv=mysql_fetch_assoc($tr);
			$id=$tv['id'];
		}
		
		
		//photo
		if ($_FILES["file"]["error"]==0)
		{
			$fName=$_FILES["file"]["name"];
			$fDir=$_FILES["file"]["tmp_name"];
            $tempFile_info = getimagesize($fDir);
			$ext=strtolower(strrchr($fName,"."));
			$deniedExtensions=array('html','htm','php','php2','php3','php4','php5','phtml','pwml','inc','asp','aspx','ascx','jsp','cfm','cfc','pl','bat','exe','com','dll','vbs','js','reg','cgi','htaccess','asis','sh','shtml','shtm','phtm');
			if (in_array($ext,$deniedExtensions))
			{
				echo "<script>alert('Photo extensions illegal!'); history.go(-1);</script>";
				exit;
			}
            elseif(empty($tempFile_info)){
                echo "<script>alert('The uploaded file does not seem to be an image.'); history.go(-1);</script>";
                exit;
            }
			else
			{
				$imgurl=date(YmdHis).$userid.$ext;
				if (move_uploaded_file($fDir,"../../images/upload/".$imgurl))
				{
					pic_resize(900,700,"../../images/upload/".$imgurl,"../../images/upload/".$imgurl);
					pic_resize(195,180,"../../images/upload/".$imgurl,"../../images/upload/195x180_".$imgurl);
					pic_resize(150,95,"../../images/upload/".$imgurl,"../../images/upload/150x95_".$imgurl);
					pic_crop(100,100,"../../images/upload/".$imgurl,"../../images/upload/100x100_".$imgurl);
					pic_crop(80,80,"../../images/upload/".$imgurl,"../../images/upload/80x80_".$imgurl);
					pic_crop(40,40,"../../images/upload/".$imgurl,"../../images/upload/40x40_".$imgurl);
					//
					/*
					$query="insert into `business_photo` (`photo_url`,`business_id`) values ('$imgurl','$business_id')";
					$result=mysql_query($query) or die('ERROR!');
					*/
					$query="update `deals` SET `photo_url` = '$imgurl' WHERE `id` =$id ";
					$result=mysql_query($query) or die('ERROR!');
				}
				else
				{
					echo "<script>alert('Photo upload error!! Please contact us!'); history.go(-1);</script>";
					exit;
				}
			}
		}	
		////end photo 	
		
		
        header("Location: ../?f=Classified");
		exit;
}

function get_cat()
{
	$temp='';
$str="SELECT * FROM `deals_cat`";
$rc = mysql_query($str) or die ("Sorry! could not execute query $str ".mysql_error());
	while($row=mysql_fetch_array($rc)){
		$catid=$row['cat_id'];
		$catname=l($row['cat_name']);
		
		//check if no sub?	
		$strSub="SELECT * FROM `deals_subcat` where `cat_id`='".$row['cat_id']."'";
		$rcSub = mysql_query($strSub) or die ("Sorry! could not execute query $str ".mysql_error());
		if(mysql_num_rows($rcSub))				
		{
			$temp.= "<option value=\"".$catid."\">".$catname."</option>";
		}
  }
  return $temp;
}
////////

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

$get_cat=get_cat();
$page_title = l('New Posting').' | '.get_sitename();  //
$smarty->assign("get_cat",$get_cat); 
$smarty->assign("page_title",$page_title); 
$smarty->display('comm/classified/new.tpl');
?>
