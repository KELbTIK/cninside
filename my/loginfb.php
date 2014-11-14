<?php
/**
 * MeePlace Login from Facebook
 * @package MeePlace
 * @subpackage Profile
 * @Thanks to the ideas about facebook connect from: Global IT World., Co Ltd.
 
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
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');


if(_FB_ENABLE_=='') die('Facebook cconnect is not enabled');

if($_SESSION['fb_user'] or $_SESSION["email"] or $_SESSION["display_name"])
{
    header("Location: ./");
    exit;
}

$referer= rawurlencode($_GET['referer']);
//if(empty($referer)) $referer=rawurlencode(str_replace("http://"._DOMAIN_,"",$_SERVER['HTTP_REFERER']));
if(empty($referer)) $referer='/'; 
if(strtolower(substr($referer,-11))=='loginfb.php') $referer='/';

////////////////////////////////////////////////////////////////////////////////////////////

    $app_id = _FB_ID_;
    $app_secret = _FB_SECRET_;
    $my_url = "http://" . $_SERVER['HTTP_HOST'] . "/my/loginfb.php";

    $code = $_REQUEST["code"];
    $error_code = $_REQUEST["error"]; 

    // First time accessing the page
    if(empty($code)&& $error_code !='access_denied') {
        $dialog_url = "http://www.facebook.com/dialog/oauth?client_id=" 
            . $app_id . "&redirect_uri=" . urlencode($my_url). "&scope=email";

        echo("<script> top.location.href='" . $dialog_url . "'</script>");
    }elseif($error_code =='access_denied'){ // when user clicks don't allow
        $my_url = "http://" . $_SERVER['HTTP_HOST'];
        echo("<script> top.location.href='" . $my_url . "'</script>");
    }else{   // when user clicks allow

        $token_url = "https://graph.facebook.com/oauth/access_token?client_id="
            . $app_id . "&redirect_uri=" . urlencode($my_url) . "&client_secret="
            . $app_secret . "&code=" . $code;

        $access_token = file_get_contents($token_url);

        $graph_url = "https://graph.facebook.com/me?" . $access_token;

        $user = json_decode(file_get_contents($graph_url));

        $fb_user_id =  $user->id; 
        
        // set user info
        $fbuser=get_fbuser_info($user);

        // Check if there's logged with fb before.
        if(validate_fbreged($fb_user_id))
        {
            do_fblogin($fbuser);
        }
        else   // New user, go to reg info, transfered from FB. Then login
        {
            if(do_fbreg($fbuser))  do_fblogin($fbuser);
        }
    }



////////////////////////////////////////////////////////////////////////////////////////////


// Get FB user infomation by user_id
function get_fbuser_info($user)
{
  
    $fbuser['fb_user_id']=$user->id;
    $fbuser['first_name']=$user->first_name; 
    $fbuser['last_name']=$user->last_name;
    $fbuser['email']=  ($user->email)?$user->email:$user->id .'@FacebookConnect';     
    $fbuser['pic_big']='http://graph.facebook.com/'.$user->id.'/picture?type=large'; 
   
    $fbuser['gender']=$user->gender;
    switch($fbuser['gender']){
        case "male": $fbuser['gender']=1; break;
        case "female": $fbuser['gender']=2; break;
        default: $fbuser['gender']=0; break;
        }
    // string with city and state - not use
    $fbuser['location']=$user->location->name;
    return $fbuser;
}


//Check if there's logged with fb before.
function validate_fbreged($fb_user_id)
{
    $query="SELECT `fb_user` FROM `user` where fb_user='".$fb_user_id."'";
    $rc=mysql_query($query);    
    if(mysql_num_rows($rc))     return true;
    else return false;
}


//Do login action. Set SESSION
function do_fblogin($fbuser)
{
    global $referer;
    // Record Last Login Date
    mysql_query("UPDATE `user` SET `last_login_date` = '".date(Ymd)."' WHERE fb_user='".$fbuser['fb_user_id']."' LIMIT 1 ;");
    
    if(!validate_profilecompleted($fbuser))
    {
        $_SESSION["fb_user"]=$fbuser['fb_user_id'];
        $_SESSION["email"]=$fbuser['email'];
        $_SESSION["display_name"]=$fbuser['first_name']." ".$fbuser['last_name'];
        // Create Token
        mysql_query("UPDATE `user` SET `token` = '".md5(rand())."' WHERE email='".$fbuser['email']."' LIMIT 1 ;");
        header("Location: ./signupfb.php");
    }
    else
    {
        $userObj= new MP_User();
        $userObj->fb_user=$fbuser['fb_user_id'];
        $_SESSION["fb_user"]=$fbuser['fb_user_id'];
        $_SESSION["email"]=$userObj->get_user('email');
        $_SESSION["display_name"]=$fbuser['first_name']." ".$fbuser['last_name'];
        // Create Token
        mysql_query("UPDATE `user` SET `token` = '".md5(rand())."' WHERE email='".$userObj->get_user('email')."' LIMIT 1 ;");
        header("Location: ".rawurldecode($referer)); 
    }

}


function validate_profilecompleted($fbuser)
{
    $userObj= new MP_User();
    $userObj->fb_user=$fbuser['fb_user_id'];
    if (preg_match("/FacebookConnect/", $userObj->get_user('email')))
    {
       return false; // not complete email yet
    }
    else 
    {
       return true;
    }
}

//Do reg action
function do_fbreg($fbuser)
{
        $query="insert into `user` (`first_name`,`last_name`,`email`,`zip`,`gender`,`birthday`,`reg_date`, `fb_user`) values ('".$fbuser['first_name']."','".$fbuser['last_name']."','".$fbuser['email']."','".$fbuser['zip']."','".$fbuser['gender']."','".$fbuser['birthday']."','".date(Ymd)."','".$fbuser['fb_user_id']."')";
        $result=mysql_query($query);
        $user_id = mysql_insert_id();
        store_remote_photo($fbuser,$user_id); //store fb img
        return true;
}

// Update FB user's photo to local
function store_remote_photo($fbuser,$user_id)
{
    if($fbuser['pic_big']){
        //read remote file
        if ($fp = fopen($fbuser['pic_big'], 'r')) {
               $imgcontent = '';
               // keep reading until there's nothing left
               while ($line = fgets($fp, 1024)) {
                  $imgcontent .= $line;
               }
               
               if($imgcontent){
                   $fh = fopen("../images/photos/p_".$user_id , 'w');
                   fwrite($fh, $imgcontent);
                   fclose($fh);
                    @pic_resize(670,430,"../images/photos/p_".$user_id,"../images/photos/p_".$user_id);
                    @pic_crop(100,100,"../images/photos/p_".$user_id,"../images/photos/p_".$user_id."_100x100");
                    @pic_crop(60,60,"../images/photos/p_".$user_id,"../images/photos/p_".$user_id."_60x60");
                    @pic_crop(40,40,"../images/photos/p_".$user_id,"../images/photos/p_".$user_id."_40x40");
                    @pic_crop(20,20,"../images/photos/p_".$user_id,"../images/photos/p_".$user_id."_20x20");
                    @pic_crop(16,16,"../images/photos/p_".$user_id,"../images/photos/p_".$user_id."_16x16");
                   $query="update user set photo_url='$user_id' where user_id='$user_id'";
                   mysql_query($query);
                   $query="insert into `user_photo` (`photo_url`,`user_id`,`datetime`) values ('$user_id','$user_id','".date(YmdHis)."')";
                    mysql_query($query) or die('ERROR!');
               }
        }
    }
}

?>