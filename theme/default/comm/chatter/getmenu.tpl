<div id="itemid" class="itemS"  onclick="sele_item(this,0);"><strong>{l t='All Categories'}</strong>
<table width="100%" border="0"  cellspacing="0">
<tr><td>&nbsp;</td><td></td></tr>
</table></div>
<!--loop-->
{foreach from=$var_item item=i}
<div id="itemid" class="item"  onclick="sele_item(this,{$i.catid});"><strong>{$i.catname}</strong>
<table width="100%" border="0"  cellspacing="0">
<tr><td width="25"><img src="../theme/{$get_theme}/images/alarm_clock.gif" /></td>
<td>{$i.lasttime}</td></tr>
</table></div>
{/foreach}
<!--/loop-->