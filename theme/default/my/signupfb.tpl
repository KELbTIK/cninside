{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7026.css" />

<!--Main Start-->  

<div id="main">
<div class="content">
<div class="left">
<div class="con box">
<span class="coner c1"></span>
<span class="coner c2"></span>
<span class="coner c3"></span>
<span class="coner c4"></span>
<h2>{l t='Complete Profile'}</h2>

<div>
<form action="?" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="41" colspan="2" valign="top"><h5>{l t='Welcome'} {$smarty.session.display_name}. {l t='Please complete your profile.'}</h5></td>
</tr>
<tr>
<td width="37%" height="30"><h3>{l t='Email Address'}:</h3></td>
<td width="63%"><input type="text" name="email" id="email" value="{$smarty.post.email}" />
{if $loginfail==1} <span style="color:red">{l t='Email is required'}</span>{/if}
{if $loginfail==2} <span style="color:red">{l t='Please enter valid email address'}</span>{/if}
{if $loginfail==3} <span style="color:red">{l t='Email already in use'}</span>{/if}</td>
</tr><!--
<tr>
<td height="40"><h3>{l t='Nickname'} </h3></td>
<td height="40"><input type="text" name="nickname" id="nickname" value="{$smarty.post.nickname}"  />{if $loginfail==4} <span style="color:red">{l t='Nickname already in use'}</span>{/if}</td>
</tr>-->
<tr>
<td colspan="2" height="50" align="center"><input type="submit" name="button" id="button" value="   {l t='Next'} &gt;&gt;   " onclick="this.disabled=true; form.submit()" /></td>
</tr>
</table>
</form>
</div>
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
