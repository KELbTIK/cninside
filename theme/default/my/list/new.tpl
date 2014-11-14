
{include file="header.tpl"}

<script>
var t_listnamecannotbeempty='{l t='List name cannot be empty!'}';
</script>

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

function veri(){
var d=document.postform;
d.list_name.value=d.list_name.value.replace(/(^\s*)|(\s*$)/g, "");
if(d.list_name.value) d.submit();
else{
alert(t_listnamecannotbeempty); 
d.btn.disabled=false;
}

}
</script> 
{/literal}
 <!--Main Start-->  
 
 <div id="main">
        <div class="content">
				<div class="left">
                       <div class="con" style="height:40px; padding-top:10px; padding-left:10px;">
            		    <h1>{l t='Create A New List'}</h1>
                        <h5>{l t='Show off your favorites. Choose one of the list ideas on the right, or come up with one of your own.'}</h5>
                      </div>   
<div class="con" style=" height:490px; border-bottom:0; padding-top:20px; padding-left:10px;">
<form action="new.php?f=submit" method="post" name="postform" id="postform">
<table width="60%" border="0" align="center">
<tr>
<td width="26%" height="37"><div align="right">{l t='List Name'}</div></td>
<td width="74%"><label>
<input name="list_name" style="width:300px;font-family:Verdana; font-size:12px; border:1px #ccc solid;" />
</label></td>
</tr>
<tr>
<td height="98" valign="top"><div align="right">{l t='Description'}</div></td>
<td valign="top"><label>
<textarea name="list_desc" style="width:300px; height:80px; font-family:Verdana; font-size:12px; border:1px #ccc solid;"></textarea>
</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>
<input type="button" name="btn" id="btn" value="   {l t='Create'} &gt;&gt;   " onclick="this.disabled=true;veri();"  />
</td>
</tr>
</table>

</form>
                  </div>
   	      </div>
                
                <div class="right" >
                  <div class="con" style="height:40px; padding-top:10px; padding-left:10px;">
                       <h1>{l t='List Ideas'}</h1>
                      <h5>{l t='Try one of ours.'}</h5>
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
