{include file="header.tpl"}

{literal}

<style type="text/css">
<!--
#main {height:590px;}
#main .content { padding:5px; margin:0 10px;}
#main .content .left { float:left; width:68%; border-right:1px #ccc solid; padding-right:10px;}
#main .content .right {float:left; width:29%; margin-left:10px;}
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid;}
-->
 </style>

 <script type="text/javascript" language="javascript">
function fillform(n,s){
var d=document.postform;
d.list_name.value=n;
d.list_desc.value=s;
d.btn.focus();
}
</script> 
{/literal}
 <!--Main Start-->  
 
 <div id="main">
        <div class="content">
				<div class="left">
                       <div class="con" style="height:40px; padding-top:10px; padding-left:10px;">
            		    <h1>Edit List Description</h1>
                        <h5>Show off your favorites. Choose one of the list ideas on the right, or come up with one of your own.</h5>
                      </div>   
<div class="con" style=" height:490px; border-bottom:0; padding-top:20px; padding-left:10px;">
<form action="?f=submit&id={$var.id}" method="post" name="postform" id="postform">
<table width="60%" border="0" align="center">
<tr>
<td width="26%" height="37"><div align="right">List Name</div></td>
<td width="74%"><label>
<input name="list_name" style="width:300px;font-family:Verdana; font-size:12px; border:1px #ccc solid;" value="{$var.list_name}" />
</label></td>
</tr>
<tr>
<td height="98" valign="top"><div align="right">Description</div></td>
<td valign="top"><label>
<textarea name="list_desc" style="width:300px; height:80px; font-family:Verdana; font-size:12px; border:1px #ccc solid;">{$var.list_desc}</textarea>
</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>
<input type="submit" name="btn" id="btn" value="   Create &gt;&gt;   " onclick="this.disabled=true;form.submit()" />
</td>
</tr>
</table>

</form>
                  </div>
   	      </div>
                
                <div class="right" >
                  <div class="con" style="height:40px; padding-top:10px; padding-left:10px;">
                       <h1>List Ideas</h1>
                      <h5>Try one of ours. </h5>
                  </div> 
                  
<!--loop-->
{foreach from=$var_list item=i}
                  <div class="con" style=" padding-left:10px;">
                   <label><input type="radio" name="radio" id="radio" value="radio" onclick="fillform('{$i.tempN}','{$i.tempD}')" />
                    {$i.list_name} </label>
                    <h5>{$i.list_desc}</h5>
                  </div>
{/foreach}
<!--/loop-->               
                  
          </div>

        </div>
 </div>
 <!--Main End-->
  {include file="footer.tpl"} 