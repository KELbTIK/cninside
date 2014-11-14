<?php
/**
 * MeePlace Destory Session, Log out.
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
 
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
// Create Token
$email=$_SESSION["email"];
$query="UPDATE `user` SET `token` = '' WHERE email='$email' LIMIT 1 ;";
mysql_query($query);


session_destroy(); 

header("Location: ".$_SERVER['HTTP_REFERER']);
?>