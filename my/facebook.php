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
/* session_start();
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');


if(_FB_ENABLE_=='') die('Facebook cconnect is not enabled');

if($_SESSION['fb_user'] or $_SESSION["email"] or $_SESSION["display_name"])
{
    header("Location: ./");
    exit;
}

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
if(empty($referer)) $referer=rawurlencode(str_replace("http://"._DOMAIN_,"",$_SERVER['HTTP_REFERER']));
if(strtolower(substr($referer,-11))=='loginfb.php') $referer='/';

    //$app_id = '196809110345351';
    //$app_secret = "63bc4e0ccc1038f891be143fb72e88d2";
    
    $app_id = _FB_APIKEY_;
    $app_secret = _FB_SECRET_;
    $my_url = "http://dev1.meeplace.com/my/facebook.php";

    $code = $_REQUEST["code"];
    $error_code = $_REQUEST["error"]; 

    // First time accessing the page
    if(empty($code)&& $error_code !='access_denied') {
        $dialog_url = "http://www.facebook.com/dialog/oauth?client_id=" 
            . $app_id . "&redirect_uri=" . urlencode($my_url). "&scope=email,read_stream,user_photos";

        echo("<script> top.location.href='" . $dialog_url . "'</script>");
    }elseif($error_code =='access_denied'){ // when user clicks don't allow
        $my_url = "http://dev1.meeplace.com/";
        echo("<script> top.location.href='" . $my_url . "'</script>");
    }else{   // when user clicks allow

        $token_url = "https://graph.facebook.com/oauth/access_token?client_id="
            . $app_id . "&redirect_uri=" . urlencode($my_url) . "&client_secret="
            . $app_secret . "&code=" . $code;

        $access_token = file_get_contents($token_url);

        $graph_url = "https://graph.facebook.com/me?" . $access_token;

        $user = json_decode(file_get_contents($graph_url));
        
        $graph_url_photos = $user->link . "/picture/";
         $user_photos = json_decode(file_get_contents($graph_url_photos)); 
        echo '<pre>';
        var_dump($user_photos);
        var_dump($user);
        echo '<pre>';
        echo("Hello " . $user->name);
    }

?>