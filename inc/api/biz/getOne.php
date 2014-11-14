<?php 
include_once(dirname(__FILE__)."/../../../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

$biz_id=(int)$_GET['biz_id'];
if(!$biz_id) die('{"STATUS","404"}');

$bizObj= new MP_Business();
$bizObj->biz_id= $biz_id;
$bizArr= $bizObj->get();

echo json_encode($bizArr);
?>
