{include file="header.tpl"}

{literal}
<style type="text/css">
<!--
#main .content { padding:5px; margin:0 10px;}
#main .content .left { float:left; width:20%; padding-right:10px;}
#main .content .right {float:left; width:77%; padding-left:10px; }
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid;}
#main .content .con ul{list-style:none; padding:0; margin:0; margin-left:5px; margin-right:5px;}
#main .content .con ul li {float:left; width:260px; height:20px;}
-->
 </style>
<script type="text/javascript" language="javascript">
function veri()
{
if(!document.postform.topic.value)
{alert("Please input Topic Name"); return false;}
if(!document.postform.content.value)
{alert("Please input content"); return false;}
document.postform.btn.disabled=true;
return true;
}
</script>
 {/literal}
 <div id="main">

        <div class="content">
				<div class="left">
                 <div class="con box" style=" text-align:center; width:100% ;">
                    <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
                    <!-- START 160x600 Code -->
<p align="center">
 	{$ads->getAdCode(7)}
</p>
<!-- END Code -->
                    
                  </div> 
   	      </div>
                
                <div class="right" >
					      <div class="con box" style=" padding:5px;">
            		    <h2>{l t='New Conversation'}</h2>
                
                           <form action="?f=submit" method="post" name="postform" onsubmit="return veri();" id="postform">
                             <table width="96%" border="0" align="center">
                               <tr>
                                 <td width="14%" height="50"><div align="right"><strong>{l t='Topic'}</strong></div></td>
                                 <td>&nbsp;</td>
                                 <td width="85%"><label>
                                   <input name="topic" style="width:400px;font-family:Verdana; font-size:12px; border:1px #ccc solid;" id="topic" />
                                 </label></td>
                               </tr>
                               <tr>
                                 <td valign="top"><div align="right"><strong>{l t='Category'}</strong></div></td>
                                 <td valign="top">&nbsp;</td>
                                 <td valign="top">
                                 	<ul>
                                    		{$get_cat}
                                 	</ul>                                 </td>
                               </tr>
<tr>
              <td height="98" valign="top"><div align="right"><strong>{l t='Content'}</strong></div></td>
              <td valign="top">&nbsp;</td>
              <td valign="top"><label>
                  <textarea name="content" style="width:90%; height:180px; font-family:Verdana; font-size:12px; border:1px #ccc solid;" id="content"></textarea>
              </label></td>
              </tr>
                               <tr>
                                 <td height="40">&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                               </tr>
                               <tr>
                                 <td height="36">&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>
                                     <input type="submit" name="btn" id="btn" value="   {l t='Submit'} &gt;&gt;   " />                                </td>
                               </tr>
                             </table>
                                       
                           </form>
                  </div>
                  </div>
        </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}