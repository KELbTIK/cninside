<?php 
/**
 * MeePlace Advertisement Add Click. 
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
 
include_once(dirname(__FILE__).'/../inc/func/get_sth.php');
include_once(_ABSPATH_.'/inc/func/header.php');


$id=$_REQUEST['id'];
if($id) echo $ads->addClick($id);

?>