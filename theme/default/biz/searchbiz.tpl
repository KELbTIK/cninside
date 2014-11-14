{include file="header.tpl"}

<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/biz_search.css" />
{literal}

<script type="text/javascript">
$(document).ready(function() {
    // Hide the "view" div.
    if($.cookie("search_filter")== "no")
    {$('div.view').hide();}
    // Watch for clicks on the "slide" link.

    $('h2.slide').click(function() {
    // When clicked, toggle the "view" div.
        $('div.view').slideToggle(400);
        if($.cookie("search_filter")== "no")
            {$(this).addClass("active");
             $.cookie("search_filter", "yes");
            }
        else
            {$(this).removeClass("active");
            $.cookie("search_filter", "no");
            }
        return false;
    });
});

</script>


{/literal}
 <!--Main Start-->  
 
<div id="main">

<div class="content" style=" margin:0; padding:0">
    
             <div class="left" style=" padding:0; margin:0; padding-left:20px; border:none; width:73%;">
             
            
               <div class="box searchbox blue" style="height:auto; margin-bottom:10px;">
        <span class="coner c1b"></span>
        <span class="coner c2b"></span>
        <span class="coner c3b"></span>
        <span class="coner c4b"></span>
        
      <h1>{l t='Search Again'}</h1>
            <form action="/biz/searchbiz.php" name="form1" method="get">
<table cellspacing="0" cellpadding="0" width="100%" border="0">
          <tbody>
            <tr>
              <td width="50%">{l t='Keyword'}
              </td>
              <td colspan="2">{l t='Near'} </td>
            </tr>
            <tr>
              <td><label>
              <input type="hidden" name="page" id="page" value="1" />
              <input type="hidden" name="sort_by" id="_sort_by" value="1" />
                <input type="text" name="srm" id="srm" value="{$var_keyword}" size="50" style="width:300px" />
              </label></td>
              <td width="30%">
             <div  style="position:relative"> 
              <label><input type="text" name="city"  id="searchcity" value="{$var_cityname}" autocomplete="off" class="cityname"  />
            </label>
                 
<div id="searchcity_div2" class="searchbarlist"></div>
                </div>
            </td>
              <td width="20%"><input type="submit" value="{l t='Search'} &raquo;" /></td>
            </tr>
            <tr>
              <td height="20"><em>{l t='e.g. McDonald\'s.'}</em></td>
              <td height="20" colspan="2"><em>{l t='(City name)'}</em></td>
            </tr>
          </tbody>
        </table>
</form>            </div>
             
             

<div id="clear"></div>



        <!--loop-->
        {foreach from=$var_list item=i}
                     <div class="con">
                            <div style="float:left; width:100px; text-align:center; height:100px"><div class="photoBox" style=" overflow:hidden; width:84px; height:84px;"><a href="/{$smarty.const._BIZ_DIR_}/{$i.bizurl}"><img src="/images/business/{$i.picurl}_80x80" /></a></div></div>
                              <div style="float:left; padding-left:10px; width:550px;">
                                <div style="float:left;"><h3><a href="/{$smarty.const._BIZ_DIR_}/{$i.bizurl}">{$i.bizname}</a>{$i.starbiz}</h3></div><div style="float:right;"><h5><em>{l t='Rating'}:</em> <span style="color:red; font-size:14px; font-weight:bold;">{$i.rating}</span> &nbsp; <img src="/theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" /></h5></div>
                          <div id="clear">
                        <div style="float:left">
                        {l t='Category'}: <a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/">{$i.catname}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/{$i.subcatpermalink}/">{$i.subcatname}</a><br />
                        {if $i.catid2 != '0'}
                        <span style="color:#FFF">{l t='Category'}: </span><a href="/{$smarty.const._CAT_DIR_}/{$i.cat2permalink}/">{$i.catname2}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$i.cat2permalink}/{$i.subcat2permalink}/">{$i.subcatname2}</a><br />
                        {/if}
                        {if $i.catid3 != '0'}
                        <span style="color:#FFF">{l t='Category'}: </span><a href="/{$smarty.const._CAT_DIR_}/{$i.cat3permalink}/">{$i.catname3}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$i.cat3permalink}/{$i.subcat3permalink}/">{$i.subcatname3}</a><br />
                        {/if}
                        <address>{$i.add1}  <br />{$i.add2}<br />
                {$i.location}, {$i.state} {$i.zip}
                  </address>
                  </div>
                                  <div style="float:right;"><h5>{l t='Click'}: {$i.click} &nbsp;  {l t='Reviews'}: {$i.reviewnum}</h5></div>
                               
                           
                  {if $i.type==2 && $i.extra}
                      <div style="background:#ffc; clear:both; padding:3px 8px; border:1px #ccc solid;">
                      <img src="/images/photos/p_{$i.submitter_photo}_16x16" />
                      {$i.extra}</div>
                  {/if}
                  {if $i.type==1 && $i.extra}
                      <div style="background:#ffc; clear:both; padding:3px 8px; border:1px #ccc solid;">
                      {$i.extra}</div>
                  {/if}    
                               
                               </div>
                              </div>
                    </div>
                    <div id="clear"></div>
                    {/foreach}
                    <!--/loop-->
{if $var_lists.found==''}
         <br/><br/><br><br><center>{l t='No result found'}.</center><br><br><br>
         {else}
         <div>
                <div style=" float:left; padding-top:20px; padding-left:20px;">{l t='Show'} {$var_lists.limitfrom} {l t='to'} {$var_lists.limitto} / {$var_lists.itemsnum} {l t='items'}.</div>
             {$var_lists.pager}
            </div> 
         {/if}
         
         

             <div id="clear"></div>
             <div class="box" style="border-top:#ccc 1px solid; padding:5px; width:98%; margin-bottom:20px">
          <span class="coner c1"></span>
    <span class="coner c2"></span>
    <span class="coner c3"></span>
    <span class="coner c4"></span>
                      <h2 style="margin-bottom:0; border:0">{l t='The business you\'re looking for isn\'t here?'} <a href="/{$smarty.const._BIZ_DIR_}/new.php" class="Bbtn">{l t='Add Business'}</a></h2>
                    </div>
             </div>  
             <div class="right" style=" width:225px; margin:0; padding:0">
             {if $categories}
             <div class="box rightbox catbox change">
             <span class="coner c1"></span>
            <span class="coner c2"></span>
            <span class="coner c3"></span>
            <span class="coner c4"></span>
            
                {if $reset} {$reset}{/if}
               {if $categories}
               <h2> {l t='Categories'}</h2>
               {$categories}
               {$sort_by_section}
               {/if}
               
               {if $features}
               <h2 class="slide" style="cursor: pointer;">{l t='Features'}</h2>
               {$features}
               {/if}
               
               </div>
               {/if} 
                
                
               <div class="box rightbox">
             <span class="coner c1"></span>
            <span class="coner c2"></span>
            <span class="coner c3"></span>
            <span class="coner c4"></span>
                     <!-- START 160x600 Code -->
<p align="center">
{$ads->getAdCode(5)}
</p>
<!-- END Code -->
       
                  </div>
             </div>
        </div>               
 </div>
 <!--Main End-->
 {include file="footer.tpl"}