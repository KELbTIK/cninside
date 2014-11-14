<?php
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

$lang = new MP_Language ();

$set_l=$_GET['lang'];

if($set_l) $lang->setCookieLanguage($set_l) or die('Failed to set Cookie. Please enable your cookie in browser.');

header('Location: '.$_SERVER['HTTP_REFERER']);
