{include file="header.tpl"}

<!--Main Start-->  

<div id="main">
<div class="content">
<div class="left">
<div class="con box">
<span class="coner c1"></span>
<span class="coner c2"></span>
<span class="coner c3"></span>
<span class="coner c4"></span>
<h2>{l t='Reset Admin Password'}</h2>

{if $var_notice!=''}

	{$var_notice}

{else}
<div>
<form action="?f=submit" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="41" colspan="2" valign="top"><h5>{l t='To reset your password, please fill the blanks below:'}</h5></td>
</tr>
<tr>
<td width="37%" height="30"><h3>{l t='Admin Login Email(Username)'}:</h3></td>
<td width="63%"><input type="text" name="email" id="email" /></td>
</tr>
<tr>
<td><h3>{l t='Secure Code'}:</h3></td>
<td><input name="r" id="r" type="text" size="4" /><img src="./auth_img.php" /></td>
</tr>
<tr>
<td colspan="2" height="50" align="center"><input type="submit" name="button" id="button" value="   {l t='Send'} &gt;&gt;   " onclick="this.disabled=true; form.submit()" /></td>
</tr>
</table>
</form>
</div>
{/if}
</div>
</div>

<div class="right" >
<div class="con box" style=" padding-left:10px; text-align:center;">
<span class="coner c1"></span>
<span class="coner c2"></span>
<span class="coner c3"></span>
<span class="coner c4"></span>
<p align="center">
 	{$ads->getAdCode(3)}
</p>

</div>
</div>

</div>
</div>
<!--Main End-->
{include file="footer.tpl"}
