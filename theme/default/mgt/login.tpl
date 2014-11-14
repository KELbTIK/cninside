{include file="header.tpl"}
{literal}
<style type="text/css">
<!--
#main {height:auto; border:none}
#wrap{-moz-border-radius-bottomleft:6px;
-moz-border-radius-bottomright:6px;
-moz-border-radius-topleft:6px;
-moz-border-radius-topright:6px;-moz-box-shadow:0 4px 18px #C8C8C8;
-webkit-border-bottom-left-radius: 6px 6px;
-webkit-border-bottom-right-radius: 6px 6px;
-webkit-border-top-left-radius: 6px 6px;
-webkit-border-top-right-radius: 6px 6px;
-webkit-box-shadow:#C8C8C8 0px 4px 18px;
width:400px; margin:70px auto; border:1px #ccc solid;}

-->
 </style>
 {/literal}

 <!--Main Start-->
 <div id="main">
 <div id="wrap">
 <!-- MeePlace {$smarty.const._VERSION_} -->
<form id="form1" name="form1" method="post" action="?f=login">
  <table width="100%" border="0" cellspacing="5">
    <tr>
      <td width="45%" height="50" align="right" valign="bottom">{l t='Admin Email'}</td>
      <td valign="bottom"><label>
        <input type="text" name="adminuser" id="adminuser" value="{$smarty.post.adminuser}" />
      </label></td>
    </tr>
    <tr>
      <td width="45%" height="40" align="right" valign="bottom">{l t='Password'}</td>
      <td valign="bottom"><input type="password" name="password" id="password"  value="{$smarty.post.password}"/></td>
    </tr>
    <tr>
      <td height="41" align="right" valign="bottom">{l t='Secure Code'}</td>
      <td valign="bottom"><input type="input" name="r" id="r" style="width:50px;" /> <img src="auth_img.php" /></td>
    </tr>
    <tr>
      <td></td>
      <td><div style="float:left; margin:0 auto;background-color:#FF9; color:red; font-weight:bold; display:{if $loginfail!=1}none{/if}">Invalid Username or Password!
      </div>
      <div style="float:left; margin:0 auto;background-color:#FF9; color:red; font-weight:bold; display:{if $loginfail!=2}none{/if}">Invalid Secure Code!
      </div></td>
    </tr>
    <tr>
      <td height="22" align="center" valign="center">&nbsp;</td>
      <td height="22" valign="center"><a href="resetpsw.php" style="font-size:11px">Forgot admin password?</a></td>
    </tr>
    <tr>
      <td height="80" colspan="2" align="center" valign="center"><label>
        <input type="submit" name="button" id="button" value="    {l t='Log in'}    " />
      </label></td>
    </tr>
  </table>
</form>
</div>
 </div>
 <!--Main End-->
{include file="footer.tpl"}