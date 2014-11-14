<?php 
/**
 * MeePlace Edit profile
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
session_start();
@set_time_limit(0);
@ini_set("memory_limit","80M");


if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) )
{
header("Location: ./login.php");
exit;
}

include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');


$page_title = l('Edit your profile').' | '.get_sitename();  //




//////////////////////////////////////////////////

if($_GET[f]=="send")
{

$nickname=strip_tags(trim($_POST[nickname]));
$zip=strip_tags(trim($_POST[zip]));
$city=$_POST[city];
$gender=$_POST[gender];
$birthday=$_POST[year].$_POST[month].$_POST[day];	

$headline=strip_tags(trim($_POST[headline]));
$findme=strip_tags(trim($_POST[findme]));
$hometown=strip_tags(trim($_POST[hometown]));
$website1=strip_tags(trim($_POST[website1]));
$not_yelping=strip_tags(trim($_POST[not_yelping]));
$review_comment=strip_tags(trim($_POST[review_comment]));
$website2=strip_tags(trim($_POST[website2]));
$book=strip_tags(trim($_POST[book]));
$concert=strip_tags(trim($_POST[concert]));
$movie=strip_tags(trim($_POST[movie]));
$meal=strip_tags(trim($_POST[meal]));
$do_not_tell=strip_tags(trim($_POST[do_not_tell]));
$discovery=strip_tags(trim($_POST[discovery]));
$current_crash=strip_tags(trim($_POST[current_crash]));

$user_id=get_user_data('user_id');

//print_r($_FILES['file']);
//exit;

//// check nickname
		$result="SELECT `user_id`,`nickname` FROM user where `nickname`='$nickname'";
		$query=mysql_query("$result");
		$row=mysql_fetch_array($query);
	$rows=mysql_num_rows($query);	 
	if($rows!=0&&$row[user_id]!=$user_id&&!empty($nickname)){$loginfail=3;}
else{
    
    if ($city){
    
$query="UPDATE `user` set nickname='$nickname', zip='$zip', gender='$gender', birthday='$birthday' , headline='$headline', find_me_in='$findme' , hometown='$hometown', blog_url='$website1', not_planet='$not_yelping', review_comment='$review_comment', fav_web='$website2', book='$book', concert='$concert', movie='$movie' , meal='$meal', do_not_tell='$do_not_tell', discovery='$discovery' ,  current_crash='$current_crash', city = $city where `user_id`='$user_id'";
    }else{
 $query="UPDATE `user` set nickname='$nickname', zip='$zip', gender='$gender', birthday='$birthday' , headline='$headline', find_me_in='$findme' , hometown='$hometown', blog_url='$website1', not_planet='$not_yelping', review_comment='$review_comment', fav_web='$website2', book='$book', concert='$concert', movie='$movie' , meal='$meal', do_not_tell='$do_not_tell', discovery='$discovery' ,  current_crash='$current_crash' where `user_id`='$user_id'";       
    }
		$result=mysql_query($query);
		
		
//photo
if ($_FILES["file"]["error"]==0&&!empty($_FILES["file"]["name"]))
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
						 $imgurl=$user_id;
						 @unlink("../images/photos/p_".$imgurl);
                          if (move_uploaded_file($fDir,"../images/photos/p_".$imgurl))
					{
							@pic_resize(670,430,"../images/photos/p_".$imgurl,"../images/photos/p_".$imgurl);
							@pic_crop(100,100,"../images/photos/p_".$imgurl,"../images/photos/p_".$imgurl."_100x100");
							@pic_crop(60,60,"../images/photos/p_".$imgurl,"../images/photos/p_".$imgurl."_60x60");
							@pic_crop(40,40,"../images/photos/p_".$imgurl,"../images/photos/p_".$imgurl."_40x40");
							@pic_crop(20,20,"../images/photos/p_".$imgurl,"../images/photos/p_".$imgurl."_20x20");
							@pic_crop(16,16,"../images/photos/p_".$imgurl,"../images/photos/p_".$imgurl."_16x16");
							
						$query="UPDATE `user` set photo_url='$imgurl' where `user_id`='$user_id'";
	$result=mysql_query($query);
					}
					else
					{
						echo "<script>alert('Photo upload error!! Please contact us!'); history.go(-1);</script>";
						exit;
					}
                     }
               }

////


	if(!empty($_POST[password]))
	{
	$password=md5($_POST[password]);
	$query="UPDATE `user` set password='$password' where `user_id`='$user_id'";
	$result=mysql_query($query);
	@session_start();
	session_destroy();  
	echo "<script>alert('Edit Profile Successful!\\nPassword has been changed, so now please re-login.');location='./login.php';</script>";
	}
	else
	{
	echo "<script>alert('".l('Edit Profile Successful!')."');location='./';</script>";}
exit;
}}


//////////////////////////////////////

$var_me['user_id']=get_user_data('user_id');
$var_me['firstname']=get_user_data('first_name');
$var_me['lastname']=get_user_data('last_name');
$var_me['email']=get_user_data('email');
$var_me['nickname']=get_user_data('nickname');
$var_me['birthday']=get_user_data('birthday');
$var_me['zip']=get_user_data('zip');
$var_me['gender']=get_user_data('gender');
$var_me['picurl']='p_'.get_user_data('photo_url');
$var_me['headline']=get_user_data('headline');
$var_me['findmein']=get_user_data('find_me_in');
$var_me['hometown']=get_user_data('hometown');
$var_me['blogurl']=get_user_data('blog_url');
$var_me['notplanet']=get_user_data('not_planet');
$var_me['reviewcomment']=get_user_data('review_comment');
$var_me['favweb']=get_user_data('fav_web');
$var_me['book']=get_user_data('book');
$var_me['concert']=get_user_data('concert');
$var_me['movie']=get_user_data('movie');
$var_me['meal']=get_user_data('meal');
$var_me['donottell']=get_user_data('do_not_tell');
$var_me['discovery']=get_user_data('discovery');
$var_me['currentcrash']=get_user_data('current_crash');
$var_me['fb_user_id']=get_user_data('fb_user');

// Get location information:

$var_city=get_user_data('city');
if($var_city){
    $query="SELECT province_name, city_name, province_id FROM `user`, `province`, `city` WHERE user.city = city.city_id AND city.city_state = province.province_id AND city= $var_city GROUP BY city_name";
    $result=mysql_query($query);
    $row=mysql_fetch_array($result);
    $var_me['state_id'] =  $row[province_id]; 
    $var_me['state'] =  $row[province_name];
    $var_me['city'] =  $row[city_name];
}


// Get State List to <select>
function get_state()
{
$str="SELECT * FROM `province`";
$rc = mysql_query($str);
    while($row=mysql_fetch_array($rc)){
                $temp.= "<option value=\"".$row['province_id']."\">".$row['province_name']."</option>";    
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


//$var_state=get_state();
$var_country=get_country();
$smarty->assign("var_country",$var_country);
$smarty->assign("loginfail",$loginfail); 
$smarty->assign("var_me",$var_me); 
$smarty->assign("page_title",$page_title); 
$smarty->display('my/edit.tpl');

?>