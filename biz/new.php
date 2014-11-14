<?php 
/**
 * MeePlace create business.
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

if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) ) 
{
header("Location: ../my/login.php?referer=/"._BIZ_DIR_."/new.php");
exit;
}


$page_title = l('Add a Business').' | '.get_sitename();  //

// Already Sent Register
if($_GET[f]=="submit")
{
	$business_name=strip_tags(trim($_POST['biz_name']));
	$permalink=mark_convert($_POST['permalink']);
	$business_add1=strip_tags(trim($_POST['biz_add1']));
	$business_add2=strip_tags(trim($_POST['biz_add2']));
	$business_phone=strip_tags(trim($_POST['phone']));   
	$city_id=strip_tags(trim($_POST['biz_city']));
	$zip=strip_tags(trim($_POST['zip']));
	$cat_id=$_POST['dhtmlgoodies_country'];
	$sub_cat_id=$_POST['dhtmlgoodies_city'];
	$cat_id2=$_POST['dhtmlgoodies_country2'];
	$sub_cat_id2=$_POST['dhtmlgoodies_city2'];
	$cat_id3=$_POST['dhtmlgoodies_country3'];
	$sub_cat_id3=$_POST['dhtmlgoodies_city3'];
	$submitter_id=get_user_data(user_id);
	$x=$_POST['x'];
	$y=$_POST['y'];
	$mapx=$_POST['mapx'];
	$mapy=$_POST['mapy'];
	$zoom=$_POST['zoom'];
	$submit_date=date(Ymd);
    
    $business_web=strip_tags(trim($_POST['web']));
    if($business_web && strpos($business_web,'http://') === false){
         $business_web = 'http://'. $business_web; 
    }
    
     $video_url=strip_tags(trim($_POST['video_url']));
    if($video_url && strpos($video_url,'http://') === false){
         $video_url = 'http://'. $video_url; 
    } 
	
	$description=strip_tags(trim($_REQUEST['description']));
	$pricerange=strip_tags(trim($_REQUEST['pricerange']));
	
	if($_REQUEST['openhours']=='1') // Regular Hours
	{
		$weeks='';
		for($i=0; $i<=7; $i++)
		{
			if($_REQUEST['week'.$i])
			$weeks.=$i.',';
		}
		$fromhour=strip_tags(trim($_REQUEST['fromhour']));
		$tohour=strip_tags(trim($_REQUEST['tohour']));
	}
	elseif($_REQUEST['openhours']=='2') //Custom Hours
	{
		$open_hours='';
		for($i=0; $i<=7; $i++)
		{
			if($_REQUEST['wk'.$i])
			{
				$open_hours.=strip_tags(trim($_REQUEST['fromhour'.$i]));
				$open_hours.='-';
				$open_hours.=strip_tags(trim($_REQUEST['tohour'.$i]));
			}
			$open_hours.=',';
		}
		
	}
	
	
	////claim vars
	$claimemail=strip_tags(trim($_REQUEST['claimemail']));
	$claimphone=strip_tags(trim($_REQUEST['claimphone']));
	$claimisowner=$_REQUEST['claimisowner'];
	$claimfullname=strip_tags(trim($_REQUEST['claimname']));
	$claiminfo=strip_tags(trim($_REQUEST['claiminfo']));
	// 

	
	if(_NEW_BIZ_APPROVAL_NEED_==0) //needn't
		$approved=1;
	else
		$approved=0;
	
	// code fail vali start
	$codefail=0;
	
	//check if permalink existed
	if(biz_permalink_duplicate($permalink) || !$permalink )
		$codefail=4;
	
	
	// CAPTCHA
	if(_CAPTCHA_BIZ_ENABLE_)
	{
		require(_ABSPATH_."/inc/captcha/securimage.php");
		$img = new Securimage();
		$valid = $img->check($_POST['code']);
		if(!$valid) 
		{
			$codefail=1;
		}
	}

	//add record	
	if($codefail==0)
	{	
		$query=sprintf("insert into `business` (`business_name`,`business_add1`,`business_add2`,`business_phone`,`business_web`,`city_id`,`zip`,`cat_id`,`sub_cat_id`,`cat_id2`,`sub_cat_id2`,`cat_id3`,`sub_cat_id3`,`user_id`,`submitter_id` ,`rating`,`x`,`y`,`mapx`,`mapy`,`zoom`,`video_url`, `submit_date`, `approved`, `description`, `from_hour`, `to_hour`, `weeks`, `price_range`, `permalink`,`open_hours`) values ('%s','%s','%s','%s','%s','%s','%s','%u','%u','%u','%u','%u','%u','0','%u','%u','%s','%s','%s','%s','%s','%s', '%s',%s, '%s',  '%s',   '%s',  '%s',  '%s' ,'%s','%s')",$business_name,$business_add1,$business_add2,$business_phone,$business_web,$city_id,$zip,$cat_id,$sub_cat_id,$cat_id2,$sub_cat_id2,$cat_id3,$sub_cat_id3,$submitter_id,'0',$x,$y,$mapx,$mapy,$zoom,$video_url,$submit_date, $approved, $description,$fromhour,$tohour,$weeks,$pricerange,$permalink,$open_hours);
	
		if (_DEBUG_)
		{
			echo "Debug Mode will not redirect: Query is<br/>",$query;//Debug
			exit;
		}
		$result=mysql_query($query);
		//Get new record id
		$business_id = mysql_insert_id();
		if(!$business_id)// if mysql_insert_id=null
		{
			$tq="select * from `business` where `permalink`= '$permalink' limit 1";
			$tr=mysql_query($tq);
			$tv=mysql_fetch_assoc($tr);
			$business_id=$tv['business_id'];
		}
		$rating=$_POST[rating];
		
		//photo
		if ($_FILES["file"]["error"]==0)
		{
			$fName=$_FILES["file"]["name"];
			$fDir=$_FILES["file"]["tmp_name"];
            $tempFile_info = getimagesize($fDir); 
			$ext=strrchr($fName,".");
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
				$imgurl=date(YmdHis).$submitter_id;
				if (move_uploaded_file($fDir,"../images/business/b_".$imgurl))
				{
					pic_resize(900,700,"../images/business/b_".$imgurl,"../images/business/b_".$imgurl);
					pic_resize(195,180,"../images/business/b_".$imgurl,"../images/business/b_".$imgurl."_195x180");
					pic_resize(150,95,"../images/business/b_".$imgurl,"../images/business/b_".$imgurl."_150x95");
					pic_crop(100,100,"../images/business/b_".$imgurl,"../images/business/b_".$imgurl."_100x100");
					pic_crop(80,80,"../images/business/b_".$imgurl,"../images/business/b_".$imgurl."_80x80");
					pic_crop(40,40,"../images/business/b_".$imgurl,"../images/business/b_".$imgurl."_40x40");
					//
					
					$query="insert into `business_photo` (`photo_url`,`business_id`,`user_id`) values ('$imgurl','$business_id','$submitter_id')";
					$result=mysql_query($query) or die('ERROR!');
					
					$query="update business SET `photo_url` = '$imgurl' WHERE `business_id` =$business_id ";
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

		if($_POST['biz_review'])
		{
			$reviews_num=1;
			$review_desc=nl2br(strip_tags(trim($_POST['biz_review'])));
	
			$review_date=date(YmdHis);
			$query="insert into `business_reviews` (`review_desc`,`review_date`,`user_id`,`business_id`,`rating`,`cat_id`) values ('$review_desc','$review_date','$submitter_id','$business_id','$rating','$cat_id')";
			$result=mysql_query($query);
			
			
			$query="update `business` set `rating`='$rating', `reviews_num`='1' where `business_id`='$business_id'";
			$result=mysql_query($query);
			////////user 's  review number //////////
			$row = mysql_fetch_array(mysql_query("select * from `user` where user_id='$submitter_id'"));
			$reviews_num=$row[reviews_num]+1;
			$query="UPDATE `user` set reviews_num='$reviews_num' where user_id='$submitter_id'";
			$result=mysql_query($query);
			//////////end review number adding////////
			
		}
		////////claim business
		if($claimemail || $claimfullname || $claimphone || $claiminfo)
		{
            $user_type = $claimisowner;
            if($claimisowner == 'O'){
                $claimisowner = 'on'; 
            }else{
                $claimisowner = '';
            }
			mysql_query("INSERT INTO `business_claim` (`user_id` ,`email`,`phone`,`business_id` ,`information` ,`isowner`,`name`,`user_type`) VALUES ( '$submitter_id','$claimemail', '$claimphone',  '$business_id', '$claiminfo' ,'$claimisowner', '$claimfullname', '$user_type');");
			//Submit Notification 
			if(_MAILNOTIFY_ADMIN_BIZ_CLAIM_)	
			{
				$mail= new MP_Mailer();	
				$mail->fromMail = _SMTP_FROM_ ;
				$mail->fromName = _SMTP_FROMNAME_; 
				$mail->toMail=_MAILNOTIFY_ADMIN_BIZ_CLAIM_;              
				$mail->Subject  = sprintf(l("New business claim request for [%s]"),stripslashes(str_replace("&nbsp;"," ",$business_name)));
				$mail->Body = $mail->Subject."<br /><a href='http://"._DOMAIN_."/mgt/' target='_blank'>Go to Management</a>";
				$mail->MPSend();
			}
		}
		
		
		//Submit Notification 
		if(_MAILNOTIFY_ADMIN_BIZ_SUBMIT_)	
		{
			$mail= new MP_Mailer();	
			$mail->fromMail = _SMTP_FROM_ ;
			$mail->fromName = _SMTP_FROMNAME_; 
			$mail->toMail=_MAILNOTIFY_ADMIN_BIZ_SUBMIT_;              
			$mail->Subject  = sprintf(l("A new business [%s] submitted"),stripslashes(str_replace("&nbsp;"," ",$business_name)));
			$mail->Body = $mail->Subject."<br /><a href='http://"._DOMAIN_."/mgt/' target='_blank'>Go to Management</a>";
		//	$mail->MPSend();
		}
		
		
		if($approved==1)
	        header("Location: ./detail.php?id=$business_id");
		else
			echo "<script>alert('".l("Business posted, and it will be shown after being approved.")."');location='./search.php'</script>";
		
			
		exit;
	}// if error code==0
}


////////

////////////



$var_apikey=get_key();
$var_cat=get_biz_cats_options();
//$var_state=get_provinces_options();

$var_country=get_country_options();
$smarty->assign("var_apikey",$var_apikey); 
//$smarty->assign("var_state",$var_state);
$smarty->assign("var_country",$var_country); 
$smarty->assign("var_cat",$var_cat); 
$smarty->assign("codefail",$codefail);
$smarty->assign("page_title",$page_title);
$smarty->display('biz/new.tpl');
?>