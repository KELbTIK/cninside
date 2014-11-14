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
    $app_id = '196809110345351';
    $app_secret = "63bc4e0ccc1038f891be143fb72e88d2";
    
    $code = $_REQUEST["code"]; 
    if($code){
        $my_url = "http://dev1.meeplace.com/my/";
        
            $token_url = "https://graph.facebook.com/oauth/access_token?client_id="
        . $app_id . "&redirect_uri=" . urlencode($my_url) . "&client_secret="
        . $app_secret . "&code=" . $code;
            var_dump($token_url);
            echo "<br />";
            $access_token = file_get_contents($token_url);
            var_dump($access_token);
            echo "<br />";
            $graph_url = "https://graph.facebook.com/me?" . $access_token;
            var_dump($graph_url);
            echo "<br />";
            $user = json_decode(file_get_contents($graph_url));
             var_dump($user);
             echo "<br />";
            echo("Hello " . $user->name);
    }else{
        $my_url = "http://dev1.meeplace.com/";
        echo("<script> top.location.href='" . $my_url . "'</script>");
    }

   


?>