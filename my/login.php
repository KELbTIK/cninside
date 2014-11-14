<?php 
/**
 * MeePlace Login
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

@session_start();
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');


if($_SESSION["email"] or $_SESSION["display_name"] or $_SESSION["fb_user"] )
{
header("Location: ./");
exit;
}


$page_title = l('Log in').' | '.get_sitename();  //

$referer= rawurlencode($_GET['referer']);
if(empty($referer)) $referer=rawurlencode(str_replace("http://"._DOMAIN_,"",$_SERVER['HTTP_REFERER']));
if(strtolower(substr($referer,-9))=='login.php') $referer=rawurlencode('/');

$loginfail=0;


// Already Sent Login Form
if($_GET[f]=="login")
{
		// Get varibles.
		$email=strtolower(strip_tags(trim($_POST['email'])));
		$password=$_POST['password'];
        $remember = $_POST['remember'];

		// Validate Login
		if($member=validate_login($email,$password)) 
		{
			if($remember){ // set cookie for 1 day
                session_set_cookie_params(60*60*24);
            } 
            session_start();
			$_SESSION["email"]=stripslashes($email);
			$_SESSION["display_name"]=stripslashes($member['first_name']." ".$member['last_name']);
            
            // set up access for admin
            $admin_type = strtoupper(trim($member['type']));

            if($admin_type =='A'){
                $_SESSION["admin_type"]=$admin_type;
                $_SESSION["admin"]=trim($member['email']);
            }
            
			// Record Last Login Date
			mysql_query("UPDATE `user` SET `last_login_date` = '".date(Ymd)."' WHERE email='$email' LIMIT 1 ;");
			// Create Token
			mysql_query("UPDATE `user` SET `token` = '".md5(rand())."' WHERE email='$email' LIMIT 1 ;");
			
			if($remember){
                session_regenerate_id();
            }
            // Redirect 
			header("Location: ".rawurldecode($referer));
			exit;
		}
		else
		{
			$loginfail=1;  // Login Failed, Err Code = 1
		}
}
// Already Sent Register
elseif($_GET[f]=="reg")
{
		$form['firstname']=$firstname=strip_tags(trim($_POST[firstname]));
		$form['lastname']=$lastname=strip_tags(trim($_POST[lastname]));
		$form['email']=$email=strtolower(strip_tags(trim($_POST[email])));
		$form['nickname']=$nickname=strip_tags(trim($_POST[nickname]));
		$form['password']=$password=md5($_POST[password]);
		$form['zip']=$zip=strip_tags(trim($_POST[zip]));
		$form['city']=$city=$_POST[city];
		$form['gender']=$gender=$_POST[gender];
		$form['birthday']=$birthday=$_POST[year].$_POST[month].$_POST[day];	
		$form['reg_date']=$reg_date=date(Ymd);
		
		// Validate CAPTCHA
		if(_CAPTCHA_REG_ENABLE_ && !validate_captcha($_POST['code']))
		{
			$loginfail=4;  // Err Code = 4   Wrong CAPTCHA
		}
		
		// Check duplicate email
		if(check_duplicate_email($_POST[email]))   
		{
			$loginfail=2;  // Found duplicate email.
		}
		
		// Check duplicate  nickname
		if(check_duplicate_nickname($nickname))   
		{
			$loginfail=3;  // Found duplicate nickname.
		}
			
		// Do Reg action if there's no Err Code
		if($loginfail==0 && do_reg($firstname,$lastname,$email,$nickname,$password,$zip,$city,$gender,$birthday,$reg_date))
		{
			  @session_start();
			  $_SESSION["email"]=stripslashes($email);
			  $_SESSION["display_name"]=stripslashes($firstname." ".$lastname);
			  
				// Create Token
				mysql_query("UPDATE `user` SET `token` = '".md5(rand())."' WHERE email='$email' LIMIT 1 ;");
				
			  header("Location: ".rawurldecode($referer));
			  exit;
		}
}

// Check duplicate email
function check_duplicate_email($email)
{
	$result=mysql_query("SELECT `email` FROM user where email='".$email."'");	
	$val=mysql_fetch_array($result);
	if($val[email]==$email)  return true;
	else return false; // not found duplicate
}

// Check duplicate nickname
function check_duplicate_nickname($nickname)
{
	$query=mysql_query("SELECT `nickname` FROM user where `nickname`='".$nickname."'");
	$rows=mysql_num_rows($query);	 // 算总数
	if($rows!=0&&!empty($nickname)) return true;
	else return false;// not found duplicate
}

// Validate CAPTCHA
function validate_captcha($code)
{
	   require(_ABSPATH_."/inc/captcha/securimage.php");
	   $img = new Securimage();
	   $valid = $img->check($code);
	   if(!$valid)  return false;  // not valid	
	   else return true;
}

// Reg action
function do_reg($firstname,$lastname,$email,$nickname,$password,$zip,$city,$gender,$birthday,$reg_date)
{
	  $query="insert into `user` (`first_name`,`last_name`,`email`,`nickname`,`password`,`zip`,`city`,`gender`,`birthday`,`reg_date`) values ('$firstname','$lastname','$email','$nickname','$password','$zip','$city','$gender','$birthday','$reg_date')";
	  $result=mysql_query($query);
	  return true;
}

// Validate Login
function validate_login($email,$password)
{
	$result=mysql_query("SELECT * FROM user where email='$email'");	
	$val=mysql_fetch_array($result);
	  if($val[password] && $val[password]===md5($password))  return $val;
	  else  return false;
}

// Get State List to <select>
function get_state()
{
$str="SELECT * FROM `province`";
$rc = mysql_query($str);
	while($row=mysql_fetch_array($rc)){
		  $catid=$row['province_id'];
		  $catname=$row['province_name'];
		  $temp.= "<option value=\"".$catid."\">".$catname."</option>";
		  }
return $temp;
}

function get_country()
{
$str="SELECT * FROM `country`";
$rc = mysql_query($str);
    while($row=mysql_fetch_array($rc)){
                $temp.= "<option value=\"".$row['c_id']."\">".$row['c_name']."</option>";    
          }
return $temp;
}

//$var_state=get_state();
$var_country=get_country();
$smarty->assign("page_title",$page_title); 
$smarty->assign("var_country",$var_country); 
$smarty->assign("form",$form); 
$smarty->assign("loginfail",$loginfail); 
$smarty->assign("referer",$referer); 
$smarty->display('my/login.tpl');

?>