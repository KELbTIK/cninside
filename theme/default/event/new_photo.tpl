{include file="header.tpl"}
{literal}
<style type="text/css">
<!--
#main {height:auto;}
-->
 </style>
 {/literal}
 <!--Main Start-->  
 <div id="main">
 <h1 style="padding:10px 20px; border-bottom:1px #ccc solid; margin:5px 10px;">{l t='Upload photo for %s' r=$var_biz.bizname}</h1>
   <form action="?f=submit&id={$var_biz.bizid}" method="post" name="frm" id="frm" enctype="multipart/form-data">
 <table width="100%" border="0" cellspacing="0">
  <tr>
    <td width="40%" height="100" align="center"><h3>{l t='Attach Picture'}</h3></td>
    <td><input type="file" name="file" id="file" />
(Type: JPEG GIF)</td>
  </tr>
  <tr>
    <td width="40%" height="80" align="center">&nbsp;</td>
    <td><label>
      <input type="button" name="button" id="button" value="{l t='Upload'}"  style="height:40px; width:180px;" onclick="this.disabled=true;submit()"/>
    </label></td>
  </tr>
</table>

</form> </div>
 <!--Main End-->
 {include file="footer.tpl"}