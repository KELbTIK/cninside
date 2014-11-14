{include file="header.tpl"}
<script>
var id={$var.id};
</script>
{literal}
<style type="text/css">
<!--
#main .content { padding:5px; margin:0 10px;}
#main .content .left {float:left; width:77%; }
#main .content .right { float:left; width:20%; margin-left:10px;border-left:1px #ccc solid;}
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid;}
#main .content .con ul{list-style:none; padding:0; margin:0; margin-left:5px; margin-right:5px;}
#main .content .con ul li {float:left; width:260px;}
 td{ border-bottom:1px #ccc dashed;}
 td p{padding:3px; margin:0;}
-->
 </style>
<script type="text/javascript">
function get(nothing,page)
{
location='?page='+page+'&id='+id;
}
</script>
{/literal}

 <!--Main Start-->  
 
 <div id="main">

        <div class="content">
				<div class="left">
                <div class="con" style=" padding-top:10px; padding-left:10px;">
            		    <h1>{l t='List Detail'}</h1>
</div>
<div class="con" style="padding-left:10px;">
       		      <h1>{$var.list_name}</h1> {$var.list_desc}
<h3>{l t='Author'}: <a href="../?id={$var.user_create}" target="_blank">{$var.user_create_name}</a></h3>
<h3>{l t='Established'}: {$var.date_create_formated}</h3>
                      
                </div>   
           <div class="con" style=" border-bottom:0; padding-top:20px; padding-left:10px;">
<!--loop-->
{foreach from=$var_list item=i}
<div class="con" id="clear">
                        	    <div>
                                  <div style="float:left"><h2><a href="/{$smarty.const._BIZ_DIR_}/{$i.bizurl}" target="_blank">{$i.name}</a></h2></div>
                                                <div style="float:right">
                                                 <h5><em>{l t='Business Rating'}:</em> <span style="color:red; font-size:14px; font-weight:bold;">{$i.rating}</span> &nbsp; <img src="../../theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" /></h5>
                                                </div>
          </div>
                                <div id="clear"></div>
   		  <div></div>
                                <div id="clear"></div>
                          				<div>
{l t='Category'}: {$i.catname} / {$i.subcatname}<br />
                             {l t='City'}: {$i.location}
		  </div>
             </div>
{/foreach}
<!--/loop-->
			<div style="float:left; margin-top:20px;">{l t='Show'} {$var_lists.limitfrom} {l t='to'} {$var_lists.limitto} / {$var_lists.itemsnum} {l t='items'}.</div>
        {if !$var_lists.found}
        <br id="clear"/><br/><br><br><center>{l t='No result found'}.</center><br><br><br>
        {else}
		    {$var_lists.pager}
        {/if}

</div>
   	      </div>
                
                <div class="right" >
                 <div class="con" style=" padding-left:10px; border:0;">
<p align="center">
 	{$ads->getAdCode(3)}

</p>
                  </div> 
                  </div>
        </div>
 </div>
 <!--Main End-->
  {include file="footer.tpl"} 
