{include file="header.tpl"}
{literal}
<style type="text/css">
<!--
#main .content { padding:5px; margin:0 10px;}
#main .content .left {float:left; width:77%; }
#main .content .right { float:left; width:20%; margin-left:10px;}
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid;}
#main .content .con ul.cat{list-style:none; padding:0; margin:0; margin-left:5px; margin-right:5px;}
#main .content .con ul.cat li {float:left; width:260px; height:20px;}
td{ border-bottom:1px #ccc dashed;}
td p{padding:3px; margin:0;}
-->
</style>

<script>
function veri()
{
if(!document.postform.event_name.value)
{
alert('Please input event name');
return false;	
}
document.postform.btn.disabled=true;
return true;
}

</script>

{/literal}

<!--Main Start-->  

<div id="main">

<div class="content">
<div class="left">
<div class="con box" style=" padding:5px; ">
<h2>{l t='Add New Blog'}</h2>
<span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
<form action="?f=submit" method="post" name="postform" onSubmit="return veri()" id="postform" enctype="multipart/form-data">
<table width="96%" border="0" align="center" >
<tr>
<td width="21%" height="37"><div align="right"><strong>{l t='Blog Title'} </strong></div></td>
<td width="1%">&nbsp;</td>
<td colspan="4"><label>
<input name="blog_title" type="text" style="width:400px;font-family:Verdana; font-size:12px; " id="blog_title" />
</label></td>
</tr>
<tr>
<td height="60">&nbsp;</td>
<td width="1%">&nbsp;</td>
<td colspan="4" align="center">
<input type="submit" name="btn" id="btn" value="   {l t='Submit'} &gt;&gt;   " />                                </td>
</tr>
</table>
</form>
</div>
</div>

<div class="right" >
<div class="con box" style="text-align:center; width:200px;">
<span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
<p align="center">
{$ads->getAdCode(5)}
</p>

</div> 
</div>
</div>
</div>
<!--Main End-->
 {include file="footer.tpl"}