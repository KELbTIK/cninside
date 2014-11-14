<?php
/**
 * MeePlace Classified thread's categories
 * @package MeePlace
 * @package Community
 * @example AJAX usage:
 *                    sele_item(this,0)  -    change List View to   (cat 0 ,  page 1 DEFAULT )\
 *                    get(0,0,1)  -    change  Menu View to   (cat ,  catsub ,  1)
 
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


include_once(dirname(__FILE__)."/../../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');


$cat=$_GET['cat'];
if(isset($_GET['cat']))
{
		if($_GET[cat]==0) //cat
		{
			 $str="SELECT * FROM `deals_cat`";
			 //$str="select * from business_sub_category where b_maincat_id=".$_GET['cat'];
			 $i=0;
			 $var_item=array();
			 $rc = mysql_query($str) or die ("Sorry! could not execute query $str ".mysql_error());
				while($row=mysql_fetch_array($rc)){
					//check if no sub?	
					$strSub="SELECT * FROM `deals_subcat` where `cat_id`='".$row['cat_id']."'";
					$rcSub = mysql_query($strSub) or die ("Sorry! could not execute query $str ".mysql_error());
					if(mysql_num_rows($rcSub))				
					{
						$var_item[$i]['catid']=$row['cat_id'];
						$var_item[$i]['catname']=l($row['cat_name']);
						$i+=1;
					}
				}
			
		}
		else // subcat
		{
			 $str="SELECT * FROM `deals_subcat` where `cat_id`='".$_GET[cat]."'";
			$rc = mysql_query($str) or die ("Sorry! could not execute query $str ".mysql_error());
			 $i=0;
				while($row=mysql_fetch_array($rc)){
				$var_item[$i]['subcatid']=$row['subcat_id'];
				$var_item[$i]['subcatname']=l($row['subcat_name']);
				$var_item[$i]['subcatidlink']=$row['subcat_id']+10000;
				$i+=1;
			  }
		}
}

$smarty->assign("var_item",$var_item); 
$smarty->assign("cat",$cat); 
$smarty->display('comm/classified/getmenu.tpl');
?> 
