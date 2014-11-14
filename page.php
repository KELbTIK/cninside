<?php 
/**
 * MeePlace page display, such as for Privacy Policy and Terms of Service
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
include_once(dirname(__FILE__)."/inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php'); 

//Set the page you want, in case of hacker's getting info.
/*if($_GET[page]!='privacy' && $_GET[page]!='terms')
exit; */


 $query="select `html` from `page` where `page`='$_GET[page]' AND webpage ='1'";
 $rc=mysql_query($query) or die('<center>HTTP 404 Not Found!</center>');
 $row=mysql_fetch_array($rc);
 $var_html= $row[html];
 
$page_title =get_sitename();  //<title>

$smarty->assign("var_html",$var_html); 

$smarty->assign("page_title",$page_title); 
$smarty->display('page.tpl');
?>