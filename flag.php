<?php
/**
 * MeePlace flag a comment
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



if($_POST)
{
///// zone
///// 0 = chatter
///// 1 = deals
///// 2 = business
$topicid=intval($_POST[topicid]);
$replyid=intval($_POST[replyid]);
$zone=intval($_POST[zone]);
$comment=strip_tags($_POST[reason]." - ".$_POST[comment]);
$comment=nl2br(strip_tags(trim($comment)));

$query="insert into `flag` (`topicid`,`replyid`,`comment`,`zone`) values ('$topicid','$replyid','$comment','$zone')";
$rc=mysql_query($query) or die('ERROR!');
echo "<script>parent.$.fn.fancybox.close(); alert('Successful Reported!');</script>";
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/theme/<?=_THEME_?>/mgt/body/css/common.css" rel="stylesheet" />
</head>

<body id="popup">

            <form name="flag" action="flag.php" method="post">
<TABLE cellSpacing=1 cellPadding=4 width="100%"  border=0>
  <TBODY>
  <TR class="td_title">
    <TD  colSpan=2>Flag Request</TD></TR>
  <TR bgColor=#ffffff>
  <td colspan="2">Are you sure you want to flag this item? An alert will be sent to us</td>
  </tr>
  <TR bgColor=#ffffff>
     <TD width="30%"  align="center" class="td_th">Reason</TD>
  <td width="70%">
    <input type="hidden" name="topicid" id="topicid" value="<?=$_REQUEST[topicid]?>" />
    <input type="hidden"  name="replyid" id="replyid" value="<?=$_REQUEST[replyid]?>"/>
    <input type="hidden" name="zone" id="zone" value="<?=$_REQUEST[zone]?>" /> 
    <select name="reason" id="reason">
    <option>Offensive Comment</option>
    <option>Personal Attack</option>
    <option>Personal Information</option>
    <option>Illegal Activity</option>
    <option>Spam</option>
    <option>Other</option>
            </select></td>
            
  </tr>
  <TR bgColor=#ffffff>
     <TD align="center" class="td_th">Comment</TD>
  <td>
<textarea name="comment" rows="4" style="width:300px; height:200px;"></textarea></td>
  </tr>
  <TR bgColor=#ffffff>
  <td> </td>
  <td><input name="btn" type="submit" id="btn" value="   Submit   "   />
    <input type="button" value="X" onClick="parent.$.fn.fancybox.close(); "  style="width:20px;"/></td>
  </tr>
</table></form>
         </body>
</html>
