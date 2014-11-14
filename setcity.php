<?php
/**
 * MeePlace Multi-city selector. Not enabled yet currently.
 * @package MeePlace
 
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
if(empty($_GET[id])) 
$value=999;
else  
$value = $_GET[id];


setcookie("city", $value, time()+3600000);

$urlRows=parse_url($_SERVER['HTTP_REFERER']);
$url=$urlRows["path"];
if(!empty($urlRows["query"]))
$url.="?".$urlRows["query"];

header("Location: $url");
?>