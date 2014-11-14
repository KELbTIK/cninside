{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7521.css" />
{literal}
<style media="screen,projection" type="text/css"> 
	a.button{ padding:5px; font-size:12px; background:#61A2CC; color:#fff; -webkit-border-radius: 5px;-webkit-box-shadow:#666 0px 0px 4px;-moz-border-radius:5px;-moz-box-shadow:#666 0px 0px 4px;text-shadow:#000 0px 1px 1px;border: 1px solid #159; font-weight:bold;}
	.button img{ vertical-align:middle}
	a.button:hover{ text-decoration:none; background:#48A; }
</style> 
{/literal}
 <!--Main Start-->  
<div id="main">
<div class="content">
<div class="left">
<div class="con box">
<span class="coner c1"></span>
<span class="coner c2"></span>
<span class="coner c3"></span>
<span class="coner c4"></span>
 <h2>{l t='Upload my new photo'}</h2>
 
 

<div id="btns" style=" position:absolute; right:10px; top:16px;">
<a href="./gallery.php?id={$var_me.user_id}" class="button"><img src="/theme/{$smarty.const._THEME_}/images/b_prevpage.png" border="0"/> &nbsp;{l t='Back to Gallery'}</a>
</div>
 
   <form action="?f=submit" method="post" name="frm" id="frm" enctype="multipart/form-data">
 <table width="100%" border="0" cellspacing="0">
  <tr>
    <td width="40%" height="100" align="center"><h3>{l t='Attach Picture'}</h3></td>
    <td><input type="file" name="file" id="file" />
(Type: JPEG GIF)</td>
  </tr>
  <tr>
    <td width="40%" height="120" align="center">&nbsp;</td>
    <td><label>
      <input type="button" name="button" id="button" value="{l t='Upload'}"  style="height:40px; width:180px;" onclick="this.disabled=true;submit()"/>
    </label></td>
  </tr>
</table>

</form> </div>
</div>


<div class="right">
<div class="con box" style=" padding:1px; text-align:center;">
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